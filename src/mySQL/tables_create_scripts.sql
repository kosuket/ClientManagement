CREATE TABLE `CLIENT` (
  `CLIENT_ID` INT(11) NOT NULL,
  `LAST_NAME` VARCHAR(45) DEFAULT NULL,
  `FIRST_NAME` VARCHAR(45) DEFAULT NULL,
  `MIDDLE_NAME` VARCHAR(45) DEFAULT NULL,
  `KANJI_FIRST_NAME` VARCHAR(50) DEFAULT NULL,
  `KANJI_LAST_NAME` VARCHAR(50) DEFAULT NULL,
  `GENDER` INT(11) NOT NULL DEFAULT '0',
  `EMAIL_ADDRESS` VARCHAR(45) DEFAULT NULL,
  `WORK_PLACE` VARCHAR(1000) DEFAULT NULL,
  `SPONSORED_FLG` INT(11) DEFAULT NULL,
  `UNIVERSITY_NAME` VARCHAR(200) DEFAULT NULL,
  `UNIVERSITY_MAJOR` VARCHAR(45) DEFAULT NULL,
  `UNIVERSITY_DEGREE` VARCHAR(45) DEFAULT NULL,
  `UNIVERSITY_GPA` DOUBLE DEFAULT NULL,
  `ACADEMIC_AWARDS_FLG` INT(11) DEFAULT NULL,
  `PUBLICATION_FLG` INT(11) DEFAULT NULL,
  `STUDIED_ABROAD_FLG` INT(11) DEFAULT NULL,
  `STUDIED_ABROAD_PLACE` VARCHAR(45) DEFAULT NULL,
  `USE_ENGLISH_AT_WORK_FLG` INT(11) DEFAULT NULL,
  `FUTURE_GOAL` VARCHAR(2000) DEFAULT NULL,
  `CLIENT_MEMO` VARCHAR(4000) DEFAULT NULL,
  `COUNSELOR_MEMO` VARCHAR(4000) DEFAULT NULL,
  `ALPHA_FLG` INT(11) NOT NULL DEFAULT '0',
  `STANDARD_FLG` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='MANAGE INFO UNIQUE TO CLIENT';


CREATE TABLE `CLIENT_GMAT` (
  `CLIENT_ID` INT(11) NOT NULL,
  `SCORE_NO` INT(11) NOT NULL DEFAULT '0',
  `TEST_DATE` DATE DEFAULT NULL,
  `TOTAL` INT(11) DEFAULT NULL,
  `VERBAL` INT(11) DEFAULT NULL,
  `MATH` INT(11) DEFAULT NULL,
  `AWA` INT(11) DEFAULT NULL,
  `INTEGRATED_REASONING` INT(11) DEFAULT NULL,
  `MEMO` VARCHAR(5000) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`SCORE_NO`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='MANAGE INFO ABOUT CLIENT''S GMAT SCORE';


CREATE TABLE `CLIENT_SCHOOL_MAP` (
  `CLIENT_ID` INT(11) NOT NULL,
  `SCHOOL_ID` INT(11) NOT NULL,
  `PERSONAL_RANK` INT(11) DEFAULT NULL,
  `ROUND` VARCHAR(45) DEFAULT NULL,
  `RESULT` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`SCHOOL_ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='MANAGE RELATION BETWEEN CLIENT AND SCHOOL';


CREATE TABLE `CLIENT_TOEFL` (
  `CLIENT_ID` INT(11) NOT NULL,
  `SCORE_NO` INT(11) NOT NULL,
  `TOTAL` INT(11) DEFAULT NULL,
  `TEST_DATE` DATE DEFAULT NULL,
  `READING` INT(11) DEFAULT NULL,
  `LISTENING` INT(11) DEFAULT NULL,
  `SPEAKING` INT(11) DEFAULT NULL,
  `WRITING` INT(11) DEFAULT NULL,
  `MEMO` VARCHAR(5000) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`SCORE_NO`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='MANAGE INFO ABOUT CLIENT''S TOEFL SCORE';


CREATE TABLE `COUNSELING` (
  `CLIENT_ID` INT(11) NOT NULL,
  `SEQ` INT(11) NOT NULL,
  `BILL_ID` INT(11) NOT NULL DEFAULT '0',
  `COUNSELING_TYPE` INT(11) DEFAULT NULL,
  `HOURS` DOUBLE NOT NULL DEFAULT '0',
  `COUNSELING_DATE` DATE DEFAULT NULL,
  `START_TIME` TIME DEFAULT NULL,
  `END_TIME` TIME DEFAULT NULL,
  `CONTENT_TYPE` VARCHAR(200) DEFAULT NULL,
  `MEMO` VARCHAR(5000) DEFAULT NULL,
  `NEXT_ACTION` VARCHAR(5000) DEFAULT NULL,
  `APP_STATUS` VARCHAR(200) DEFAULT NULL,
  `PACKAGE_HOURS` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SEQ`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='MANAGE INFO. ABOUT COUNSELING';


CREATE TABLE `SCHOOL` (
  `SCHOOL_ID` INT(11) NOT NULL,
  `SCHOOL_NAME` VARCHAR(500) DEFAULT NULL,
  `FIRST_DEADLINE` DATE DEFAULT NULL,
  `SECOND_DEADLINE` DATE DEFAULT NULL,
  `THIRD_DEADLINE` DATE DEFAULT NULL,
  `FORTH_DEADLINE` DATE DEFAULT NULL,
  `AVG_GMAT` INT(11) DEFAULT NULL,
  `AVG_TOEFL` INT(11) DEFAULT NULL,
  `MEMO` VARCHAR(5000) DEFAULT NULL,
  PRIMARY KEY (`SCHOOL_ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COMMENT='INFO UNIQUE TO  SCHOOL';


CREATE TABLE `BILLING_REQUEST` (
  `CLIENT_ID` INT(11) NOT NULL DEFAULT '0',
  `BILL_ID` INT(11) NOT NULL DEFAULT '0',
  `BOOK_DATE` DATE DEFAULT NULL,
  `BOOK_AMOUNT` INT(11) NOT NULL DEFAULT '0',
  `BILLING_TYPE` INT(11) NOT NULL DEFAULT '0',
  `MEMO` VARCHAR(1000) DEFAULT NULL,
  `TOTAL_HOUR` DOUBLE NOT NULL DEFAULT '0',
  `CURRENT_HOUR` DOUBLE NOT NULL DEFAULT '0',
  `PANIC_FLG` INT(11) NOT NULL DEFAULT '0',
  `COUNSELING_SEQ` INT(11) NOT NULL DEFAULT '0',
  `INVOICE_ID` INT(11) NOT NULL DEFAULT '0',
  `RECEIPT_FLG` INT(11) NOT NULL DEFAULT '0',
  `INPUT_DATETIME` DATETIME DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BILL_ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE `INVOICE` (
  `CLIENT_ID` INT(11) NOT NULL DEFAULT '0',
  `INVOICE_ID` INT(11) NOT NULL DEFAULT '0',
  `SUBJECT` VARCHAR(500) DEFAULT NULL,
  `BODY` VARCHAR(5000) DEFAULT NULL,
  `START_DATE` DATE DEFAULT NULL,
  `END_DATE` DATE DEFAULT NULL,
  `RECEIPT_FLG` INT(11) NOT NULL DEFAULT '0',
  `INPUT_DATETIME` DATETIME DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`INVOICE_ID`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;
