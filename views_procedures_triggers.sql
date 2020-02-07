
CREATE TABLE `sprint3_schema`.`Issue` (
  `issue_id` INT AUTO_INCREMENT,
  `User_id` INT(11) ,
  `date` DATETIME ,
  `content` LONGTEXT ,
  `status` VARCHAR(10) ,
  PRIMARY KEY (`issue_id`),
  INDEX `User_id_idx` (`User_id` ASC) VISIBLE,
  CONSTRAINT `User_id`
    FOREIGN KEY (`User_id`)
    REFERENCES `sprint3_schema`.`Registered_Customer` (`User_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

insert into Issue(User_id, date, content, status)
values (1, now(), "Unable to book the tickets", "Pending"),
(2, now(), "Unable to view tickets", "Solved");

CREATE TABLE `sprint3_schema`.`Issue_solution` (
  `solution_id` INT AUTO_INCREMENT,
  `issue_id` INT ,
  `Admin_id` INT(11) ,
  `date` DATETIME ,
  `content` LONGTEXT ,
  INDEX `issue_id_idx` (`issue_id` ASC) VISIBLE,
  INDEX `Admin_id_idx` (`Admin_id` ASC) VISIBLE,
  PRIMARY KEY (`solution_id`),
  CONSTRAINT `issue_id`
    FOREIGN KEY (`issue_id`)
    REFERENCES `sprint3_schema`.`Issue` (`issue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Admin_id`
    FOREIGN KEY (`Admin_id`)
    REFERENCES `sprint3_schema`.`Admin` (`Admin_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
 insert into Issue_solution(issue_id, Admin_id, date,content)
 values(1,3,now(), ""),
 (2,3,now(), "View is now available. Please check!");

create view tickets_booked 
as
select User_id AS 'User ID', Seat_number AS 'Seat Number', Source_journey AS 'From', Destination_journey AS 'To', Date_of_journey AS 'Journey date', Fare AS 'Fare', Transportation_name AS 'Transportation name', Transportation_type AS 'Transportation type', Vehicle_number AS 'Vehicle number'
from ticket INNER JOIN Transportation USING(Transportation_id) INNER JOIN transportation_mode USING(Mode_ID);

create view pending_issues
as
select Issue.issue_id AS 'ISSUE ID', Issue.content AS 'ISSUE DESCRIPTION', Issue.date AS 'CREATED ON', User_id AS 'CREATED BY USER ID'
from Issue INNER JOIN Issue_solution USING(issue_id)
where status="Pending";


DROP procedure IF EXISTS `search`;
DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `search` (IN src varchar(40), IN dest varchar(40), IN dt datetime)
BEGIN
select Source_journey, Destination_journey, Date_of_journey, Transportation_name, Transportation_type, Number_of_available_seats
from Transportation INNER JOIN Transportation_Mode USING (Mode_ID)
where Source_journey=src or Destination_journey=dest OR  Date_of_journey=dt;
END$$
DELIMITER ;



DROP procedure IF EXISTS `book`;
DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `book` (IN ticket_id_taken varchar(100), IN transportation_ID_chosen int(11), IN user_id_of_customer int(11), IN seat_number_chosen varchar(100) )
BEGIN
insert into Ticket(Ticket_id, Transportation_id, Seat_number, User_id)
values(ticket_id_taken, transportation_ID_chosen, seat_number_chosen, user_id_of_customer);
END$$
DELIMITER ;

DROP procedure IF EXISTS `update_seats_after_book`;
DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `update_seats_after_book` (IN transportation_ID_chosen int(11))
BEGIN
update Transportation INNER JOIN Transportation_Mode USING (Mode_ID)
SET Number_of_available_seats=Number_of_available_seats-1
where Transportation_id=transportation_ID_chosen;
END$$
DELIMITER ;


DROP procedure IF EXISTS `cancel`;
DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `cancel` (IN Transportation_ID_chosen int(11) , IN User_ID_of_Customer int (11))
BEGIN
delete from Ticket
where Transportation_id=Transportation_ID_chosen AND User_id=User_ID_of_Customer;
END$$
DELIMITER ;


DROP procedure IF EXISTS `update_seats_after_cancel`;
DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `update_seats_after_cancel` (IN transportation_ID_chosen INT(11))
BEGIN
update Transportation INNER JOIN Transportation_mode USING (Mode_ID)
SET Number_of_available_seats=Number_of_available_seats+1
where Transportation_id=transportation_ID_chosen;
END$$
DELIMITER ;


DELIMITER $$
USE `sprint3_schema`$$
CREATE PROCEDURE `raise_issue` (IN content_of_issue longtext, IN user_id_of_cutomer int(11))
BEGIN
insert into Issue(user_id, content, date)
values(user_id_of_cutomer, content_of_issue, now());
update Issue
set status="Pending"
where user_id=user_id_of_cutomer AND content=content_of_issue;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_ticket_books
AFTER INSERT
ON Transportation_Mode FOR EACH ROW
BEGIN
	IF Number_of_available_seats-1 >= 0
    THEN 
    Call update_seats_after_book(Transportation_id);
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_ticket_cancels
BEFORE DELETE
ON Transportation_Mode FOR EACH ROW
BEGIN
	IF Number_of_available_seats+1 <= total_number_of_seats 
    THEN CALL update_seats_after_cancel (Transportation_id);
    END IF;
END$$
DELIMITER ;


