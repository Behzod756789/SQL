
1. Task 

Data- — bu odamlar, obyektlar, hodisalar yoki tushunchalar haqidagi xom (qayta ishlanmagan) faktlar, raqamlar, matnlar yoki belgilar bo‘lib alohida bolganda hech qanday mano kash etmaydi. 

Database- Malumotlarni tartibli tarzda saqlaydigan elektron tizim bu tizim mahsus malumotlarni boshqarish tizimi 

Relation database -Malumotlarni jadval korinishda qator va ustunlarda sqalaydigan va ular  ozaro bog'langan saqlaydigan kalit 



1. Malumat xafsizliki va  shifrlash 

2. Doily mavjudlik va favqulodda tiklash 

3. Integratsiya xizmatlari 

4. Bizness tahlil vositalari 

5. Kengaytiruvchi va yuqori isolas tezligi 

2. Task

create database SchoolDB
use SchoolDB

create table Students ( StudentID int ,  Name varchar(50),  Age int))
  
select * from Students 




Sql server bu malumotlar bazası boshqaruvi tizimi hisoblanadi . U malumotlarni boshqarish ishlov berish saqlash bn shugilanadi 


SSMS - grafik tuzilmaga ega dastur hisoblanib u orqali sql server bn ishlaymiz . Data visualizatasiya jadval yaratilishi malumotlar qoshish ayrish  zaxira qilish . 


SQL- dasturlash tili bolib malumotlar bazasidagi malumotlar bilan ishlash  kiritsh yaratish ochirish  uchun ishlatiladi. SSMS ichida yoziladi va SQL Server tomonidan bajariladi.  

3. Task 


Dql -data query anguage -select comandasini bajaradi

DML- Data manipulation language (update insert delete) malumotlarni ozgartish kiritsh ochirish yangilash 

DDL- Data definition language (create, alter drop, truncate ) Jadval structure yaratish yopish ozgartirish 


DCL - Data control language malumotlar kirishini boshqarish (Grant Revoke )

TCL- Transaksiyalarni boshqarish bir nechta buyrugni birgalikda bajarish (COMMIT, ROLLBACK)




create database SchoolDB
use SchoolDB

create table Students ( StudentID INT ,  Name varchar(50),  Age INT))
  
select * from Students 


INSERT INTO Students ((StudentID, Name, Age) Values  
(1, 'Ali Karimov', 20)
, (2 'Zarina Tursunova', 22)
, (3 'Javohir Niyozov', 19)
