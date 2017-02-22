
CREATE DATABASE PET_WORLD;
USE PET_WORLD;
CREATE TABLE ADDRESS(
ZIP INTEGER(5) NOT NULL,
CITY VARCHAR(20) NOT NULL,
STATE VARCHAR(20) NOT NULL,
CONSTRAINT PK_ADD_ZIP PRIMARY KEY(ZIP)
);


CREATE TABLE ORGANIZATION  (
O_ID INTEGER NOT NULL, 
O_NAME CHAR(20) NOT NULL,
O_EMAIL CHAR(20) NOT NULL,
O_PHONE_NO VARCHAR(10) NOT NULL,
O_ZIP INTEGER(5) NOT NULL,
CONSTRAINT PK_ORG PRIMARY KEY(O_ID)
);


CREATE TABLE CUSTOMER(
C_ID INTEGER NOT NULL,
C_FNAME VARCHAR(50) NOT NULL,
C_LNAME VARCHAR(50) NOT NULL,
C_EMAIL VARCHAR(50) ,
C_PHONE VARCHAR(10) NOT NULL,
C_ZIP INTEGER(5) NOT NULL,
CONSTRAINT PK_CUST_CID PRIMARY KEY(C_ID)
);
CREATE TABLE BREED(
B_ID INTEGER NOT NULL,
B_ANIMAL VARCHAR(20),     
B_BREED VARCHAR(20),
CONSTRAINT PK_BRE_BID PRIMARY KEY(B_ID)
);
CREATE TABLE ANIMAL(
A_ID INTEGER NOT NULL,
A_AGE INTEGER,
A_COLOR VARCHAR(25),
A_GENDER CHAR,
O_ID INTEGER,
C_ID INTEGER,
BREED_ID INTEGER NOT NULL,
CONSTRAINT PK_ANI_AID PRIMARY KEY(A_ID)
);




CREATE TABLE MEDICAL_HISTORY (
ANIMAL_ID INTEGER NOT NULL,
VACCINATION_TYPE VARCHAR(50),
VACCINATION_DATE DATE,
DISEASE VARCHAR(50),
CONSTRAINT PK_MED_HIS_TYPE_ANID PRIMARY KEY(ANIMAL_ID,VACCINATION_TYPE)
);


CREATE TABLE ADOPTION_HISTORY (
ORG_ID INTEGER,
CUST_ID INTEGER,
ADOPTION_DATE DATE,
ADOPTER_ID INTEGER NOT NULL,
PET_ID INTEGER NOT NULL );




CREATE TABLE REQUEST(
REQUEST_ID VARCHAR(10) NOT NULL,
REQUESTER_ID INTEGER NOT NULL,
BREED_ID INTEGER NOT NULL,
ANIMAL_ID INTEGER,
APPROVAL_STATUS CHAR(1) NOT NULL,
CONSTRAINT PK_REQ_REQID PRIMARY KEY(REQUEST_ID),
CONSTRAINT CHK_REQ_APP_STAT CHECK (APPROVAL_STATUS IN ('Y','N','P'))
);




ALTER TABLE ORGANIZATION 
ADD CONSTRAINT FK_ORG_ZIP foreign key(O_ZIP) references  ADDRESS(ZIP) ON DELETE CASCADE ON UPDATE CASCADE;





ALTER TABLE CUSTOMER 
ADD CONSTRAINT FK_CUS_ZIP foreign key(C_ZIP) references  ADDRESS(ZIP) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE ANIMAL 
ADD CONSTRAINT FK_ANI_OID FOREIGN KEY(O_ID) REFERENCES ORGANIZATION(O_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ANIMAL 
ADD CONSTRAINT FK_ANI_CID FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE  ANIMAL 
ADD CONSTRAINT FK_ANI_BRD_ID FOREIGN KEY(BREED_ID) REFERENCES BREED(B_ID) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE MEDICAL_HISTORY
ADD CONSTRAINT FK_MED_HIST_ANIMAL_ID FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL(A_ID) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE ADOPTION_HISTORY
ADD CONSTRAINT FK_ADOP_HIST_ORG_ID FOREIGN KEY(ORG_ID) REFERENCES ORGANIZATION(O_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ADOPTION_HISTORY
ADD CONSTRAINT FK_ADOP_HIST_CUST_ID FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(C_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ADOPTION_HISTORY
ADD CONSTRAINT FK_ADOP_HIST_ADOPTER_ID FOREIGN KEY(ADOPTER_ID) REFERENCES CUSTOMER(C_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ADOPTION_HISTORY
ADD CONSTRAINT FK_ADOP_HIST_PET_ID FOREIGN KEY(PET_ID) REFERENCES ANIMAL(A_ID) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE REQUEST
ADD CONSTRAINT FK_REQ_REQTR FOREIGN KEY(REQUESTER_ID) REFERENCES CUSTOMER(C_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE REQUEST
ADD CONSTRAINT FK_REQ_BRD_ID FOREIGN KEY(BREED_ID) REFERENCES BREED(B_ID) ON DELETE CASCADE ON UPDATE CASCADE;					

ALTER TABLE REQUEST
ADD CONSTRAINT FK_REQ_ANIM_ID FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL(A_ID) ON DELETE CASCADE ON UPDATE CASCADE;