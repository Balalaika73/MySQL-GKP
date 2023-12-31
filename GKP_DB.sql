create database GKP;
use GKP;

create table Clients
(
	Id_Client INT NOT NULL auto_increment primary key,
	Second_Name varchar(30) not null,
	First_Name varchar(20) not null,
	Middle_Name varchar(30) null default '-',
	Passport_Used_By varchar(70) not null,
	Date_Of_Issue date not null check (Date_Of_Issue < sysdate()),
	Division_Code varchar(7) not null check (regexp_like(Division_Code, '[0-9]{3}\\-[0-9]{3}')),
	Gender varchar(3) not null check (Gender in ('Жен', 'Муж')),
	Date_Of_Burth date not null check (Date_Of_Burth < sysdate()),
	Place_Of_Burth varchar(50) not null,
	Passport_Serries int not null,
	Id_Passport int not null,
	Details_Of_Snils varchar(14) not null unique check (regexp_like(Details_Of_Snils, '[0-9]{3}\\-[0-9]{3}\\-[0-9]{3}\\-[0-9]{2}')),
	Details_Of_The_Mhif_Police varchar(19) not null unique check (regexp_like(Details_Of_The_Mhif_Police, '[0-9]{4}\\ [0-9]{4}\\ [0-9]{4}\\ [0-9]{4}')),
	Contact_Number varchar(17) not null unique check (regexp_like(Contact_Number, '[0-9]{11}')),
	Gmail_Cl varchar(50) not null unique check (Gmail_Cl like '%@%.%'),
	Login_Cl varchar(32) not null unique check (length(Login_Cl) >= 5) check (regexp_like(Login_Cl, '[a-zA-Z0-9]')),
	Password_Cl varchar(32) not null check (length(Password_Cl) >= 8) check (regexp_like(Password_Cl, '[!@#$%]')) check (regexp_like(Password_Cl, '[a-zA-Z0-9]'))
);
insert into Clients(Second_Name, First_Name, Middle_Name, Passport_Used_By, Date_Of_Issue, Division_Code,
Gender, Date_Of_Burth, Place_Of_Burth, Passport_Serries, Id_Passport, Details_Of_Snils, Details_Of_The_Mhif_Police,
Contact_Number, Gmail_Cl, Login_Cl, Password_Cl)
values ('Петров', 'Игорь', 'Васильевич', 'ГУ МВД России по г.Москве', '2012-06-20', '770-121', 'Муж', '1999-08-04', 'гор. Москва', '4601', '729721', '123-456-780-01', '7700 0000 0005 2111', '89852346541', 'petrov@gmail.com', 'Petrov1', 'Pa$$w0rd'),
('Арсеньтев', 'Петр', 'Игоревич', 'Отделом УФМС по гор. Новосибирск', '2015-12-07', '540-006', 'Муж', '1972-04-27', 'гор. Новосибирск', '4512', '729722', '123-456-780-02', '7700 0000 0005 2112', '89346782190', 'arsentev@gmail.com', 'Arsentev1', 'Pa$$w0rd'),
('Петров', 'Олег', 'Викторовчич', 'Отделом России по гор. Кемерово', '2018-04-01', '420-018', 'Муж', '1986-10-07', 'гор. Кемерово', '3407', '729723', '123-456-780-03', '7700 0000 0005 2113', '89841217839', 'petrov@yandex.ru', 'Petrov2', 'Pa$$w0rd'),
('Цапкина', 'Елена', 'Сергеевна', 'Отделом УФМС России по гор. Москве', '2015-09-17', '770-060','Жен', '1992-06-14', 'гор. Москва', '4102', '729724', '123-456-780-04', '7700 0000 0005 2114', '89335653488', 'capkina@gmail.com', 'Capkina1', 'Pa$$w0rd'),
('Малинкина', 'Мария', 'Олеговна', 'ГУ МВД России по г. Москве', '2013-08-27', '770-121', 'Жен', '1978-05-20', 'гор. Москва', '3814', '729725', '123-456-780-05', '7700 0000 0005 2115', '89830089137', 'malinkina@gmail.com', 'Malinkina1', 'Pa$$w0rd'),
('Сергеев', 'Дмитрий', 'Иванович', 'Отделом УФМС России по гор. Москве', '2004-11-01', '620-006', 'Муж', '1983-07-10', 'гор. Москва', '5703', '729726', '123-456-780-06', '7700 0000 0005 2116', '89047823671', 'sergeev@gmail.com', 'Sergeev1', 'Pa$$w0rd');

create table Medical_Degree
(
	Id_Medical_Degree int auto_increment not null primary key,
	Name_Medical_Degree varchar(50) not null
);
insert into Medical_Degree (Name_Medical_Degree)
values ('Высшая'),
('Первая'),
('Вторая');

create table Recommended_Treatment
(
	Id_Recommended_Treatment int auto_increment not null primary key ,
	Exercise_Program varchar (200) null default '-'
);
insert into Recommended_Treatment (Exercise_Program)
values ('Плавание'),
('-'),
('Гимнастика'),
('Конный спорт'),
('Йога');

create table Taking_Medications
(
	Id_Taking_Medications int auto_increment not null primary key,
	Name_Taking_Medications varchar (50) not null
);
insert into Taking_Medications (Name_Taking_Medications)
values ('Антровин'),
('Ектеосин'),
('Страксорам'),
('Глеоницал'),
('-');

create table  Position 
(
	Id_Position int auto_increment not null primary key,
	Name_Position varchar(50) not null
);
insert into Position (Name_Position)
values ('Хирург'),
('Врач-кардиолог'),
('Врач-невролог'),
('Офтальмолог'),
('Стоматолог');

create table Institution
(
	Id_Institution int auto_increment not null primary key,
	Legal_address varchar(50) not null,
	Physical_adress varchar(50) not null,
	Name_Institution varchar(50) not null
);
insert into Institution (Legal_address, Physical_adress, Name_Institution)
values ('Москва, ул. Ярполкина, д.10', 'Москва, ул. Вавилонова, д.7', 'Больница им. Доуэля'),
('Москва, ул. Ярполкина, д.10', 'Москва, ул. Ярполкина, д.10', 'Больница им. Доуэля');

create table Medical_Departments
(
	Id_Medical_Departments int auto_increment not null primary key,
	Medical_Profile varchar(50) not null,
	Name_Medical_Departments varchar(200) not null,
	Institution_Id int not null,
	foreign key (Institution_Id) references Institution (Id_Institution)
);
insert into Medical_Departments (Medical_Profile, Name_Medical_Departments, Institution_Id)
values ('Хирургическое', 'Хирургическое отделение №2 больницы им. Доуэля', 2),
('Терапевтическое', 'Терапевтическое отделение №1 больницы им. Доуэля', 1),
('Неврологическое', 'Неврологическое отделение №1 больницы им. Доуэля', 1),
('Офтальмологическое', 'Офтальмологическое отделение №1 больницы им. Доуэля', 1),
('Стоматологическое', 'Стоматологическое отделение №1 больницы им. Доуэля', 2);

create table Treatment_Employee
(
	Id_Treatment_Employee int auto_increment not null primary key,
	Second_Name_Empl varchar(30) not null,
	First_Name_Empl varchar(20) not null,
	Middle_Name_Empl varchar(30) null default '-',
	Login_Empl varchar(32) not null unique check (length(Login_Empl)>=5) check (regexp_like(Login_Empl, '[a-zA-Z0-9]')),
	Password_Empl varchar(32) not null check (length(Password_Empl)>=8) check (regexp_like(Password_Empl, '[!@#$%]')) check (regexp_like(Password_Empl, '[a-zA-Z0-9]')),
	Medical_Degree_Id int not null,
    foreign key (Medical_Degree_Id) references Medical_Degree (Id_Medical_Degree),
	Medical_Departments_Id int not null,
    foreign key (Medical_Departments_Id) references Medical_Departments (Id_Medical_Departments)
);
insert into Treatment_Employee (Second_Name_Empl, First_Name_Empl, Middle_Name_Empl, Login_Empl, Password_Empl, Medical_Degree_Id, Medical_Departments_Id)
values ('Леонтьев', 'Евгений', ' Викторович', 'Leontev1', 'Pa$$w0rd', 2, 1),
('Венечкин', 'Олег', 'Владимирович', 'Venechkin1', 'Pa$$w0rd', 1, 2),
('Самсонов', 'Александр', ' Сергеевич', 'Samsonov1', 'Pa$$w0rd', 1, 1),
('Смирнова', 'Вероника', 'Максимовна', 'Smirnova1', 'Pa$$w0rd', 2, 2),
('Репина', 'Екатерина', 'Никитична', 'Repina1', 'Pa$$w0rd', 1, 3);

create table Treatment_Profiles
(
	Id_Treatment_Profiles int auto_increment not null primary key,
	Name_Treatment_Profiles varchar(30) not null
);
insert into Treatment_Profiles (Name_Treatment_profiles)
values ('Хирургия'),
('Кардиология'),
('Неврология'),
('Офтальмология'),
('Стоматология');

create table Personal_Outpatient_Card
(
	Id_Personal_Outpatient_Card int auto_increment not null primary key,
	Personal_Outpatient_Card_Number varchar(10) not null unique check (regexp_like(Personal_Outpatient_Card_Number, '[0-9]{10}')),
	Client_Id int not null,
    foreign key (Client_Id) references Clients (Id_Client),
	Card_Registration_Date date not null check (Card_Registration_Date < sysdate())
);
insert into Personal_Outpatient_Card (Client_Id,Personal_Outpatient_Card_Number, Card_Registration_Date)
values (1, '0000000001', '2014-11-21'),
(2, '0000000002', '2016-04-12'),
(3, '0000000003', '2010-06-07'),
(4, '0000000004', '2018-06-15'),
(5, '0000000005', '2012-08-30');

create table Ticket
(
	Id_Ticket int not null auto_increment primary key,
	Date_Of_Reception date not null,
	Treatment_Employee_Id int not null,
    foreign key (Treatment_Employee_Id) references Treatment_Employee (Id_Treatment_Employee),
	Personal_Outpatient_Card_Id int not null,
	foreign key (Personal_Outpatient_Card_Id) references Personal_Outpatient_Card (Id_Personal_Outpatient_Card),
	Time_Of_Reception time not null,
	Ticket_Number varchar(10) not null unique check (regexp_like(Ticket_Number, '[0-9]{10}'))
);
insert into Ticket (Date_Of_Reception, Treatment_Employee_Id, Personal_Outpatient_Card_Id, Time_Of_Reception, Ticket_Number)
values ('12.07.2022', 1,1, '14:00:00', '3390000001'),
('15.05.2022' ,2,2, '17:00:00','3390000002'),
('10.06.2022',3,3, '12:00:00', '3390000003'),
('21.08.2022',4,4, '16:00:00','3390000004'),
('12.05.2022' ,5,5, '10:00:00','3390000005');

	create table Diagnosis
	(
		Id_Diagnosis int not null auto_increment primary key,
		Unique_Diagnosis_Number varchar(5) not null check (regexp_like(Unique_Diagnosis_Number, '[А-Я0-90-9]\\.[0-9]')),
		Name_Of_Diagnosis varchar(50) not null,
		Personal_Outpatient_Card_Id int not null,
		foreign key (Personal_Outpatient_Card_Id) references Personal_Outpatient_Card (Id_Personal_Outpatient_Card)
	);
	insert into Diagnosis (Unique_Diagnosis_Number, Name_Of_Diagnosis, Personal_Outpatient_Card_Id)
	values ('Я06.1', 'Прободная язва', 1),
    ('А03.0', 'Артимия сердца', 2),
('Ф05.0', 'Фактоматозы', 3),
('А01.0', 'Астенопия', 4),
('К01.0', 'Кариес', 5);

create table Sick_List
(
	Id_Sick_List int not null auto_increment primary key,
	Sick_List_Number varchar(10) not null unique,
	Sick_List_Opening_Date date not null check (Sick_List_Opening_Date < sysdate()),
	Sick_List_Closing_Date date not null,
	Date_Of_Next_Visit date not null,
	Name_Organisation varchar(50) not null,
	Ticket_Id int not null,
    foreign key (Ticket_Id) references Ticket (Id_Ticket)
);
insert into Sick_List (Sick_List_Number, Sick_List_Opening_Date, Sick_List_Closing_Date, Date_Of_Next_Visit, Name_Organisation, Ticket_Id)
values ('1234567891', '05.01.2022', '21.07.22', '12.06.22', 'ООО Молекула', 1),
('1234567892', '07.02.2022', '30.07.2022', '15.06.2022', 'ОАО Царевич', 2),
('1234567893', '04.03.2022', '17.06.2022', '10.06.2022', 'ООО Булочка', 3),
('1234567894', '15.02.2022', '29.08.2022', '21.06.2022', 'ЗАО ТЭЦС', 4),
('1234567895', '10.03.2022', '13.06.2022', '12.06.2022', 'ООО Маска', 5);

create table Employee_Profile
(
	Id_Employee_Profile int not null auto_increment primary key,
	Treatment_Employee_Id int not null,
    foreign key (Treatment_Employee_Id) references Treatment_Employee (Id_Treatment_Employee),
	Treatment_Profiles_Id int not null,
	foreign key (Treatment_Profiles_Id) references Treatment_Profiles (Id_Treatment_Profiles)
);
insert into Employee_Profile (Treatment_Employee_Id, Treatment_Profiles_Id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5);

create table Service
(
	Id_Service int not null auto_increment primary key,
	Code_Of_Service varchar(3) not null,
	Ticket_Id int not null,
	foreign key (Ticket_Id) references Ticket (Id_Ticket)
);
insert into Service (Code_Of_Service, Ticket_Id)
values ('078', 1),
('053', 2),
('044', 3),
('025', 4),
('065', 5);

create table Service_Diagnosis
(
	Id_Service_Diagnosis int not null auto_increment primary key,
	Service_Id int not null,
    foreign key (Service_Id) references Service (Id_Service),
	Diagnosis_Id int not null,
    foreign key (Diagnosis_Id) references Diagnosis (Id_Diagnosis)
);
insert into Service_Diagnosis (Service_Id, Diagnosis_Id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5);

create table Service_Treatment
(
	Id_Service_Treatment int not null auto_increment primary key,
	Service_Id int not null,
    foreign key (Service_Id) references Service (Id_Service),
	Recommended_Treatment_Id int not null,
    foreign key (Recommended_Treatment_Id) references Recommended_Treatment (Id_Recommended_Treatment)
);
insert into Service_Treatment (Service_Id, Recommended_Treatment_Id)
values (1,2),
(2,1),
(3,2),
(4,2),
(5,2);

create table Recommended_Taking_Medications
(
	Id_Recommended_Taking_Medications int not null auto_increment primary key,
	Recommended_Treatment_Id int not null,
    foreign key (Recommended_Treatment_Id) references Recommended_Treatment (Id_Recommended_Treatment),
	Taking_Medications_Id int not null,
    foreign key (Taking_Medications_Id) references Taking_Medications (Id_Taking_Medications)
);
insert into Recommended_Taking_Medications (Recommended_Treatment_Id, Taking_Medications_Id)
values (2, 1),
(1,2),
(2,3),
(2,4),
(2,5);

create table Employee_Position
(
	Id_Employee_Position int not null auto_increment primary key,
	Treatment_Employee_Id int not null,
    foreign key (Treatment_Employee_Id) references Treatment_Employee (Id_Treatment_Employee),
	Position_Id int not null,
    foreign key (Position_Id) references Position (Id_Position)
);
insert into Employee_Position (Treatment_Employee_Id, Position_Id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

create table Outpatient_Card_Employee
(
	Id_Outpatient_Card_Employee int not null auto_increment primary key,
	Personal_Outpatient_Card_Id int not null,
    foreign key (Personal_Outpatient_Card_Id) references Personal_Outpatient_Card (Id_Personal_Outpatient_Card),
	Treatment_Employee_Id int not null,
    foreign key (Treatment_Employee_Id) references Treatment_Employee (Id_Treatment_Employee)
);
insert into Outpatient_Card_Employee (Personal_Outpatient_Card_Id, Treatment_Employee_Id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

create table Service_Recomended_Treatment
(
	Id_Service_Recomended_Treatment int not null auto_increment primary key,
	Recommended_Taking_Medications_Id int not null,
    foreign key (Recommended_Taking_Medications_Id) references Recommended_Taking_Medications (Id_Recommended_Taking_Medications),
	Service_Diagnosis_Id int not null,
    foreign key (Service_Diagnosis_Id) references Service_Diagnosis (Id_Service_Diagnosis)
);
insert into Service_Recomended_Treatment (Recommended_Taking_Medications_Id, Service_Diagnosis_Id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);