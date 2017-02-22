INSERT INTO ADDRESS VALUES(95054,'Santa Clara','CA');
INSERT INTO ADDRESS VALUES(95121,'San Jose','CA');
INSERT INTO ADDRESS VALUES(90007,'Los Angeles','CA');
INSERT INTO ADDRESS VALUES(20874,'Germantown','MD');
INSERT INTO ADDRESS VALUES(60016,'Des Plaines','IL');
INSERT INTO ADDRESS VALUES(90401,'Santa Monica','CA');
INSERT INTO ADDRESS VALUES(10001,'New York City','New York');
INSERT INTO ADDRESS VALUES(89101,'Las Vegas','Nevada');



INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES (2001, 'Dog', 'Desi');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES (2002, 'Cat', 'Birman');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2003, 'Cat', 'Persian');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2004, 'Cat', 'Maine Coon');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2005, 'Cat', 'Siamese');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2006, 'Cat', 'Abyssinian');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2007, 'Dog', 'Labrador Retriever'); 
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2008, 'Dog', 'Chihuahua');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2009, 'Dog', 'Boxer');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2010, 'Dog', 'German Shepherd');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2011, 'Dog', 'Beagle');
INSERT INTO BREED(B_ID, B_ANIMAL, B_BREED)
VALUES(2012, 'Dog', 'Border Collie');



insert into ORGANIZATION values(01, 'MARSHALL', 'marshall@gmail.com',1129894832,95054);
insert into ORGANIZATION values(02, 'ROSSIE', 'Rossie@gmail.com',4129894832,95121);
insert into ORGANIZATION values(03, 'LOve Dogs', 'pets323@gmail.com',5149894831,90007);
insert into ORGANIZATION values(04, 'Cathie Foundations', 'cathie22@ymail.com',4169894542,89101);
insert into ORGANIZATION values(05, 'Martin Luther', 'martin@gmail.com',1329594802,10001);
insert into ORGANIZATION values(06, 'Mercy foundations', 'mercy101@mercy.org',2149854837,60016);
insert into ORGANIZATION values(07, 'Pet_charity', 'pets@gmail.com',2149594872,95054);
insert into ORGANIZATION values(08, 'Shoah Foundations', 'Shoah@gmail.com',5129694739,89101);
insert into ORGANIZATION values(09, 'Robert Charity', 'Robert4332@gmail.com',6329874836,95121);
insert into ORGANIZATION values(10, 'BASX Org', 'basx2@db.org',5629894344,90007);


insert into CUSTOMER values(1001, 'Bob','Jones', 'bjones@gmail.com',6699894832,95054);
insert into CUSTOMER values(1002, 'Henry','Wilson','wilson101@gmail.com',6529894832,20874);
insert into CUSTOMER values(1003, 'Rose','Clark', 'roseclark@gmail.com',5149894831,95054);
insert into CUSTOMER values(1004, 'Sheldon','Cooper', 'shelly@ymail.com',4439894542,90401);
insert into CUSTOMER values(1005, 'Charlie','Harper','harper@gmail.com',5129594802,60016);
insert into CUSTOMER values(1006, 'Zhang','Wei', 'weiz@mercy.org',3359854837,90007);
insert into CUSTOMER values(1007, 'Li','Na', 'lina@gmail.com',7129594872,95054);
insert into CUSTOMER values(1008, 'Wang','Xiuying', 'wxiuying@gmail.com',4549694739,89101);
insert into CUSTOMER values(1009, 'Rajesh','Kutrapalli', 'rajk4332@gmail.com',3399874836,95121);
insert into CUSTOMER values(1010, 'Dev','Patel', 'dev_patel@db.org',5609894344,90401);



INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5001, 3, 'Black', 'F', 10,NULL, 2003);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5002, 1, 'Brown', 'M', 09, NULL, 2005);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5003, 2, 'Yellow', 'F', 09, NULL, 2007);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5004, 4, 'White', 'M', 01, NULL, 2002);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5005, 5, 'Gold', 'F', 03, NULL, 2012);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5006, 3, 'Black-Brown', 'M', 02, NULL, 2008);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5007, 1, 'Grey', 'F', 05, NULL, 2002);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5008, 7, 'Black-White', 'F', 06, NULL, 2001);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5009, 6, 'Light-gold', 'F', 04, NULL, 2004);
INSERT INTO ANIMAL(A_ID, A_AGE, A_COLOR, A_GENDER, O_ID, C_ID, BREED_ID)
VALUES(5010, 6, 'Black-White-Yellow', 'M', 02, NULL, 2007);


INSERT INTO ADOPTION_HISTORY
VALUES(01,NULL, TO_date('2016-07-01','yyyy-mm-dd'), 1001,5001);
INSERT INTO ADOPTION_HISTORY
VALUES(NULL,1001, TO_date('2016-10-23','yyyy-mm-dd'), 1005,5001);
INSERT INTO ADOPTION_HISTORY
VALUES(02,NULL, TO_date('2015-07-01','yyyy-mm-dd'), 1009,5002);
INSERT INTO ADOPTION_HISTORY
VALUES(08,NULL, TO_date('2016-03-11','yyyy-mm-dd'), 1006,5007);
INSERT INTO ADOPTION_HISTORY
VALUES(NULL,1006, TO_date('2016-02-01','yyyy-mm-dd'), 1004,5008);

INSERT INTO MEDICAL_HISTORY
VALUES('Rabbies', to_date('2016-07-01','yyyy-mm-dd'), 'RABBIES',5001);
INSERT INTO MEDICAL_HISTORY
VALUES('Viral-fever', to_date('2016-03-01','yyyy-mm-dd'), 'Fever',5002);
INSERT INTO MEDICAL_HISTORY
VALUES('Chicken-Pox', to_date('2016-07-22','yyyy-mm-dd'), 'Chicken-Pox',5003);
INSERT INTO MEDICAL_HISTORY
VALUES('Rabbies', to_date('2016-03-11','yyyy-mm-dd'), 'RABBIES',5003);
INSERT INTO MEDICAL_HISTORY
VALUES('Rabbies', to_date('2016-04-06','yyyy-mm-dd'), 'RABBIES',5005);
INSERT INTO MEDICAL_HISTORY
VALUES('Rabbies', to_date('2016-07-11','yyyy-mm-dd'), 'RABBIES',5006);
INSERT INTO MEDICAL_HISTORY
VALUES('chicken-gunia', to_date('2016-07-11','yyyy-mm-dd'), 'chicken-gunia',5006);
INSERT INTO MEDICAL_HISTORY
VALUES('Chicken-Pox', to_date('2015-07-12','yyyy-mm-dd'), 'Chicken-Pox',5008);
INSERT INTO MEDICAL_HISTORY
VALUES('Rabbies', to_date('2014-07-17','yyyy-mm-dd'), 'RABBIES',5009);
INSERT INTO MEDICAL_HISTORY
VALUES('Chicken-Pox', to_date('2016-08-20','yyyy-mm-dd'), 'Chicken-Pox',5010);

INSERT INTO REQUEST VALUES(01,1005,2003,5001,'Y');
INSERT INTO REQUEST VALUES(02,1009,2005,5002,'Y');
INSERT INTO REQUEST VALUES(03,1006,2002,5007,'Y');
INSERT INTO REQUEST VALUES(04,1004,2001,5008,'Y');
INSERT INTO REQUEST VALUES(05,1007,2012,5005,'P');
INSERT INTO REQUEST VALUES(06,1002,2008,5006,'P');