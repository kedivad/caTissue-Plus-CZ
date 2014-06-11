/*Table structure for table `DE_E_1227` */

CREATE TABLE `DE_E_1227` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1229` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1227` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1230` */

CREATE TABLE `DE_E_1230` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1235` text,
  `DE_AT_1234` text,
  `DE_AT_1233` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1230` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1236` */

CREATE TABLE `DE_E_1236` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1240` date default NULL,
  `DE_AT_1239` date default NULL,
  `DE_AT_1238` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1230_1232_IDENTIFIER` int(38) default NULL,
  `DE_E_1264_1266_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1241` */

CREATE TABLE `DE_E_1241` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1243` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1241` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1241E1230` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1230` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1244` */

CREATE TABLE `DE_E_1244` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1248` text,
  `DE_AT_1247` text,
  `DE_AT_1246` int(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1249` */

CREATE TABLE `DE_E_1249` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1253` text,
  `DE_AT_1252` text,
  `DE_AT_1251` date default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1249` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1254` */

CREATE TABLE `DE_E_1254` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1257` text,
  `DE_AT_1256` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1254` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1254E1249` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1249` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1258` */

CREATE TABLE `DE_E_1258` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1263` int(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1227_1260_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1264` */

CREATE TABLE `DE_E_1264` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1270` text,
  `DE_AT_1269` text,
  `DE_AT_1268` double default NULL,
  `DE_AT_1267` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1264` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1271` */

CREATE TABLE `DE_E_1271` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1258_1262_IDENTIFIER` int(38) default NULL,
  `DYEXTN_AS_844_1271` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1271E1264` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1264` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1274` */

CREATE TABLE `DE_E_1274` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1258_1261_IDENTIFIER` int(38) default NULL,
  `DYEXTN_AS_844_1274` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1274E1264` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1264` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1277` */

CREATE TABLE `DE_E_1277` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1277` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1277E1254` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1254` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1279` */

CREATE TABLE `DE_E_1279` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1282` text,
  `DE_AT_1281` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1279` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1279E1254` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1254` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1283` */

CREATE TABLE `DE_E_1283` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1289` text,
  `DE_AT_1288` text,
  `DE_AT_1287` text,
  `DE_AT_1286` text,
  `DE_AT_1285` date default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1283` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1290` */

CREATE TABLE `DE_E_1290` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1294` text,
  `DE_AT_1293` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1290` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1295` */

CREATE TABLE `DE_E_1295` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1295` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1295E1249` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1249` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1297` */

CREATE TABLE `DE_E_1297` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1299` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1297` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1297E1230` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1230` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1300` */

CREATE TABLE `DE_E_1300` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_844_1300` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1300E1249` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1249` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1318` */

CREATE TABLE `DE_E_1318` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1321` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1322` */

CREATE TABLE `DE_E_1322` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1324` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1318_1320_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1325` */

CREATE TABLE `DE_E_1325` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1331` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1325` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1332` */

CREATE TABLE `DE_E_1332` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1335` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1325_1330_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1336` */

CREATE TABLE `DE_E_1336` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1338` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1332_1334_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1339` */

CREATE TABLE `DE_E_1339` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1343` text,
  `DE_AT_1342` text,
  `DE_AT_1341` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1325_1329_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1344` */

CREATE TABLE `DE_E_1344` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1348` text,
  `DE_AT_1347` text,
  `DE_AT_1346` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1325_1328_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1349` */

CREATE TABLE `DE_E_1349` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1356` text,
  `DE_AT_1355` double default NULL,
  `DE_AT_1354` tinyint(1) default NULL,
  `DE_AT_1353` text,
  `DE_AT_1352` text,
  `DE_AT_1351` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1349` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1349E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1357` */

CREATE TABLE `DE_E_1357` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1357` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1357E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1359` */

CREATE TABLE `DE_E_1359` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1362` text,
  `DE_AT_1361` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1359` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1359E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1363` */

CREATE TABLE `DE_E_1363` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1363` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1363E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1365` */

CREATE TABLE `DE_E_1365` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1368` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1365` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1365E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1369` */

CREATE TABLE `DE_E_1369` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1374` int(38) default NULL,
  `DE_AT_1373` int(38) default NULL,
  `DE_AT_1372` int(38) default NULL,
  `DE_AT_1371` int(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1375` */

CREATE TABLE `DE_E_1375` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1375` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1375E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1377` */

CREATE TABLE `DE_E_1377` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1380` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1377` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1377E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1381` */

CREATE TABLE `DE_E_1381` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1385` int(38) default NULL,
  `DE_AT_1384` int(38) default NULL,
  `DE_AT_1383` int(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1386` */

CREATE TABLE `DE_E_1386` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_4_1386` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1386E1325` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1325` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1400` */

CREATE TABLE `DE_E_1400` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1403` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1325_1399_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1404` */

CREATE TABLE `DE_E_1404` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1406` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1400_1402_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1408` */

CREATE TABLE `DE_E_1408` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1412` text,
  `DE_AT_1411` text,
  `DE_AT_1410` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1377_1407_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1414` */

CREATE TABLE `DE_E_1414` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1419` text,
  `DE_AT_1418` text,
  `DE_AT_1417` text,
  `DE_AT_1416` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1365_1413_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1421` */

CREATE TABLE `DE_E_1421` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1425` text,
  `DE_AT_1424` text,
  `DE_AT_1423` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1290_1420_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1427` */

CREATE TABLE `DE_E_1427` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1431` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1227_1426_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1432` */

CREATE TABLE `DE_E_1432` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1427_1430_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1432E1274` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1274` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1434` */

CREATE TABLE `DE_E_1434` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1427_1429_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1434E1271` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1271` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1437` */

CREATE TABLE `DE_E_1437` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1439` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1620_1622_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1440` */

CREATE TABLE `DE_E_1440` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1446` text,
  `DE_AT_1445` text,
  `DE_AT_1444` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1440` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1447` */

CREATE TABLE `DE_E_1447` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1450` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1440_1443_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1451` */

CREATE TABLE `DE_E_1451` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1453` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1447_1449_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1454` */

CREATE TABLE `DE_E_1454` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1457` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1440_1442_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1458` */

CREATE TABLE `DE_E_1458` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1460` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1454_1456_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1461` */

CREATE TABLE `DE_E_1461` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1461` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1461E1440` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1440` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1468` */

CREATE TABLE `DE_E_1468` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1472` text,
  `DE_AT_1471` text,
  `DE_AT_1470` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1461_1467_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1473` */

CREATE TABLE `DE_E_1473` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1478` tinyint(1) default NULL,
  `DE_AT_1477` double default NULL,
  `DE_AT_1476` double default NULL,
  `DE_AT_1475` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1461_1466_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1479` */

CREATE TABLE `DE_E_1479` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1483` text,
  `DE_AT_1482` text,
  `DE_AT_1481` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1461_1465_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1484` */

CREATE TABLE `DE_E_1484` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1461_1464_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1489` */

CREATE TABLE `DE_E_1489` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1496` text,
  `DE_AT_1495` bigint(38) default NULL,
  `DE_AT_1494` bigint(38) default NULL,
  `DE_AT_1493` bigint(38) default NULL,
  `DE_AT_1492` bigint(38) default NULL,
  `DE_AT_1491` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1484_1488_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1497` */

CREATE TABLE `DE_E_1497` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1500` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1484_1487_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1501` */

CREATE TABLE `DE_E_1501` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1504` text,
  `DE_AT_1503` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1497_1499_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1505` */

CREATE TABLE `DE_E_1505` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1507` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1484_1486_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1508` */

CREATE TABLE `DE_E_1508` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1512` text,
  `DE_AT_1511` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1461_1463_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1513` */

CREATE TABLE `DE_E_1513` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1515` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1508_1510_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1516` */

CREATE TABLE `DE_E_1516` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1516` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1516E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1518` */

CREATE TABLE `DE_E_1518` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1523` text,
  `DE_AT_1522` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1518` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1518E1516` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1516` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1524` */

CREATE TABLE `DE_E_1524` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1526` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1518_1521_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1527` */

CREATE TABLE `DE_E_1527` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1532` text,
  `DE_AT_1531` text,
  `DE_AT_1530` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1518_1520_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1533` */

CREATE TABLE `DE_E_1533` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1535` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1527_1529_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1536` */

CREATE TABLE `DE_E_1536` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1538` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1536` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1536E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1539` */

CREATE TABLE `DE_E_1539` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1539` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1539E1536` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1536` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1541` */

CREATE TABLE `DE_E_1541` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1544` text,
  `DE_AT_1543` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1788_1790_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1545` */

CREATE TABLE `DE_E_1545` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1550` double default NULL,
  `DE_AT_1549` text,
  `DE_AT_1548` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1545` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1545E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1551` */

CREATE TABLE `DE_E_1551` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1555` text,
  `DE_AT_1554` text,
  `DE_AT_1553` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1545_1547_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1556` */

CREATE TABLE `DE_E_1556` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1558` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1600_1602_IDENTIFIER` int(38) default NULL,
  `DE_E_1749_1751_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1559` */

CREATE TABLE `DE_E_1559` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1561` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1559` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1559E1516` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1516` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1562` */

CREATE TABLE `DE_E_1562` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1565` text,
  `DE_AT_1564` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1615_1617_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1566` */

CREATE TABLE `DE_E_1566` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1569` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1797_1799_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1570` */

CREATE TABLE `DE_E_1570` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1573` text,
  `DE_AT_1572` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1566_1568_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1574` */

CREATE TABLE `DE_E_1574` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1576` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1797_1800_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1577` */

CREATE TABLE `DE_E_1577` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1583` text,
  `DE_AT_1582` text,
  `DE_AT_1581` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1577` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1577E1440` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1440` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1584` */

CREATE TABLE `DE_E_1584` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1588` text,
  `DE_AT_1587` text,
  `DE_AT_1586` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1577_1580_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1589` */

CREATE TABLE `DE_E_1589` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1592` text,
  `DE_AT_1591` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1577_1579_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1593` */

CREATE TABLE `DE_E_1593` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1599` text,
  `DE_AT_1598` text,
  `DE_AT_1597` text,
  `DE_AT_1596` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1593` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1593E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1600` */

CREATE TABLE `DE_E_1600` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1604` text,
  `DE_AT_1603` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1735_1747_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1605` */

CREATE TABLE `DE_E_1605` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1607` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1735_1746_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1608` */

CREATE TABLE `DE_E_1608` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1611` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1631_1633_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1612` */

CREATE TABLE `DE_E_1612` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1614` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1608_1610_IDENTIFIER` int(38) default NULL,
  `DE_E_1648_1650_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1615` */

CREATE TABLE `DE_E_1615` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1619` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1705_1707_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1620` */

CREATE TABLE `DE_E_1620` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1624` double default NULL,
  `DE_AT_1623` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1615_1618_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1625` */

CREATE TABLE `DE_E_1625` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1630` double default NULL,
  `DE_AT_1629` tinyint(1) default NULL,
  `DE_AT_1628` bigint(38) default NULL,
  `DE_AT_1627` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1625` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1625E1545` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1545` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1631` */

CREATE TABLE `DE_E_1631` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1639` text,
  `DE_AT_1638` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1631` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1631E1593` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1593` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1640` */

CREATE TABLE `DE_E_1640` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1643` tinyint(1) default NULL,
  `DE_AT_1642` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1788_1792_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1644` */

CREATE TABLE `DE_E_1644` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1647` text,
  `DE_AT_1646` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1631_1636_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1648` */

CREATE TABLE `DE_E_1648` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1651` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1631_1634_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1652` */

CREATE TABLE `DE_E_1652` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1658` double default NULL,
  `DE_AT_1657` double default NULL,
  `DE_AT_1656` text,
  `DE_AT_1655` bigint(38) default NULL,
  `DE_AT_1654` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1652` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1652E1545` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1545` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1659` */

CREATE TABLE `DE_E_1659` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1662` text,
  `DE_AT_1661` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1667_1670_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1663` */

CREATE TABLE `DE_E_1663` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1666` text,
  `DE_AT_1665` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1680_1682_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1667` */

CREATE TABLE `DE_E_1667` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1672` text,
  `DE_AT_1671` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1754_1758_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1673` */

CREATE TABLE `DE_E_1673` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1675` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1667_1669_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1676` */

CREATE TABLE `DE_E_1676` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1676` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1676E1545` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1545` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1680` */

CREATE TABLE `DE_E_1680` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1684` text,
  `DE_AT_1683` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1676_1679_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1685` */

CREATE TABLE `DE_E_1685` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1689` text,
  `DE_AT_1688` tinyint(1) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1676_1678_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1690` */

CREATE TABLE `DE_E_1690` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1692` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1685_1687_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1693` */

CREATE TABLE `DE_E_1693` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1696` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1715_1718_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1697` */

CREATE TABLE `DE_E_1697` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1700` double default NULL,
  `DE_AT_1699` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1693_1695_IDENTIFIER` int(38) default NULL,
  `DE_E_1723_1725_IDENTIFIER` int(38) default NULL,
  `DE_E_1727_1729_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1701` */

CREATE TABLE `DE_E_1701` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1704` text,
  `DE_AT_1703` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1705_1708_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1705` */

CREATE TABLE `DE_E_1705` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1705` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1705E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1709` */

CREATE TABLE `DE_E_1709` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1714` text,
  `DE_AT_1713` text,
  `DE_AT_1712` text,
  `DE_AT_1711` bigint(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1754_1759_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1715` */

CREATE TABLE `DE_E_1715` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1722` double default NULL,
  `DE_AT_1721` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1715` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1715E1593` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1593` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1723` */

CREATE TABLE `DE_E_1723` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1726` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1715_1720_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1727` */

CREATE TABLE `DE_E_1727` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1730` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1715_1719_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1731` */

CREATE TABLE `DE_E_1731` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1734` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1697_1733_IDENTIFIER` int(38) default NULL,
  `DE_E_1715_1717_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1735` */

CREATE TABLE `DE_E_1735` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_AT_1744` text,
  `DE_AT_1743` text,
  `DE_AT_1742` text,
  `DE_AT_1741` text,
  `DE_AT_1740` tinyint(1) default NULL,
  `DE_AT_1739` double default NULL,
  `DE_AT_1738` text,
  `DE_AT_1737` text,
  `DE_AT_1736` text,
  `DYEXTN_AS_379_1735` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1735E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1749` */

CREATE TABLE `DE_E_1749` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1753` text,
  `DE_AT_1752` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1735_1745_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1754` */

CREATE TABLE `DE_E_1754` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1761` text,
  `DE_AT_1760` int(38) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1754` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1754E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1762` */

CREATE TABLE `DE_E_1762` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1764` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1754_1756_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1765` */

CREATE TABLE `DE_E_1765` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1769` text,
  `DE_AT_1768` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1788_1793_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1770` */

CREATE TABLE `DE_E_1770` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1772` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1765_1767_IDENTIFIER` int(38) default NULL,
  `DE_E_1784_1786_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1773` */

CREATE TABLE `DE_E_1773` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1773` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1773E1461` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1461` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1777` */

CREATE TABLE `DE_E_1777` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1780` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1773_1776_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1781` */

CREATE TABLE `DE_E_1781` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1783` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1777_1779_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1784` */

CREATE TABLE `DE_E_1784` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1787` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1788_1791_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1788` */

CREATE TABLE `DE_E_1788` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1788` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1788E1593` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1593` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1794` */

CREATE TABLE `DE_E_1794` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1796` double default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1794` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1794E1545` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1545` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1797` */

CREATE TABLE `DE_E_1797` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1802` text,
  `DE_AT_1801` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DYEXTN_AS_379_1797` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1797E1536` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1536` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1828` */

CREATE TABLE `DE_E_1828` (
  `ACTIVITY_STATUS` text,
  `DE_AT_1833` double default NULL,
  `DE_AT_1832` double default NULL,
  `DE_AT_1831` double default NULL,
  `DE_AT_1830` tinyint(1) default NULL,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1773_1827_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1836` */

CREATE TABLE `DE_E_1836` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1754_1835_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1836E1473` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1473` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1838` */

CREATE TABLE `DE_E_1838` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1754_1834_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1838E1473` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1473` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1841` */

CREATE TABLE `DE_E_1841` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1593_1840_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1841E1473` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1473` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1845` */

CREATE TABLE `DE_E_1845` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1631_1844_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1845E1640` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1640` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DE_E_1847` */

CREATE TABLE `DE_E_1847` (
  `ACTIVITY_STATUS` text,
  `IDENTIFIER` bigint(38) NOT NULL default '0',
  `DE_E_1631_1843_IDENTIFIER` int(38) default NULL,
  PRIMARY KEY  (`IDENTIFIER`),
  CONSTRAINT `FKE1847E1640` FOREIGN KEY (`IDENTIFIER`) REFERENCES `DE_E_1640` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
