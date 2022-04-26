/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `CUSTOMERID` int(11) NOT NULL,
  `BANKID` int(11) NOT NULL,
  `AMOUNT` decimal(65,2) NOT NULL,
  PRIMARY KEY (`CUSTOMERID`,`BANKID`),
  KEY `BANKID` (`BANKID`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`CUSTOMERID`) REFERENCES `CustomerAccount` (`CUSTOMERID`),
  CONSTRAINT `Account_ibfk_2` FOREIGN KEY (`BANKID`) REFERENCES `PersonalBankAccount` (`BANKID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerAccount` (
  `CUSTOMERID` int(11) NOT NULL,
  `FULLNAME` char(50) NOT NULL,
  `ADDRESS` char(50) DEFAULT NULL,
  `BALANCE` decimal(65,2) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exchange` (
  `EXCHANGEID` int(11) NOT NULL,
  `TRANSACTIONID` int(11) NOT NULL,
  PRIMARY KEY (`EXCHANGEID`,`TRANSACTIONID`),
  KEY `TRANSACTIONID` (`TRANSACTIONID`),
  CONSTRAINT `Exchange_ibfk_1` FOREIGN KEY (`EXCHANGEID`) REFERENCES `StockExchange` (`EXCHANGEID`),
  CONSTRAINT `Exchange_ibfk_2` FOREIGN KEY (`TRANSACTIONID`) REFERENCES `StockTransaction` (`TRANSACTIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Market` (
  `EXCHANGEID` int(11) NOT NULL,
  `STOCKSYMBOL` char(5) NOT NULL,
  PRIMARY KEY (`EXCHANGEID`,`STOCKSYMBOL`),
  KEY `STOCKSYMBOL` (`STOCKSYMBOL`),
  CONSTRAINT `Market_ibfk_1` FOREIGN KEY (`EXCHANGEID`) REFERENCES `StockExchange` (`EXCHANGEID`),
  CONSTRAINT `Market_ibfk_2` FOREIGN KEY (`STOCKSYMBOL`) REFERENCES `Stock` (`STOCKSYMBOL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `ORDERSTATUSID` int(11) NOT NULL,
  `ORDERTYPE` char(25) NOT NULL,
  PRIMARY KEY (`ORDERSTATUSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ORDERID` int(11) NOT NULL,
  `EXCHANGEREQUESTAMOUNT` decimal(65,2) NOT NULL,
  `LIMITORDER` tinyint(1) DEFAULT 1,
  `MARKETORDER` tinyint(1) DEFAULT 0,
  `CUSTOMERID` int(11) NOT NULL,
  `ORDERSTATUSID` int(11) NOT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `CUSTOMERID` (`CUSTOMERID`),
  KEY `ORDERSTATUSID` (`ORDERSTATUSID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CUSTOMERID`) REFERENCES `CustomerAccount` (`CUSTOMERID`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`ORDERSTATUSID`) REFERENCES `OrderStatus` (`ORDERSTATUSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonalBankAccount` (
  `BANKID` int(11) NOT NULL,
  `BANKNAME` char(50) DEFAULT NULL,
  `ROUTINGNUM` int(11) DEFAULT NULL,
  `BALANCE` decimal(65,2) DEFAULT NULL,
  `WITHDRAW` decimal(65,2) DEFAULT NULL,
  `DEPOSIT` decimal(65,2) DEFAULT NULL,
  `CURRENTDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`BANKID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stock` (
  `STOCKSYMBOL` char(5) NOT NULL,
  `NAMEOFCOMPANY` char(30) NOT NULL,
  `SHARE` int(11) NOT NULL,
  PRIMARY KEY (`STOCKSYMBOL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockExchange` (
  `EXCHANGEID` int(11) NOT NULL,
  `ORDERID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EXCHANGEID`),
  KEY `ORDERID` (`ORDERID`),
  CONSTRAINT `StockExchange_ibfk_1` FOREIGN KEY (`ORDERID`) REFERENCES `Orders` (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockTransaction` (
  `TRANSACTIONID` int(11) NOT NULL,
  `EXCHANGEDSTOCK` char(20) NOT NULL,
  `EXCHANGEDWITH` char(20) NOT NULL,
  `REDCIPIENT` char(20) NOT NULL,
  `CURRENTDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CUSTOMERID` int(11) NOT NULL,
  PRIMARY KEY (`TRANSACTIONID`),
  KEY `CUSTOMERID` (`CUSTOMERID`),
  CONSTRAINT `StockTransaction_ibfk_1` FOREIGN KEY (`CUSTOMERID`) REFERENCES `CustomerAccount` (`CUSTOMERID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
