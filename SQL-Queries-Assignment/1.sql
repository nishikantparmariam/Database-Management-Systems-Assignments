/*
    Before running these queries, kindly make a new database and import database schema file 'db_schema.sql'

    Note - 
    1. The created_at column in some tables automatically uses current date and time when a new record is inserted, but just to make results of queries more meaningful, custom created_at time has been mentioned while inserting. 
    2. Similarly, the primary key (id) for all tables is auto increment but just to make data consistent and satisfy the constraints, a custom key (unique for each table) has been mentioned while inserting.
    3. Run all the queries sequentially one-by-one from top to bottom in this file.

*/


INSERT INTO users VALUES  
(1,'2021-01-26 00:15:41','yaduoon@gmail.com','128d5766','Yadunandan Ramkissoon',7598525856,'Madrid'),
(2,'2021-01-26 00:15:44','naseent@gmail.com','41489a1f','Naseer Bhai Pant',7961531384,'Bikaner'),
(3,'2021-01-26 00:15:46','harisak@gmail.com','2dd3ad0c','Hari Basak',7488188176,'Bikaner'),
(4,'2021-01-26 00:15:50','meghanhal@gmail.com','69c498df','Meghana Satishwar Mahal',2755280906,'Gurgaon'),
(5,'2021-01-26 00:15:52','nalinian@gmail.com','783a8010','Nalini Anil Narasimhan',5780377113,'Meerut'),
(6,'2021-01-26 00:15:54','narmadyak@gmail.com','09d8d928','Narmada Nayak',9936410311,'Bhubhaneshwar'),
(7,'2021-01-26 00:15:57','anirudogi@gmail.com','272ffcb8','Aniruddh Rastogi',5021364823,'Patna'),
(8,'2021-01-26 00:15:59','wafiqud@gmail.com','a554c5c9','Wafiq Koushtubh Persaud',5021364823,'Jammu'),
(9,'2021-01-26 00:16:01','krishha@gmail.com','a554c5c9','Krishna Jha',8505744675,'Pondicherry'),
(10,'2021-01-26 00:16:04','nilaani0@gmail.com','b3264287','Nilam Sani',4234399673,'Chennai'),
(11,'2021-01-26 00:16:06','nilaani@gmail.com','b3264287','Raj Bose',6577952620,'Kochi'),
(12,'2021-01-26 00:16:10','padmins@gmail.com','efb9e3d1','Padmini Bains ',2937653730,'Madrid'),
(13,'2021-01-26 00:16:10','malikrar@gmail.com','ffb69a28','Malik Umar Morar',2804571702,'Gandhinagar'),
(14,'2021-01-26 00:16:10','romachll@gmail.com','982d129d','Roma Chitranjan Mall',4277749252,'Bhubhaneshwar'),
(15,'2021-01-26 00:16:10','nainaha@gmail.com','fcd228fa','Naina Saha ',9163708873,'Rajkot'),
(16,'2021-01-26 00:16:10','prernakur@gmail.com','e6f9be8f','Prerna Thakur',9331342773,'Bengaluru'),
(17,'2021-01-26 00:16:12','chanil@gmail.com','b3264287','Chand Harpreet Bail',8935173304,'Mumbai'),
(18,'2021-01-26 00:16:12','naraytta@gmail.com','e254d079','Narayan Prabhat Dutta',4644360055,'Srinagar'),
(19,'2021-01-26 00:16:12','prereka@gmail.com','ef75ff97','Prerna Ajeet Meka',1355628874,'Jamnagar'),
(20,'2021-01-26 00:16:12','chhavtt@gmail.com','4a3b8395','Chhavi Natt',3421653392,'Surat'),
(22,'2021-01-26 16:41:34','parmar.jos@gmail.com','45acdpcdf','Joseph Parmar',9131314789,' Barelly'),
(23,'2021-01-26 23:22:39','shah.rishi@gmail.com','8acdf9d8ds','Rishi Shah Vridhan',7892489510,'Madrid');




INSERT INTO retailers VALUES 
(84,'Rishi Kolagunta','rishi.kolagunta@yahoo.com','Ahmedabad'),
(85,'Atul Bhai Garg','atularg@gmail.com','Udaipur'),
(86,'Labeen Rattan','labeean@gmail.com','Hisar'),
(87,'Sweta Rajagopalan','swetalan@gmail.com','Indore'),
(88,'Ritika Raman','ritikan@gmail.com','Ahmedabad'),
(89,'Kirti Dora','kirtira@gmail.com','Faridabad'),
(90,'Nayan Borra','nayanra@gmail.com','Agra'),
(91,'Amir Chahal','amirchal@gmail.com','Ahmedabad'),
(92,'Naseer Lal Vig','naseervig@gmail.com','Guwahati'),
(93,'Deepesh Jhaveri','deepesri@gmail.com','Ratlam'),
(94,'Ram Wable ','ramwable@gmail.com','Chandigarh'),
(95,'Zahir Som','zahiom@gmail.com','Mysore'),
(96,'Mehul Mehrotra','mehulra@gmail.com','Jamnagar'),
(97,'Abhishek Chandra Soni','abhini@gmail.com','Vishakhapattanam'),
(98,'Atul Nadkarni','atulnni@gmail.com','Pune'),
(99,'Vikrant Mehra','vikrahra@gmail.com','Ajmer'),
(100,'Hemendra Singh Yogi','hemegi@gmail.com','Gandhinagar'),
(101,'Pooja Pandit','poojdit@gmail.com','Ahmedabad'),
(102,'Prabha Naval Kaul','prabhaul@gmail.com','Kanpur'),
(103,'Sara Murty','saramrty@gmail.com','Patna');



INSERT INTO products VALUES 
(1,'2021-01-26 01:07:28','Lenovo 56 - Legion',84,'2020-08-27 13:15:12','Best Laptop for Students',15460.00,'electronic'),
(2,'2021-01-26 13:23:58','Bake of God',98,'2019-04-27 10:15:11','This book describes how a man lives his life with no mo',4599.00,'novel'),
(3,'2021-01-26 13:25:19','The Science of Everything',100,'2012-11-20 09:05:19','It is a story about how a child understand everything from scratch.',4599.00,'novel'),
(4,'2021-01-26 13:26:46','The 21 Centuary Earth',98,'2020-08-05 11:55:29','This book describes how a man lives his life in 21st centuary by maintaing his health and expenses',4599.00,'novel'),
(5,'2011-10-11 02:15:59','The Art of Speaking',86,'2019-12-02 01:54:49','How to become a good speaker in few weeks?',100.00,'novel'),
(6,'2021-01-11 00:15:59','The History of Tom Jones, a Foundling ',88,'2011-10-10 02:44:09','The History of Tom Jones, a Foundling, often known simply as Tom Jones, is a comic novel by English playwright and novelist Henry Fielding. It is a Bildungsroman and a picaresque novel. It was first published on 28 February 1749 in London and is among the earliest English works to be classified as a novel.[1] It is the earliest novel mentioned by W. Somerset Maugham in his 1948 book Great Novelists and Their Novels among the ten best novels of the world.',30019.00,'novel'),
(7,'2021-01-26 13:39:40','Pride and Prejudice',94,'2012-11-12 04:45:59','Pride and Prejudice is an 1813 romantic novel of manners written by Jane Austen. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness. Its humour lies in its honest depiction of manners, education, marriage, and money during the Regency era in Great Britain.',319.00,'novel'),
(8,'2020-01-11 00:15:59','The Red and the Black',94,'1912-11-12 09:15:29','The Red and the Black is a historical psychological novel in two volumes by Stendhal, published in 1830.[1] It chronicles the attempts of a provincial young man to rise socially beyond his modest upbringing through a combination of talent, hard work, deception, and hypocrisy. He ultimately allows his passions to betray him.',4987.00,'novel'),
(9,'2021-01-26 13:45:26','Men T-Shirt',102,'2021-01-01 11:45:22','Care Instructions: Hand Wash Only, Fit Type: regular fit, Fabric: Cotton, Sleeve Type: Half Sleeve, Neck Style: Polo Neck, Color : Multicolored',1890.00,'cloth'),
(10,'2021-01-26 13:46:36','Men Polos Max',99,'2020-03-02 10:45:22','Care Instructions: Machine wash in cold water. Do not bleach. Do not wring or twist. Dry in shade. Warm low iron. Machine dry not recommended. Fit Type: regular fit, Fabric: Cotton, Neck Style: Turtle Neck, Pattern: Striped, Sleeve Type: Half Sleeve',1251.00,'cloth'),
(11,'2021-01-26 13:47:40','MAX Men Solid Slim Fit Polo',87,'2021-01-02 11:35:21','Care Instructions: Machine Wash, Fit Type: Slim Fit, MAX Men Solid Slim Fit Polo T-shirt, Material :Cotton Blend, Color : GREEN, Design : printed, Care instruction : Machine Wash',399.00,'cloth'),
(12,'2021-01-26 13:48:10','MAX Men Solid Slim Fit Polo',86,'2019-11-12 10:39:31','Care Instructions: Machine Wash, Fit Type: Slim Fit, MAX Men Solid Slim Fit Polo T-shirt, Material :Cotton Blend, Color : GREEN, Design : printed, Care instruction : Machine Wash',599.00,'cloth'),
(13,'2021-01-26 13:48:59','Deniklo Men Regular Fit Polo',85,'2019-10-11 11:31:33','Care Instructions: Machine Wash, Fit Type: Regular Fit, Material - Cotton Polyester Blend Jersey Fabric, Fit Type - Regular fit; Half sleeve Polo T-Shirt, Pattern - Striped, Bio washed, Medium size is 40 inches chest',789.00,'cloth'),
(14,'2021-01-26 13:52:22','Xiaomi Mi A3 (Not Just Blue, 4GB RAM, 64GB Storage)',92,'2020-11-12 10:01:43','48+8+2MP AI triple rear camera with portrait mode, HDR, PDAF supported | 32MP front camera with f2.0, 1/2.8 inch pixel size, portrait mode, HDR supported\n15.46 centimeters (6.088-inch) AMOLED multi-touch capacitive touchscreen with 1520 x 720 pixels resolution, 282 ppi pixel density, Steady handheld night photography',14999.00,'electronic'),
(15,'2021-01-26 13:54:13','Redmi 9 (Carbon Black, 4GB RAM, 128GB Storage)',95,'2020-01-11 09:22:13','Country Of Origin - India, China\n13+2MP dual camera with AI portrait, AI scene recognition, HDR, pro mode | 5MP front camera\n16.58 centimeters (6.53 inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density and 20:9 aspect ratio',10002.00,'electronic'),
(16,'2021-01-26 13:56:23','Acer Swift Ultra Thin and Light Notebook Laptop',96,'2020-02-08 01:12:16','Best laptop for students and working professionals. Processor: Intel Core i5-1135G7 processor, turbo up to 4.20 Ghz\nDisplay: 14\" display with IPS (In-Plane Switching) technology, Full HD 1920 x 1080, high-brightness (300nits) Acer ComfyView LED-backlit TFT LCD',10010.00,'electronic'),
(17,'2021-01-26 13:57:26','ASUS VivoBook 14 AMD',98,'2020-02-08 01:12:16','Best laptop for teachers. Processor: AMD Ryzen 3 3250U Processor, 2.6 GHz (4MB Cache, up to 3.5 GHz, 2 Core, 4 Threads)\nMemory & Storage: 4GB DDR4 2400MHz onboard RAM, upgradeable up to 12GB using empty 1x SO-DIMM Slot with | Storage: 1TB SATA 5400RPM 2.5-inch HDD + empty 1x M.2 Slot for SSD storage expansion.',28019.00,'electronic'),
(18,'2021-01-26 13:59:33','AVITA PURA NS14A6INU442-SGGYB 14-inch Laptop',101,'2021-01-12 11:02:06','Processor: AMD Ryzen 3-3200 processor, 2.60 GHz base processor speed, 3.50 GHz Max speed\nOperating System:Pre-loaded Windows 10 home with lifetime validity |Preinstalled Software: MS Office 365(1 year validity)| In the box: Laptop, AC Adapter, User Guide, Cleaning Cloth, 3 in 1 Sleeve',19519.00,'electronic'),
(19,'2021-01-26 14:00:39','Lenovo E41-45 (82BF000JIH) Laptop',102,'2020-01-12 10:02:06','Brand : Lenovo Model Name: E41-45 Model Number : 82BF000JIH Processor : AMD A6-7350B RAM : 4 GB HDD : 1 TB Screen Size : 14 Inch Operating System : Windows 10 Home Warranty : 1 Year',18999.00,'electronic'),
(20,'2021-01-26 14:02:03','Dell Vostro 3491 14-inch FHD l aptop',100,'2021-01-26 11:52:56','Processor:10th Generation Intel Core i3-1005G1 Processor (4MB Cache, 1.20 GHz to 3.4 GHz)\nMemory & Storage:4 GB RAM Single Channel DDR4 2666 MHz | 256GB M.2 PCIe NVMe\nSolid State Drive (Boot) + 1TB 5400 rpm 2.5\" SATA Hard Drive\nDisplay:14.0-inch FHD (1920 x 1080) Anti-Glare LED Backlit WVA Display',180999.00,'electronic'),
(21,'2021-01-29 20:46:42','Xiomi Mi 10 i',98,'2020-01-01 10:02:06','10th Generation Intel Core i3-1005G1 Processor (4MB Cache, 1.20 GHz to 3.4 GHz)\nMemory & Storage:4 GB RAM Single Channel DDR4 2666 MHz | 256GB M.2 PCIe NVMe\nSolid State Drive (Boot) + 1TB 5400 rpm 2.5\" SATA Hard Drive\nDisplay:14.0-inch FHD (1920 x 1080) Anti-Glare LED Backlit WVA Display',1530.00,'electronic');




INSERT INTO ratings_and_reviews VALUES 
(6,1,'Yadunandan Ramkissoon','2','The product was not that good! Waste of money.',18,'2021-01-26 16:42:42'),
(7,5,'Nalini Anil Narasimhan','4',NULL,2,'2021-01-26 16:42:47'),
(8,1,'Yadunandan Ramkissoon','5','Awesome product. A must buy for this price. Really nice.',9,'2021-01-26 16:42:53'),
(10,22,'Joseph Parmar','1','Product is fake.',15,'2021-01-26 16:43:14'),
(11,22,'Joseph Parmar','3','Average product. Buy only if you have money. Not for general purpose.',11,'2021-01-26 16:43:20'),
(12,2,'Naseer Bhai Pant','5','I did not like the product',20,'2021-01-30 02:07:00'),
(13,3,'Hari Basak','5','Nice product.',19,'2021-01-30 02:07:01'),
(14,4,'Meghana Satishwar Mahal','5','Waste of money.',18,'2021-01-30 02:07:05'),
(15,5,'Nalini Anil Narasimhan','5','After 2-3 days, product didnt feel useful.',17,'2021-01-30 02:07:08'),(16,6,'Narmada Nayak','5','A must buy for all.',16,'2021-01-30 02:07:11'),
(17,7,'Aniruddh Rastogi','4','No value for money.',15,'2021-01-30 02:07:16'),
(18,8,'Wafiq Koushtubh Persaud','3',NULL,14,'2021-01-30 02:07:19'),
(19,9,'Krishna Jha','1','Price is too high.',13,'2021-01-30 02:07:22'),
(20,10,'Nilam Sani','2','Never buy, fake product',12,'2021-01-30 02:07:26'),
(21,16,'Prerna Thakur','4','Buy right now. Much suggested.',5,'2021-01-30 02:07:29'),
(22,15,'Naina Saha','5',NULL,4,'2021-01-30 02:07:32'),
(23,14,'Roma Chitranjan Mall','4','Value for money.',3,'2021-01-30 02:07:39'),(24,12,'Malik Umar Morar','4','Never buy.',2,'2021-01-30 02:07:43'),
(25,12,'Padmini Bains','5','Only for kids.',1,'2021-01-30 02:07:46'),(26,2,'Naseer Bhai Pant','1','I did not like the product',11,'2021-01-30 02:08:17');



INSERT INTO product_views VALUES 
(1,1,6,'2021-01-26 18:40:14'),
(2,1,7,'2021-01-26 18:40:14'),
(3,1,8,'2021-01-26 18:40:14'),
(4,1,9,'2021-01-26 18:40:14'),
(5,2,6,'2021-01-26 18:40:14'),
(6,2,7,'2021-01-26 18:40:14'),
(7,2,8,'2021-01-26 18:40:14'),
(8,2,9,'2021-01-26 18:40:14'),
(9,3,6,'2021-01-26 18:40:14'),
(10,3,7,'2021-01-26 18:40:14'),
(11,3,8,'2021-01-26 18:40:14'),
(12,3,9,'2021-01-26 18:40:14'),
(13,4,6,'2021-01-26 18:40:14'),
(14,4,7,'2021-01-26 18:40:14'),
(15,4,8,'2021-01-26 18:40:14'),
(16,4,9,'2021-01-26 18:40:14'),
(17,5,6,'2021-01-26 18:40:14'),
(18,5,7,'2021-01-26 18:40:14'),
(19,5,8,'2021-01-26 18:40:14'),
(20,5,9,'2021-01-26 18:40:14'),
(21,6,6,'2021-01-26 18:40:14'),
(22,6,7,'2021-01-26 18:40:14'),
(23,6,8,'2021-01-26 18:40:14'),
(24,6,9,'2021-01-26 18:40:14'),
(25,7,6,'2021-01-26 18:40:14'),
(26,7,7,'2021-01-26 18:40:14'),
(27,7,8,'2021-01-26 18:40:14'),
(28,7,9,'2021-01-26 18:40:14'),
(29,8,6,'2021-01-26 18:40:14'),
(30,8,7,'2021-01-26 18:40:14'),
(31,8,8,'2021-01-26 18:40:14'),
(32,8,9,'2021-01-26 18:40:14'),
(33,9,6,'2021-01-26 18:40:14'),
(34,9,7,'2021-01-26 18:40:14'),
(35,9,8,'2021-01-26 18:40:14'),
(36,9,9,'2021-01-26 18:40:14'),
(37,10,6,'2021-01-26 18:40:14'),
(38,10,7,'2021-01-26 18:40:14'),
(39,10,8,'2021-01-26 18:40:14'),
(40,19,14,'2021-01-29 23:57:02'),
(41,19,14,'2021-01-29 23:57:02');



INSERT INTO orders VALUES 
(36,1,'in_cart','2021-01-26 23:28:04'),
(37,19,'in_cart','2021-01-26 23:28:07'),
(38,2,'in_cart','2021-01-26 23:28:08'),
(39,23,'placed','2021-01-26 23:28:12'),
(40,1,'placed','2021-01-26 23:28:14'),
(41,23,'placed','2021-01-26 23:28:16'),
(42,23,'placed','2021-01-26 23:28:17'),
(43,23,'placed','2021-01-26 23:28:17'),
(44,2,'placed','2021-01-26 23:28:18'),
(45,1,'placed','2021-01-26 23:28:19'),
(46,11,'placed','2021-01-26 23:28:20'),
(47,1,'placed','2021-01-26 23:28:22'),
(48,12,'placed','2021-01-26 23:28:24'),
(49,22,'in_cart','2021-01-27 14:27:39'),
(50,22,'in_cart','2021-01-27 14:28:59'),
(51,23,'in_cart','2021-01-27 14:31:32'),
(52,15,'placed','2021-01-27 19:59:50'),
(53,15,'placed','2021-01-27 19:59:52'),
(54,15,'placed','2021-01-27 19:59:53'),
(55,15,'placed','2021-01-27 19:59:55'),
(56,8,'placed','2021-01-29 01:54:08'),
(57,9,'placed','2021-01-29 01:54:10'),
(58,10,'placed','2021-01-29 01:54:11'),
(59,17,'placed','2021-01-29 01:54:13');

INSERT INTO order_product_details VALUES 
(1,1,38),(1,2,40),(1,15,56),(1,7,59),(2,1,37),(2,2,38),
(2,3,40),(2,5,51),(2,5,52),(2,13,53),(2,50,56),(3,2,37),
(3,9,40),(3,10,51),(3,10,52),(3,10,53),(3,18,54),(3,15,55),
(3,1,57),(3,8,58),(4,1,40),(4,1,51),(4,1,52),(4,11,53),(4,5,54),
(4,50,55),(4,5,57),(5,15,41),(6,6,49),(7,1,41),(8,6,45),
(8,2,50),(8,1,51),(8,1,58),(9,9,42),(9,3,46),(10,2,37),
(10,10,42),(10,2,43),(10,2,45),(10,3,50),(10,1,51),(10,8,59),
(11,3,44),(11,1,46),(12,5,44),(14,5,36),(14,6,38),(14,3,47),
(14,19,58),(14,9,59),(15,2,36),(15,9,41),(15,1,43),(15,2,48),
(15,2,51),(16,1,36),(16,7,41),(17,1,38),(17,1,49),(17,10,51),
(18,1,37),(18,13,38),(18,2,47),(18,10,51),(18,10,57),(19,3,36),
(19,8,37),(19,1,39),(19,2,41),(19,5,51),(20,8,41),(20,4,50);

/*Since, there are only few novels in the products table hence only few entries have been added in novel_details instead of 20*/
INSERT INTO novel_details VALUES 
(1,'Dan Brown','2011-12-09 11:29:31',3),
(2,'Tony Brooke','2008-10-29 10:19:35',8),
(3,'Dan Brown','2020-11-15 10:19:35',5),
(4,'Robert Shakespeare','2021-01-15 11:29:36',7),
(5,'People Mathews','2010-12-15 10:19:16',6);


INSERT INTO delivery_addresses VALUES 
(5,12,'#9 3rd Floor','Lakshmaiah Complex','12th Crs','Ganga Nagar,bellary Road','Bangalore','India',560024),
(6,11,'3 Goyal','Shppg Arcade,','L T Road, Gorai','Mumbai','Maharashtra','India',400091),
(7,8,'Shop 9','Silver Streak, Yari Road, Versova','Andheri (west)','Mumbai','Maharashtra','India',400091),
(8,8,'3 Basement','Saini Enclave','Kanishka Complex','Delhi','Delhi','India',1660),
(9,8,'18','Ajay Colony','Nr Delux Society, Nizampura','Vadodara','Gujarat','India',390002),
(10,19,'246',NULL,'J Shankar Seth Road, Girgaon, Nizampura','Mumbai','Maharashtra','India',400004),
(11,14,'154, 1 St Floor','Famous Cine Bldg','Dr E Moses Road, Mahalaxmi','Mumbai','Maharashtra','India',110017),
(12,2,'2 nd Floor, #50','Opposite Lay Socitey','PR Naka','Udaipur','Rajasthan','India',1150017),
(13,5,NULL,'Rajlaxmi Apartment','Gandhi Road','Amrisur','Punjab','India',55117),
(14,10,'A/49','Nirmal Park',NULL,'Mysur','Telangana','India',11757),
(15,4,'1800/F5','Srikar Socitey','SSC Titan','Kolkata','West Bengal','India',581117),
(16,15,'U - 25','Daksha Shah Studio','Tika Square','Neemuch','Madhya Pradesh','India',59942),
(17,15,NULL,NULL,'Passport Office','Bhopal','Madhya Pradesh','India',59942),
(18,15,NULL,'Alok Bhavan','Near Passport Office','Indore','Madhya Pradesh','India',59942),
(19,13,'Ax-49','Yaloor Bhawan','Matrix Road','Gwalior','Madhya Pradesh','India',594942),
(20,19,'OP/#4','Infinity Mall','Regal Square','Bhopal','Madhya Pradesh','India',59442),
(21,17,NULL,NULL,'Passport Office','Indore','Madhya Pradesh','India',559942),
(22,17,'C-4','Near ABC-DD Road','Yelper Bhawan','Fatehpur','UP','India',158461),
(23,15,'A1','Near PDO Road','President Office','Gurgaon','Haryana','India',515142),
(24,17,'X4','Near ABC Road','Parliament Office','Himmatnagar','Madhya Pradesh','India',559142);