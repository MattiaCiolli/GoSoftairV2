--------------------------------------------------------
--  File created - Saturday-February-11-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ANNUNCIO
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."ANNUNCIO" 
   (	"ID" NUMBER(5,0), 
	"TITOLO" VARCHAR2(20 BYTE), 
	"DESCRIZIONE" LONG, 
	"IMMAGINE" VARCHAR2(300 BYTE), 
	"PREZZO" FLOAT(126), 
	"NUMEROTELEFONO" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"IDUTENTE" NUMBER(3,0), 
	"DATA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EVENTO
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."EVENTO" 
   (	"ID" NUMBER(3,0), 
	"TITOLO" VARCHAR2(20 BYTE), 
	"DESCRIZIONE" LONG, 
	"DATA" DATE, 
	"PUNTOINCONTRO" VARCHAR2(100 BYTE), 
	"TIPOLOGIA" VARCHAR2(20 BYTE), 
	"NMAXPARTECIPANTI" NUMBER(3,0), 
	"STATO" NUMBER(1,0), 
	"IDUTENTE" NUMBER, 
	"IMMAGINE" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POSIZIONIUTENTI
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."POSIZIONIUTENTI" 
   (	"ID" NUMBER(3,0), 
	"IDUTENTE" NUMBER(3,0), 
	"LATITUDINE" FLOAT(126), 
	"LONGITUDINE" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POST
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."POST" 
   (	"ID" NUMBER(5,0), 
	"IDUTENTE" NUMBER(3,0), 
	"IDEVENTO" NUMBER(3,0), 
	"TESTO" LONG, 
	"DATA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UTENTE
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."UTENTE" 
   (	"ID" NUMBER(3,0), 
	"NOME" VARCHAR2(20 BYTE), 
	"COGNOME" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"NICKNAME" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"DOCUMENTOVALIDO" VARCHAR2(100 BYTE), 
	"IMMAGINEPROFILO" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UTENTE_EVENTO
--------------------------------------------------------

  CREATE TABLE "GOSOFTAIR"."UTENTE_EVENTO" 
   (	"ID" NUMBER(3,0), 
	"NUMSQUADRA" NUMBER(1,0), 
	"IDUTENTE" NUMBER(3,0), 
	"IDEVENTO" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into GOSOFTAIR.ANNUNCIO
SET DEFINE OFF;
Insert into GOSOFTAIR.ANNUNCIO (ID,TITOLO,DESCRIZIONE,IMMAGINE,PREZZO,NUMEROTELEFONO,EMAIL,IDUTENTE,DATA) values (42,'dfff','dfdf','dinamodoge_compressed.jpg',4,'45353','fh@sth',0,to_date('08/02/17','DD/MM/RR'));
Insert into GOSOFTAIR.ANNUNCIO (ID,TITOLO,DESCRIZIONE,IMMAGINE,PREZZO,NUMEROTELEFONO,EMAIL,IDUTENTE,DATA) values (20,'il mio annuncio','un bell annucncio figo','vivado.jpg',12,'343242342342342','netrider@cicico.com',0,to_date('09/02/17','DD/MM/RR'));
REM INSERTING into GOSOFTAIR.EVENTO
SET DEFINE OFF;
Insert into GOSOFTAIR.EVENTO (ID,TITOLO,DESCRIZIONE,DATA,PUNTOINCONTRO,TIPOLOGIA,NMAXPARTECIPANTI,STATO,IDUTENTE,IMMAGINE) values (0,'combattiamo!','un combattimento all''ultimo sangue',to_date('23/02/17','DD/MM/RR'),'poivediamo','Tutti contro tutti',12,1,1,'jumbo5.jpg');
Insert into GOSOFTAIR.EVENTO (ID,TITOLO,DESCRIZIONE,DATA,PUNTOINCONTRO,TIPOLOGIA,NMAXPARTECIPANTI,STATO,IDUTENTE,IMMAGINE) values (101,'qwerty','Cattura la bandiera',to_date('12/03/17','DD/MM/RR'),'latlong','Cattura la bandiera',5,1,0,'20120804-.jpg');
Insert into GOSOFTAIR.EVENTO (ID,TITOLO,DESCRIZIONE,DATA,PUNTOINCONTRO,TIPOLOGIA,NMAXPARTECIPANTI,STATO,IDUTENTE,IMMAGINE) values (84,'afd','Deathmatch a squadre',to_date('08/02/17','DD/MM/RR'),'latlong','Deathmatch a squadre',4,1,1,'dinamodoge_compressed.jpg');
Insert into GOSOFTAIR.EVENTO (ID,TITOLO,DESCRIZIONE,DATA,PUNTOINCONTRO,TIPOLOGIA,NMAXPARTECIPANTI,STATO,IDUTENTE,IMMAGINE) values (100,'asdasd','Dominio',to_date('09/02/17','DD/MM/RR'),'latlong','Dominio',4,1,0,'dinamodoge_compressed.jpg');
Insert into GOSOFTAIR.EVENTO (ID,TITOLO,DESCRIZIONE,DATA,PUNTOINCONTRO,TIPOLOGIA,NMAXPARTECIPANTI,STATO,IDUTENTE,IMMAGINE) values (20,'pipo','Deathmatch a squadre',to_date('10/02/17','DD/MM/RR'),'latlong','Deathmatch a squadre',9,1,0,'Screen Shot 2017-02-06 at 10.36.18.png');
REM INSERTING into GOSOFTAIR.POSIZIONIUTENTI
SET DEFINE OFF;
Insert into GOSOFTAIR.POSIZIONIUTENTI (ID,IDUTENTE,LATITUDINE,LONGITUDINE) values (0,0,42.3727103,13.362934099999999);
Insert into GOSOFTAIR.POSIZIONIUTENTI (ID,IDUTENTE,LATITUDINE,LONGITUDINE) values (1,1,41.953913,13.641769);
Insert into GOSOFTAIR.POSIZIONIUTENTI (ID,IDUTENTE,LATITUDINE,LONGITUDINE) values (2,2,50.2,51.3);
Insert into GOSOFTAIR.POSIZIONIUTENTI (ID,IDUTENTE,LATITUDINE,LONGITUDINE) values (26,3,50.2,51.3);
REM INSERTING into GOSOFTAIR.POST
SET DEFINE OFF;
Insert into GOSOFTAIR.POST (ID,IDUTENTE,IDEVENTO,TESTO,DATA) values (0,0,0,'il primo post',to_date('23/02/17','DD/MM/RR'));
Insert into GOSOFTAIR.POST (ID,IDUTENTE,IDEVENTO,TESTO,DATA) values (1,1,0,'il mio secondo post',to_date('21/02/17','DD/MM/RR'));
Insert into GOSOFTAIR.POST (ID,IDUTENTE,IDEVENTO,TESTO,DATA) values (40,0,0,'ciao',to_date('10/02/37','DD/MM/RR'));
REM INSERTING into GOSOFTAIR.UTENTE
SET DEFINE OFF;
Insert into GOSOFTAIR.UTENTE (ID,NOME,COGNOME,EMAIL,NICKNAME,PASSWORD,DOCUMENTOVALIDO,IMMAGINEPROFILO) values (0,'matteo','polsinelli','netrider@gmail.com','netrider','pippo','OPU3892OP',null);
Insert into GOSOFTAIR.UTENTE (ID,NOME,COGNOME,EMAIL,NICKNAME,PASSWORD,DOCUMENTOVALIDO,IMMAGINEPROFILO) values (1,'nome','cognome','email','nickname','password','documento valido','immagine profilo');
Insert into GOSOFTAIR.UTENTE (ID,NOME,COGNOME,EMAIL,NICKNAME,PASSWORD,DOCUMENTOVALIDO,IMMAGINEPROFILO) values (41,'ddd','ddd','ddd@dd','ddd','12345678','123456789','dinamodoge_compressed.jpg');
REM INSERTING into GOSOFTAIR.UTENTE_EVENTO
SET DEFINE OFF;
Insert into GOSOFTAIR.UTENTE_EVENTO (ID,NUMSQUADRA,IDUTENTE,IDEVENTO) values (0,1,0,0);
Insert into GOSOFTAIR.UTENTE_EVENTO (ID,NUMSQUADRA,IDUTENTE,IDEVENTO) values (1,1,1,0);
--------------------------------------------------------
--  DDL for Index ANNUNCIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."ANNUNCIO_PK" ON "GOSOFTAIR"."ANNUNCIO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index EVENTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."EVENTO_PK" ON "GOSOFTAIR"."EVENTO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POSIZIONIUTENTI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."POSIZIONIUTENTI_PK" ON "GOSOFTAIR"."POSIZIONIUTENTI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."POST_PK" ON "GOSOFTAIR"."POST" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UTENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."UTENTE_PK" ON "GOSOFTAIR"."UTENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UTENTE_EVENTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GOSOFTAIR"."UTENTE_EVENTO_PK" ON "GOSOFTAIR"."UTENTE_EVENTO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ANNUNCIO
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" ADD CONSTRAINT "ANNUNCIO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("IDUTENTE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("PREZZO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("IMMAGINE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("DESCRIZIONE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("TITOLO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."ANNUNCIO" MODIFY ("DATA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EVENTO
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."EVENTO" ADD CONSTRAINT "EVENTO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("IDUTENTE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("STATO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("NMAXPARTECIPANTI" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("TIPOLOGIA" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("PUNTOINCONTRO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("DATA" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("DESCRIZIONE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("TITOLO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."EVENTO" MODIFY ("IMMAGINE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POSIZIONIUTENTI
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."POSIZIONIUTENTI" ADD CONSTRAINT "POSIZIONIUTENTI_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."POSIZIONIUTENTI" MODIFY ("LONGITUDINE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POSIZIONIUTENTI" MODIFY ("LATITUDINE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POSIZIONIUTENTI" MODIFY ("IDUTENTE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POSIZIONIUTENTI" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POST
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."POST" ADD CONSTRAINT "POST_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."POST" MODIFY ("TESTO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POST" MODIFY ("IDEVENTO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POST" MODIFY ("IDUTENTE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."POST" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTENTE
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."UTENTE" ADD CONSTRAINT "UTENTE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("COGNOME" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("NOME" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTENTE_EVENTO
--------------------------------------------------------

  ALTER TABLE "GOSOFTAIR"."UTENTE_EVENTO" ADD CONSTRAINT "UTENTE_EVENTO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "GOSOFTAIR"."UTENTE_EVENTO" MODIFY ("IDEVENTO" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE_EVENTO" MODIFY ("IDUTENTE" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE_EVENTO" MODIFY ("NUMSQUADRA" NOT NULL ENABLE);
  ALTER TABLE "GOSOFTAIR"."UTENTE_EVENTO" MODIFY ("ID" NOT NULL ENABLE);
