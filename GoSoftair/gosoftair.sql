CREATE TABLE "GOSOFTAIR"."UTENTE" 
   (	"ID" NUMBER(3,0) NOT NULL ENABLE, 
	"NOME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"COGNOME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"NICKNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DOCUMENTOVALIDO" VARCHAR2(100 BYTE), 
	"IMMAGINEPROFILO" VARCHAR2(100 BYTE), 
	 CONSTRAINT "UTENTE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   CREATE TABLE "GOSOFTAIR"."EVENTO" 
   (	"ID" NUMBER(3,0) NOT NULL ENABLE, 
	"TITOLO" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" LONG NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	"PUNTOINCONTRO" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"TIPOLOGIA" NUMBER(3,0) NOT NULL ENABLE, 
	"NMAXPARTECIPANTI" NUMBER(3,0) NOT NULL ENABLE, 
	"STATO" NUMBER(1,0) NOT NULL ENABLE, 
	"IDUTENTE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "EVENTO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "EVENTO_FK1" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "GOSOFTAIR"."UTENTE" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "GOSOFTAIR"."UTENTE_EVENTO" 
   (	"ID" NUMBER(3,0) NOT NULL ENABLE, 
	"NUMSQUADRA" NUMBER(1,0) NOT NULL ENABLE, 
	"IDUTENTE" NUMBER(3,0) NOT NULL ENABLE, 
	"IDEVENTO" NUMBER(3,0) NOT NULL ENABLE, 
	 CONSTRAINT "UTENTE_EVENTO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "UTENTE_EVENTO_FK1" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "GOSOFTAIR"."UTENTE" ("ID") ENABLE, 
	 CONSTRAINT "UTENTE_EVENTO_FK2" FOREIGN KEY ("IDEVENTO")
	  REFERENCES "GOSOFTAIR"."EVENTO" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  
  CREATE TABLE "GOSOFTAIR"."POST" 
   (	"ID" NUMBER(5,0) NOT NULL ENABLE, 
	"IDUTENTE" NUMBER(3,0) NOT NULL ENABLE, 
	"IDEVENTO" NUMBER(3,0) NOT NULL ENABLE, 
	"TESTO" LONG NOT NULL ENABLE, 
	 CONSTRAINT "POST_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "POST_FK1" FOREIGN KEY ("IDEVENTO")
	  REFERENCES "GOSOFTAIR"."EVENTO" ("ID") ENABLE, 
	 CONSTRAINT "POST_FK2" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "GOSOFTAIR"."UTENTE" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "GOSOFTAIR"."ANNUNCIO" 
   (	"ID" NUMBER(5,0) NOT NULL ENABLE, 
	"TITOLO" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DESCRIZIONE" LONG NOT NULL ENABLE, 
	"IMMAGINE" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"PREZZO" FLOAT(126) NOT NULL ENABLE, 
	"NUMEROTELEFONO" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"IDUTENTE" NUMBER(3,0) NOT NULL ENABLE, 
	 CONSTRAINT "ANNUNCIO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "ANNUNCIO_FK1" FOREIGN KEY ("IDUTENTE")
	  REFERENCES "GOSOFTAIR"."UTENTE" ("ID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

  CREATE SEQUENCE  "GOSOFTAIR"."INCREMENTIDANNUNCIO"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 CACHE 20 NOORDER  NOCYCLE ;
  CREATE SEQUENCE  "GOSOFTAIR"."INCREMENTIDEVENTO"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE ;
  CREATE SEQUENCE  "GOSOFTAIR"."INCREMENTIDPOST"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE ;
  CREATE SEQUENCE  "GOSOFTAIR"."INCREMENTIDUTENTE"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 20 CACHE 20 NOORDER  NOCYCLE ;
  CREATE SEQUENCE  "GOSOFTAIR"."INCREMENTIDUTENTE_EVENTO"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 0 CACHE 20 NOORDER  NOCYCLE ;
