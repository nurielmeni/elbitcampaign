-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ikeacampaig
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fbf` int(1) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL,
  `campaign` varchar(1024) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `sid` varchar(64) DEFAULT NULL,
  `show_store` int(1) DEFAULT NULL,
  `show_cv` int(1) DEFAULT NULL,
  `button_color` varchar(16) DEFAULT NULL,
  `contact` varchar(30) NOT NULL,
  `tag_header` varchar(2048) DEFAULT NULL,
  `tag_body` varchar(2048) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `apply` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (7,0,'דף נחיתה  טסט SAFRA',1591747200,1603584000,'<h2>דף נחיתה טסט ספרא </h2><h2><br></h2>','uploads/images/1920x1080.jpg','uploads/images/לוגו איקאה חדש.png','be3ab699-3c0c-43d6-90f6-731ca00eb2cc',1,1,'','','<!-- Facebook Pixel Code -->\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'525432968409712\'); \r\nfbq(\'track\', \'PageView\');\r\n<!-- End Facebook Pixel Code -->','<!-- Facebook Pixel Code -->\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'525432968409712\'); \r\nfbq(\'track\', \'Lead\');\r\n<!-- End Facebook Pixel Code -->',23,4),(11,0,'מכירות ראשון',1592265600,1596153600,'<h2><br></h2>','uploads/images/1920x1080.jpg','uploads/images/לוגו איקאה חדש.png','be3ab699-3c0c-43d6-90f6-731ca00eb2cc',0,0,'','','<!-- Facebook Pixel Code -->\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'525432968409712\'); \r\nfbq(\'track\', \'PageView\');\r\n<!-- End Facebook Pixel Code -->','<!-- Facebook Pixel Code -->\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'525432968409712\'); \r\nfbq(\'track\', \'Lead\');\r\n<!-- End Facebook Pixel Code -->',15,1),(12,0,'Mini Site IKEA Career',1594771200,1596153600,'<h2>ברוכים הבאים לאיקאה לנד</h2><p>לצפייה במשרות הפתוחות והגשת מועמדות</p><p>מחכים לכם עם מגוון משרות שוות ווהטבות עוד יותר שוות!</p>','uploads/images/1920x1080.jpg','uploads/images/לוגו איקאה חדש.png','08e50b41-d7b3-4ffa-bb70-0cf4bf1b1adb',0,0,'','','','',7,NULL),(13,0,'אחראי/ית H.D',1599350400,1601424000,'<h2>הצטרפו אלינו לצוות תמיכת משתמשים פנים ארגוני, במחלקת מערכות מידע במטה של IKEA </h2>','uploads/images/IT_WORKER.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,1,'','','','',9,1),(14,0,'נציגים.ות למוקד השירות הארצי  הטלפוני IKEA נתניה ',1603584000,1605398400,'<h2>מחוברים כל היום לנייד ללא הפסקה? מעולה! אנחנו מגייסים נציגים.ות למוקד השרות הטלפוני הארצי בנתניה.</h2><p>נדרשות לפחות 4 משמרות בשבוע+שישי לסירוגין</p><p>השאירו לנו פרטים ונחזור בהקדם</p><p><br></p>','uploads/images/1200x628.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',77,10),(15,0,'ל- IKEA  נתניה נציגים/ות  לתחום השרות הפרונטאלי ',1609372800,1609977600,'<h2>לאיקאה נתניה נציגי/ות שירות לקוחות פרונטאלי</h2><p>&gt; משרה מלאה במשמרות</p><p>&gt; תחילת עבודה והכשרה מיידית</p><p>&gt; עובדי חברה מהיום הראשון</p><p>&gt; הטבות רבות ושוות </p><p>&gt; אופציות קידום והתפתחות אישית ומקצועית</p><p><br></p><p>השאירו לנו פרטים&nbsp;ואנו נחזור בהקדם</p><p>שנה חדשה! משרה חדשה והמון הזדמנויות</p><p><br></p>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','1eff44c1-96c1-4c81-ac1d-0b5f8cc25e6c',1,0,'','','\r\n<!-- Facebook Pixel Code -->\r\n<script>\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'1817354885176092\'); \r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript>\r\n<img height=\"1\" width=\"1\" \r\nsrc=\"https://www.facebook.com/tr?id=1817354885176092&ev=PageView\r\n&noscript=1\"/>\r\n</noscript>\r\n<!-- End Facebook Pixel Code -->\r\n','',153,3),(16,0,'ל- IKEA נתניה אחראי/ית משמרת לתחום שרות לקוחות',1609372800,1610582400,'<h2>לאיקאה נתניה אחראי/ית משמרת לתחום שרות לקוחות</h2><p>&gt; משרה מלאה במשמרות</p><p>&gt;תחילת עבודה וכניסה להליך הכשרה ייעודי מיידית</p><p>&gt; עובדי חברה מהיום הראשון</p><p>&gt;הטבות רבות</p><p>&gt;אופציות קידום והתפתחות אישית ומקצועית</p><p>&gt; נדרש ניסיון קודם בתחומי השרות/מכירות</p><p><br></p><p>השאירו לנו פרטים ונחזור בהקדם</p><p>משרה חדשה!&nbsp;שנה חדשה!&nbsp;</p><p>מחכים לכם/ן</p>','uploads/images/Sales huddle_new.jpg',NULL,'1eff44c1-96c1-4c81-ac1d-0b5f8cc25e6c',1,0,'','','\r\n<!-- Facebook Pixel Code -->\r\n<script>\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'1817354885176092\'); \r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript>\r\n<img height=\"1\" width=\"1\" \r\nsrc=\"https://www.facebook.com/tr?id=1817354885176092&ev=PageView\r\n&noscript=1\"/>\r\n</noscript>\r\n<!-- End Facebook Pixel Code -->\r\n','',167,4),(17,0,'ל IKEA אשתאול נציגים לעבודה לוגיסטית  (סביבת מחסן)',1609372800,1611446400,'<h2>אף סגר לא יעצור אותנו! מגייסים בכל הכוח:</h2><h2>ל IKEA אשתאול- נציגים/ות לעבודה לוגיסטית</h2><p>&gt;נכונות למשרה מלאה במשמרות</p><p>&gt; עובדי חברה מהיום הראשון!</p><p>&gt; הטבות שוות!</p><p>&gt; עבודה מיידית בחנות אשתאול</p><p>&gt; נדרשת נכונות לעבודה מאומצת (פיזית)</p><p>&gt;</p><p><br></p><p>שנה חדשה! משרה חדשה והמון הזדמנויות</p><p>השאירו לנו פרטים ונחזור בהקדם</p><p><br></p>','uploads/images/Logistic Worker.jpg','uploads/images/לוגו איקאה חדש.png','1eff44c1-96c1-4c81-ac1d-0b5f8cc25e6c',1,0,'','','<!-- Facebook Pixel Code -->\r\n<script>\r\nconsole.log(\"Facebook Tag Manager\");\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'1817354885176092\'); \r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript>\r\n<img height=\"1\" width=\"1\" \r\nsrc=\"https://www.facebook.com/tr?id=1817354885176092&ev=PageView\r\n&noscript=1\"/>\r\n</noscript>\r\n<!-- End Facebook Pixel Code -->\r\n','<script>\r\nfbq(\'track\', \'Lead\');\r\n</script>',376,13),(18,0,'ל IKEA ראשל\"צ נציגי שירות לקוחות פרונטאלי',1609372800,1610582400,'<h2>לאיקאה ראשל\"צ נציגי שירות לקוחות פרונטאלי</h2><p>&gt; עובדי חברה מהיום הראשון</p><p>&gt; עבודה ומיידית וכניסה לתוכנית הכשרה</p><p>&gt; הטבות שוות!</p><p>&gt; נכונות למשרה מלאה במשמרות</p><p><br></p><p>שנה חדשה! משרה חדשה! והמון הזדמנויות</p><p>השאירו לנו פרטים ונחזור בהקדם</p><p><br></p>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','1eff44c1-96c1-4c81-ac1d-0b5f8cc25e6c',1,0,'','','<!-- Facebook Pixel Code -->\r\n<script>\r\nconsole.log(\"Facebook Tag Manager\");\r\n!function(f,b,e,v,n,t,s)\r\n{if(f.fbq)return;n=f.fbq=function(){n.callMethod?\r\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};\r\nif(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\';\r\nn.queue=[];t=b.createElement(e);t.async=!0;\r\nt.src=v;s=b.getElementsByTagName(e)[0];\r\ns.parentNode.insertBefore(t,s)}(window,document,\'script\',\r\n\'https://connect.facebook.net/en_US/fbevents.js\');\r\nfbq(\'init\', \'1817354885176092\'); \r\nfbq(\'track\', \'PageView\');\r\n</script>\r\n<noscript>\r\n<img height=\"1\" width=\"1\" \r\nsrc=\"https://www.facebook.com/tr?id=1817354885176092&ev=PageView\r\n&noscript=1\"/>\r\n</noscript>\r\n<!-- End Facebook Pixel Code -->\r\n','<script>\r\nfbq(\'track\', \'Lead\');\r\n</script>',746,28),(19,0,'ל IKEA נתניה - נציגי שירות לקוחות פרונטאלי',1609804800,1611014400,'<h2>ל IKEA  - נציגי שירות לקוחות פרונטאלי</h2><p><br></p><p>המשרה הכי שווה בעיר!!!!</p><p>עובד חברה מהיום הראשון בחברה הכי שווה!</p><p>אחלה תנאים </p><p>אפשרויות קידום מרובות </p><p>שלח/י פרטים ונחזור מייד!!!</p><p> העבודה בכל חנויות הרשת בארץ</p>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','1eff44c1-96c1-4c81-ac1d-0b5f8cc25e6c',0,0,'','','','',21,NULL),(20,0,'נציגי שירות לקוחות - מוקד ארצי',1610236800,1611446400,'<p>אף סגר לא יעצור אותנו מלגייס!!!</p><p> באיקאה מחפשים נציגים/ות</p><p> למוקד השרות הטלפוני</p><p> אז אם אתם/ן אדיבים/ות ונעימים/ות –</p><p> תשאירו פרטים ונרים אליכם טלפון!</p><p> אנחנו מחכים לכם עם אווירה מדהימה,</p><p> אנשים טובים, ארוחות צהריים מסובסדות,</p><p> תנאים סוציאליים מעולים ועוד המון הטבות שוות!!!</p><h2> </h2>','uploads/images/1200x628.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',41,7),(21,0,'נציגי שירות פרונטאלי ראשל\"צ',1610236800,1612051200,'<h2>לאיקאה ראשל\"צ דרושים/ות נציגי/ות שירות פרונטאלי:</h2><p>מחפש/ת תפקיד סופר מעניין?</p><p>משמרות ושעות גמישות?</p><p>אה.. וגם שלא חייב בו ניסיון קודם? מעולה!</p><p>אנחנו מחכים לכם עם מגוון אפשרויות קידום,</p><p>אווירה מדהימה, אנשים טובים, ארוחות צהריים מסובסדות ותנאים מעולים!</p><h2><br></h2>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',16,NULL),(22,0,'נציגי שירות פרונטאלי נתניה',1610236800,1612051200,'<p>לאיקאה נתניה דרושים/ות נציגי/ות שירות פרונטאלי </p><p>נמאס מלדבר בטלפון?</p><p>מחפשים תפקיד סופר מעניין?</p><p> משמרות ושעות גמישות?</p><p> אה.. וגם שלא חייב בו ניסיון קודם? מעולה!</p><p> אנחנו מחכים לכם עם מגוון אפשרויות קידום,</p><p> אווירה מדהימה, אנשים טובים, ארוחות צהריים מסובסדות ותנאים מעולים!</p><h2><br></h2>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',14,2),(23,0,'נציג/ת מכירות פרונטאלי לאיקאה אשתאול',1610323200,1612051200,'<h2>אף סגר לא יעצור אותנו!</h2><p>ממשיכים לגייס בכל הכח: לIKEA אשתאול דרוש/ה נציג/ת מכירות פרונטאלי </p><p>רוצים להתקדם ולהגיע רחוק?</p><p>יופי! כי הגעתם למקום הנכון.</p><p>אנחנו מחפשים את נציגי המכירות החדשים שלנו.</p><p>מחכים לכם פה באיקאה אשתאול עם אווירה מדהימה, אנשים טובים, ארוחות צהריים מפנקות,</p><p>תנאים סוציאליים מעולים ועוד המון</p><p>הטבות שוות!</p>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',145,8),(24,0,'נציגי שירות פרונטאלי קריית אתא',1610928000,1612051200,'<p>אף סגר לא יעצור אותנו!</p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">לאיקאה קריית אתא דרושים/ות נציגי/ות שרות לקוחות פרונטאלי!</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">התפקיד כולל מתן שרות זמין, איכותי ומקצועי ללקוחות החנות.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">מענה בדלפקי השירות בנושאי החזרות, החלפות, מימוש אחריות, תיאום הובלות ועוד.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">מסירת מוצרי איסוף ללקוחות.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">מתן תמיכה למחלקות המכירה ועבודה מול ממשקים שונים בחנות.</span></p><p><br></p><h2><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\" class=\"ql-size-small\">עבודה במשרה מלאה במשמרות בוקר וערב 6 ימים בשבוע - ראשון עד שישי.</span></h2>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',NULL,NULL),(25,0,'נציגי שירות לקוחות טלפוני ודיגיטלי- מוקד ארצי איקאה',1611100800,1612051200,'<h3> גם ככה אתם מחוברים/ת לטלפון ולמחשב</h3><h3> בלי הפסקה? מעולה!</h3><h3> באיקאה מחפשים נציגים/ת</h3><h3> למוקד השרות הטלפוני</h3><h3> אז אם אתם אדיבים ונעימים –</h3><h3> תשאירו פרטים ונרים אליכם טלפון!</h3><h3> אנחנו מחכים לכם עם אווירה מדהימה,</h3><h3> אנשים טובים, ארוחות צהריים מפנקות,</h3><h3> תנאים סוציאליים מעולים ועוד המון</h3><h3> הטבות שוות.</h3>','uploads/images/Information systems 2.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',65,9),(26,0,'נציג/ת מכירות למחלקת השירות העצמי באיקאה באר שבע',1611446400,1612224000,'<p>אף סגר לא יעצור אותנו!!!</p><p>אנחנו מגייסים נציגי/ות מכירה למגוון מחלקות המכירה בחנות.</p><p>תחומי אחריות מרכזיים:</p><p>הכשרת המחלקה ליום מכירה ובמהלכו בהתאם לנהלי החברה.</p><p>מכירת מוצרי איקאה תוך מתן שרות מקצועי ויעיל ברמה גבוהה.&nbsp;</p><p>ייצוג החנות ומדיניותה במקצועיות התואמת את הקונספט ה\"איקאי\".</p><p>משרה מלאה במשמרות, כולל משמרת אחת בסופ\"ש (שישי בוקר/מוצ\"ש).&nbsp;</p><p><br></p><h2><br></h2>','uploads/images/Frontal Service_.jpg','uploads/images/לוגו איקאה חדש.png','ca050571-8c28-4c9e-9cd9-49341f6afc23',1,0,'','','','',36,3);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1594668933),('m181231_232500_create_campain_table',1594669425),('m200708_180612_add_hits_column_apply_column_to_campaign_table',1594669425);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-29 12:38:27
