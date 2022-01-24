DROP TABLE IF EXISTS Cities CASCADE;
CREATE TABLE Cities 
(

	City CHAR(20) NOT NULL , 
	State CHAR(20)NOT NULL,
	
	CONSTRAINT City_pk PRIMARY KEY(City)
);

INSERT INTO Cities VALUES(  'Mumbai' , 'Maharashtra');
INSERT INTO Cities VALUES(  'Pune' , 'Maharashtra');
INSERT INTO Cities VALUES(  'Ratnagiri' , 'Maharashtra');
INSERT INTO Cities VALUES(  'Nashik' , 'Maharashtra');
INSERT INTO Cities VALUES(  'Surat' , 'Gujrat');
INSERT INTO Cities VALUES(  'Gandhinagar' , 'Gujrat');
INSERT INTO Cities VALUES(  'Ahmedabad' , 'Gujrat');







DROP TABLE IF EXISTS Warehouse CASCADE;
CREATE TABLE Warehouse 
(
	Wid INT  ,
	Wname CHAR(30) NOT NULL , 
	Wlocation CHAR(20)NOT NULL,
	
	CONSTRAINT Warehouse_pk PRIMARY KEY(Wid),
	CONSTRAINT Wlocation_fk FOREIGN KEY (Wlocation) REFERENCES Cities ( City ) ON UPDATE SET NULL ON DELETE CASCADE
);


INSERT INTO Warehouse VALUES( 2001 , 'Connector Sports Warehousing' , 'Mumbai'  );
INSERT INTO Warehouse VALUES( 2002 , 'Connector Sports Warehousing' , 'Pune');
INSERT INTO Warehouse VALUES( 2003 , 'Connector Sports Warehousing' , 'Ahmedabad' );
INSERT INTO Warehouse VALUES( 2004 , 'Smarts Machines Ltd' , 'Mumbai'  );
INSERT INTO Warehouse VALUES( 2005 , 'Smarts Machines Ltd' ,'Nashik');
INSERT INTO Warehouse VALUES( 2006 , 'Distribution Computers' , 'Mumbai'  );
INSERT INTO Warehouse VALUES( 2007 , 'Distribution Computers' , 'Gandhinagar');
INSERT INTO Warehouse VALUES( 2008 , 'Benefits Food Warehouse' , 'Pune');
INSERT INTO Warehouse VALUES( 2009 , 'Benefits Food Warehouse' ,  'Ahmedabad' );
INSERT INTO Warehouse VALUES( 2010 , 'Pathfinder Clothes Warehouse' , 'Ratnagiri');
INSERT INTO Warehouse VALUES( 2011 , 'Pathfinder Clothes Warehouse' , 'Surat');

INSERT INTO Warehouse VALUES( 2012 , 'XYZ Warehouse' , 'Pune');





DROP TABLE IF EXISTS Store CASCADE;
CREATE TABLE Store 
(
	Store_id INT  ,
	Store_name CHAR(30) NOT NULL , 
	Store_city CHAR(20)NOT NULL,
	Wid INT  ,
	
	CONSTRAINT Store_pk PRIMARY KEY(Store_id),
	CONSTRAINT Storecity_fk FOREIGN KEY (Store_city) REFERENCES Cities ( City ) ON UPDATE SET NULL ON DELETE CASCADE,
	CONSTRAINT Warehouseid_fk FOREIGN KEY (Wid) REFERENCES Warehouse ( Wid ) ON UPDATE SET NULL ON DELETE CASCADE

);

INSERT INTO Store VALUES( 1001 , 'SkyHigh Machines' 	 , 'Nashik'		,2005 );
INSERT INTO Store VALUES( 1002 , 'Pure Machines' 	 , 'Mumbai' 	,2004);
INSERT INTO Store VALUES( 1003 , 'Resource Machines' 	 , 'Pune' 		,2004);
INSERT INTO Store VALUES( 1004 , 'Machine Network' 	 , 'Ahmedabad' 	,2004 );
INSERT INTO Store VALUES( 1005 , 'Craft Computers' 	 , 'Ratnagiri' 	,2006);
INSERT INTO Store VALUES( 1006 , 'Outpost Computers'	 , 'Gandhinagar' 	,2007);
INSERT INTO Store VALUES( 1007 , 'A1 Computers' 	 ,'Nashik'  	,2007);
INSERT INTO Store VALUES( 1008 , 'Vitality Foods' 	 , 'Ahmedabad'	,2008);
INSERT INTO Store VALUES( 1009 , 'Friendly Foods' 	 , 'Mumbai'	,2009);
INSERT INTO Store VALUES( 1010 , 'Tasty Foods' 	 , 'Mumbai'	,2008);
INSERT INTO Store VALUES( 1011 , 'Vivid Clothes' 	 , 'Gandhinagar'	,2011);
INSERT INTO Store VALUES( 1012 , 'Fly Clothes' 		 ,'Ratnagiri'	,2010 );
INSERT INTO Store VALUES( 1013 , 'Style Collection' 	 , 'Surat'		,2011);
INSERT INTO Store VALUES( 1014 , 'Champanion Sports' 	 , 'Pune'		,2001);
INSERT INTO Store VALUES( 1015 , 'Time Sports' 	 , 'Gandhinagar'	,2002);
INSERT INTO Store VALUES( 1016 , 'Queen Sports' 	 , 'Ahmedabad'	,2003);




DROP TABLE IF EXISTS Customer CASCADE;
CREATE TABLE Customer 
(
	Cno INT , 
	Cname char(50) , 
	Caddr CHAR(50) , 
	Cust_City CHAR(20) , 
	
	CONSTRAINT Customer_pk PRIMARY KEY (Cno),
	CONSTRAINT Customercity_fk FOREIGN KEY (Cust_city) REFERENCES Cities ( City ) ON UPDATE SET NULL ON DELETE CASCADE
);

INSERT INTO Customer VALUES( 1 , 'Mr.Anish Kashyap', 'Super Star Apt ,Station Road ' , 'Mumbai');
INSERT INTO Customer VALUES( 2 , 'Mr.Sankar Dhar', 'Santook Chawl,  JM road. ' , 'Mumbai' );
INSERT INTO Customer VALUES( 3 , 'Mrs.Sankar Dhane', 'Sonakshi Bunglow , Jail road. ' , 'Mumbai');
INSERT INTO Customer VALUES( 4 , 'Mrs.Jyotsana Patel', 'Hruta Bunglow , SB road. ' , 'Pune');
INSERT INTO Customer VALUES( 5 , 'Mr.Ulhas Lanjekar', 'Akash Bunglow , Sharma road. ' , 'Pune');
INSERT INTO Customer VALUES( 6 , 'Mrs.Sampada Patil', 'Sampada Bunglow , Gaonkhadi road. ' , 'Ratnagiri');
INSERT INTO Customer VALUES( 7 , 'Mr.Sankar Mannan', 'Moon Villa ,Main Kasturba Road ' , 'Ratnagiri' );
INSERT INTO Customer VALUES( 8 , 'Mr.Adhik Varma', '118, Plot 72, Siv centre ' , 'Mumbai');
INSERT INTO Customer VALUES( 9 , 'Mrs.Nitika Apte', '16 a, Friends Colony ' , 'Nashik');
INSERT INTO Customer VALUES( 10 , 'Mrs.Sayli Damle', 'E68 , Pandav Nagar' , 'Nashik');
INSERT INTO Customer VALUES( 11 , 'Mr.Nitika Apte', '7 , Qureshi Court , MMC Road' , 'Ahmedabad');
INSERT INTO Customer VALUES( 12 , 'Mrs.Aruna Goel', '39 , Kalpataru , Peddar Road ' , 'Ahmedabad');
INSERT INTO Customer VALUES( 13 , 'Mr.Shiva Varma', '3, Ramlingam , Bharati Road' , 'Gandhinagar' );
INSERT INTO Customer VALUES( 14 , 'Mr.Daya Chandra', 'B,150 sector 6 , Main Gandhi Road' , 'Surat');
INSERT INTO Customer VALUES( 15 , 'Mrs.Draupadi Dixit', '402, Santhusapet , A.B Road' , 'Surat');






DROP TABLE IF EXISTS Items CASCADE;
CREATE TABLE Items 
(	
	Item_no INT,
	Description TEXT,
	Weight DECIMAL (7,2) ,
	Cost DECIMAL (9,2) ,
	
	CONSTRAINT Items_pk PRIMARY KEY (Item_no) 
);

INSERT INTO Items VALUES ( 3001 , 'Fully Automatic Jar Filling Machine'      , 50000 , 80000 );
INSERT INTO Items VALUES ( 3002 , 'Bottle filling machine having filling cap' , 50000 , 70000 );
INSERT INTO Items VALUES ( 3003 , 'Fine selection of Stone Separator'       , 15000 ,50000);
INSERT INTO Items VALUES ( 3004 , '3D UV Curing Machine'                         , 30000 , 40000 );
INSERT INTO Items VALUES ( 3005 , 'Wet Mix Paver Finisher Machine '         , 12000 , 30000 );
INSERT INTO Items VALUES ( 3006 , 'Automatic Fusing Machine'                    , 30000 ,20000);
INSERT INTO Items VALUES ( 3007 , 'Monitor'      , 5000 , 5000 );
INSERT INTO Items VALUES ( 3008 , 'CPU'            , 3000 , 10000 );
INSERT INTO Items VALUES ( 3009 , 'Keyboard & Mouse'     , 2000 , 2000);
INSERT INTO Items VALUES ( 3010 , 'Printer'               , 2000 , 4000);
INSERT INTO Items VALUES ( 3011 , 'Speakers'            , 1000  , 1500);
INSERT INTO Items VALUES ( 3012 , 'Cold-drinks'        , 500 , 100 );
INSERT INTO Items VALUES ( 3013, 'Ice-creams'         , 500 , 300 );
INSERT INTO Items VALUES ( 3014 , 'Milk products'    , 250 , 100 );
INSERT INTO Items VALUES ( 3015 , 'Chocolate'           , 500 , 200);
INSERT INTO Items VALUES ( 3016 , 'Tea'                    , 1000  , 300);
INSERT INTO Items VALUES ( 3017 , 'Coffee'               , 1000 ,500 );
INSERT INTO Items VALUES ( 3018 , 'Spices'               , 1000 , 400 );
INSERT INTO Items VALUES ( 3019 , 'Saree'                , 500 , 400);
INSERT INTO Items VALUES ( 3020 , 'Dress Peice'       , 400 ,500);
INSERT INTO Items VALUES ( 3021 , 'Inner wears'      , 300 ,100 );
INSERT INTO Items VALUES ( 3022, 'Shirts'               , 300  , 600);
INSERT INTO Items VALUES ( 3023 , 'Pants'               , 200 , 500 );
INSERT INTO Items VALUES ( 3024 , 'Jeans'               , 500 , 900 );
INSERT INTO Items VALUES ( 3025 , 'Suits'                , 1000 , 2000 );
INSERT INTO Items VALUES ( 3026 , 'Gloves'              , 500 , 300 );
INSERT INTO Items VALUES ( 3027 , 'Helmet'             , 1000 , 600 );
INSERT INTO Items VALUES ( 3028 , 'Bats and Rackets', 200 , 2000 );
INSERT INTO Items VALUES ( 3029, 'Balls'                    , 100 , 200 );
INSERT INTO Items VALUES ( 3030 , 'Shoes'                 , 300 , 1000 );






DROP TABLE IF EXISTS Availability CASCADE;
CREATE TABLE Availability 
( 
	Store_id INT ,
	Item_no INT,
		
	CONSTRAINT Store_id_fk FOREIGN KEY (Store_id )REFERENCES Store ( Store_id ) ON UPDATE SET NULL ON DELETE CASCADE,
	CONSTRAINT Item_no_fk FOREIGN KEY (Item_no) REFERENCES Items( Item_no ) ON UPDATE SET NULL ON DELETE CASCADE	
);

INSERT INTO Availability (Store_id , Item_no) VALUES

(1001 ,3001),(1001 ,3003),(1001 ,3006),(1002 ,3001),(1002 ,3002),(1002 ,3004),(1002 ,3005),
(1003 ,3005),(1003 ,3006),(1003 ,3002),(1004 ,3001),(1004 ,3002),(1004 ,3003),(1004 ,3004),
(1004 ,3005),(1004 ,3006),

(1005 ,3007),(1005 ,3008),(1005 ,3009),(1006 ,3007),(1006 ,3008),(1006 ,3009),(1006 ,3010),
(1007 ,3010),(1007 ,3011),

(1008 ,3012),(1008 ,3013),(1008 ,3014),(1008 ,3015),(1009 ,3012),(1009 ,3015),(1009 ,3018),
(1010 ,3016),(1010 ,3018),

(1011 ,3019),(1011 ,3021),(1012 ,3019),(1012 ,3020),(1012 ,3021),(1012 ,3022),(1013 ,3025),

(1014 ,3026),(1014 ,3027),(1014 ,3028),(1014 ,3029),(1015 ,3026),(1015 ,3027),(1015 ,3028),
(1016 ,3029),(1016 ,3030);







DROP TABLE IF EXISTS Orders CASCADE;
CREATE TABLE Orders 
( 
	Cno INT , 
	Store_id INT ,
	Item_no INT,
	Quantity INT,
	Ono INT,
	Bill_amount MONEY ,  
	Order_date DATE ,
		
	CONSTRAINT Order_pk PRIMARY KEY (Ono) ,
	CONSTRAINT Cno_fk FOREIGN KEY (Cno) REFERENCES Customer ( Cno ) ON UPDATE SET NULL ON DELETE CASCADE, 
	CONSTRAINT Store_id_fk FOREIGN KEY (Store_id )REFERENCES Store ( Store_id ) ON UPDATE SET NULL ON DELETE CASCADE,
	CONSTRAINT Item_no_fk FOREIGN KEY (Item_no) REFERENCES Items( Item_no ) ON UPDATE SET NULL ON DELETE CASCADE
	
	
);

INSERT INTO Orders VALUES ( 1, 1003   , 3013    ,400  , 4001 , 120000 , '2020 / 02 /12');
INSERT INTO Orders VALUES ( 13, 1015  , 3030   ,1500 ,4002 , 1500000 , '2020 / 04 /30');
INSERT INTO Orders VALUES (12, 1008  , 3013    ,300   ,4003 , 90000 , '2020 / 04 /01');
INSERT INTO Orders VALUES (12, 1004  , 3005   ,2       ,4004 , 60000 , '2020 / 04 /01');
INSERT INTO Orders VALUES ( 2, 1014   , 3028   ,150    ,4005 , 300000 , '2020 / 03 /18');
INSERT INTO Orders VALUES ( 6, 1005   , 3011   ,1000  ,4006 , 1500000 , '2020 / 04 /26');
INSERT INTO Orders VALUES ( 6, 1009   , 3017   ,40     ,4007 , 20000  , '2020 / 04 /26');
INSERT INTO Orders  VALUES ( 9, 1007  , 3007  ,120    , 4008 , 600000 , '2020 / 01 /11');
INSERT INTO Orders VALUES ( 14, 1001  , 3001  ,2         ,4009 , 160000  , '2020 / 02 /17');
INSERT INTO Orders VALUES ( 15, 1001  , 3003  ,6        , 4010 , 300000  , '2020 / 03 /20');
INSERT INTO Orders VALUES ( 1, 1010    , 3001  ,3         ,4011 ,  240000 , '2020 / 01 /21');


SELECT * FROM Cities;
SELECT * FROM Warehouse ;
SELECT * FROM Store ;
SELECT * FROM Customer; 
SELECT * FROM Items ;
SELECT * FROM Availability ;
SELECT * FROM Orders  ;


--------------------------------------------------------- QUERY 1 :
-- Find the item that has maximum weight.
---------------------------------------------------------------------------------------------



SELECT Description AS items_having_maximum_weight FROM Items Where Weight = (SELECT max(Weight) FROM Items);

 

---------------------------------------------------------QUERY 2 :
--List the different warehouses in Mumbai city
-----------------------------------------------------------------------------------------------



SELECT Wname AS warehouses_in_Mumbai_city FROM Warehouse WHERE Wlocation = 'Mumbai';



---------------------------------------------------------QUERY 3 :
--Find the details of orders ordered on date 2020/04/01
-------------------------------------------------------------------------------------------------



SELECT * from Orders WHERE Order_date = '2020/04/01';



--------------------------------------------------------NESTED QUERY 1 :
-- Find the city wise details of orders given by each customer
--------------------------------------------------------------------------------------------------


SELECT O.Cno , O.Store_id  ,O.Item_no ,O.Ono ,O.Bill_amount ,  O.Order_date , S.Store_City FROM Orders O 
LEFT JOIN Store S ON O.Store_id = S.Store_id ORDER BY Store_City;


---------------------------------------------------------NESTED QUERY 2 :
--Find an item which is ordered for maximum no of times.
-------------------------------------------------------------------------------------------------


SELECT Description AS Items_ordered_of_maximum_times FROM Items WHERE Item_no IN (
SELECT O.Item_no FROM Orders O  GROUP BY O.Item_no HAVING COUNT(O.Item_no) IN(
SELECT COUNT(O.Item_no) FROM Orders O GROUP BY O.Item_no ORDER BY COUNT(O.Item_no) DESC LIMIT 1)) ;



---------------------------------------------------------NESTED QUERY 3 :
-- List all the item details with highest bill amount
-------------------------------------------------------------------------------------------


SELECT * FROM Items WHERE Item_no IN (
SELECT O.Item_no FROM Orders O WHERE Bill_Amount =(
SELECT MAX(Bill_amount) FROM Orders));