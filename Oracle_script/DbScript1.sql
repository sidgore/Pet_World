
CREATE TABLE CUSTOMER(
C_ID NUMBER NOT NULL,
C_FNAME VARCHAR2(50) NOT NULL,
C_LNAME VARCHAR2(50) NOT NULL,
C_EMAIL VARCHAR2(50) ,
C_PHONE NUMBER(10) NOT NULL,
C_ZIP NUMBER(6) NOT NULL,
CONSTRAINT PK_CUST_CID PRIMARY KEY(C_ID)
);

CREATE TABLE ORGANIZATION(
 O_ID INTEGER NOT NULL, 
 O_FNAME VARCHAR2(50) NOT NULL,
 O_LNAME VARCHAR2(50) ,
 O_EMAIL VARCHAR2(50) NOT NULL,
 O_PHONE INTEGER NOT NULL,
 O_ZIP INTEGER NOT NULL,
 CONSTRAINT PK_ORG_OID PRIMARY KEY(O_ID));

CREATE TABLE ADDRESS (
 ZIP NUMBER(6) NOT NULL, 
 CITY VARCHAR2(20) NOT NULL,
 STATE VARCHAR2(20) NOT NULL,
 CONSTRAINT PK_ADD_ZIP PRIMARY KEY(ZIP)
);

CREATE TABLE BREED(
B_ID NUMBER NOT NULL,
B_ANIMAL VARCHAR(20),     
B_BREED VARCHAR(20),
CONSTRAINT PK_BRE_BID PRIMARY KEY(B_ID));

CREATE TABLE ANIMAL(
A_ID NUMBER NOT NULL,
A_AGE NUMBER,
A_COLOR VARCHAR(25),
A_GENDER CHAR,
O_ID NUMBER,
C_ID NUMBER,
BREED_ID NUMBER NOT NULL,
CONSTRAINT PK_ANI_AID PRIMARY KEY(A_ID)
);
 
CREATE TABLE MEDICAL_HISTORY (
VACCINATION_TYPE VARCHAR2(50),
VACCINATION_DATE DATE,
DISEASE VARCHAR2(50),
ANIMAL_ID NUMBER NOT NULL
);

CREATE TABLE ADOPTION_HISTORY (
ORG_ID NUMBER,
CUST_ID NUMBER,
ADOPTION_DATE DATE,
ADOPTER_ID NUMBER NOT NULL,
PET_ID NUMBER NOT NULL );

CREATE TABLE REQUEST(
REQUEST_ID NUMBER NOT NULL,
REQUESTER_ID NUMBER NOT NULL,
BREED_ID NUMBER NOT NULL,
ANIMAL_ID NUMBER,
APPROVAL_STATUS CHAR(1) NOT NULL,
CONSTRAINT PK_REQ_REQID PRIMARY KEY(REQUEST_ID),
CONSTRAINT CHK_REQ_APP_STAT CHECK (APPROVAL_STATUS IN ('Y','N','P'))
);

ALTER TABLE REQUEST 
ADD (CONSTRAINT FK_REQ_REQTR FOREIGN KEY(REQUESTER_ID) REFERENCES CUSTOMER(C_ID),
CONSTRAINT FK_REQ_BRD_ID FOREIGN KEY(BREED_ID) REFERENCES BREED(B_ID),
CONSTRAINT FK_REQ_ANIM_ID FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL(A_ID) );

ALTER TABLE MEDICAL_HISTORY
ADD CONSTRAINT FK_MED_HIST_ANIMAL_ID FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL(A_ID);

ALTER TABLE ADOPTION_HISTORY
ADD (CONSTRAINT FK_ADOP_HIST_ORG_ID FOREIGN KEY(ORG_ID) REFERENCES ORGANIZATION(O_ID),
     CONSTRAINT FK_ADOP_HIST_CUST_ID FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(C_ID),
     CONSTRAINT FK_ADOP_HIST_ADOPTER_ID FOREIGN KEY(ADOPTER_ID) REFERENCES CUSTOMER(C_ID),
     CONSTRAINT FK_ADOP_HIST_PET_ID FOREIGN KEY(PET_ID) REFERENCES ANIMAL(A_ID));

ALTER TABLE ANIMAL 
ADD (CONSTRAINT FK_ANI_OID FOREIGN KEY(O_ID) REFERENCES ORGANIZATION(O_ID),
	 CONSTRAINT FK_ANI_CID FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID),
	 CONSTRAINT FK_ANI_BRD_ID FOREIGN KEY(BREED_ID) REFERENCES BREED(B_ID) );

	 
ALTER TABLE CUSTOMER
ADD CONSTRAINTS FK_CUS_ZIP FOREIGN KEY(C_ZIP) REFERENCES ADDRESS(ZIP);

ALTER TABLE ORGANIZATION
ADD CONSTRAINTS FK_ORG_ZIP FOREIGN KEY(O_ZIP) REFERENCES ADDRESS(ZIP);