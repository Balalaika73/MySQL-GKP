use gkp;


DELIMITER $$
CREATE TRIGGER insert_pos
BEFORE INSERT ON position
FOR EACH ROW
BEGIN
  IF (EXISTS(SELECT 1 FROM position WHERE Name_Position = NEW.Name_Position)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'Данная запись уже есть в таблице';
  END IF;
END$$
DELIMITER ;

insert into Position (Name_Position)
values ('Хирург');

DELIMITER $$
CREATE TRIGGER update_sick_list
BEFORE update ON Sick_List
FOR EACH ROW
BEGIN
  IF OLD.Sick_List_Number != new.Sick_List_Number THEN set new.Sick_List_Number = OLD.Sick_List_Number;
    END IF;
END$$
DELIMITER ;

update sick_list 
set Sick_List_Number = "1234567896",
Sick_List_Opening_Date = '2022-01-06'
where Id_Sick_List = 1; 


DELIMITER $$
CREATE TRIGGER del_client1
before delete ON clients
FOR EACH ROW
BEGIN
    INSERT INTO Del_Clients values (null, old.Second_Name, old.First_Name, old.Middle_Name, old.Passport_Used_By, old.Date_Of_Issue, old.Division_Code,
old.Gender, old.Date_Of_Burth, old.Place_Of_Burth, old.Passport_Serries, old.Id_Passport, old.Details_Of_Snils, old.Details_Of_The_Mhif_Police,
old.Contact_Number, old.Gmail_Cl, old.Login_Cl, old.Password_Cl);
    set foreign_key_checks = 0;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER del_client2
after delete ON clients
FOR EACH ROW
BEGIN
    set foreign_key_checks = 1;
END$$
DELIMITER ;

delete from clients
where id_client = 9;
select * from clients;
select * from del_clients;

DELIMITER $$
CREATE TRIGGER insert_ticket
before INSERT ON ticket
FOR EACH ROW
BEGIN
  IF new.Date_Of_Reception < sysdate() THEN
    SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Записаться нужно на будущую дату.';
    END IF;
END$$
DELIMITER ;

insert into ticket (Date_Of_Reception, Treatment_Employee_Id, Personal_Outpatient_Card_Id, Time_Of_Reception, Ticket_Number)
    values ('2020-07-20', 1,1, '14:00:00', '3390000009');