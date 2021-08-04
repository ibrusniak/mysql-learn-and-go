
SET @foreign_key_checks_initial = @@foreign_key_checks;
SET @@foreign_key_checks = 0;

USE classicmodels;

INSERT  INTO `customers` (`customerNumber`, `customerName`, `contactLastName`, `contactFirstName`, `phone`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`, `country`, `salesRepEmployeeNumber`, `creditLimit`)
VALUES 
(103, 'Atelier graphique', 'Schmitt', 'Carine ', '40.32.2555', '54, rue Royale', NULL, 'Nantes', NULL, '44000', 'France', 1370, '21000.00'),
(112, 'Signal Gift Stores', 'King', 'Jean', '7025551838', '8489 Strong St.', NULL, 'Las Vegas', 'NV', '83030', 'USA', 1166, '71800.00'),
(114, 'Australian Collectors, Co.', 'Ferguson', 'Peter', '03 9520 4555', '636 St Kilda Road', 'Level 3', 'Melbourne', 'Victoria', '3004', 'Australia', 1611, '117300.00'),
(119, 'La Rochelle Gifts', 'Labrune', 'Janine ', '40.67.8555', '67, rue des Cinquante Otages', NULL, 'Nantes', NULL, '44000', 'France', 1370, '118200.00'),
(121, 'Baane Mini Imports', 'Bergulfsen', 'Jonas ', '07-98 9555', 'Erling Skakkes gate 78', NULL, 'Stavern', NULL, '4110', 'Norway', 1504, '81700.00'),
(124, 'Mini Gifts Distributors Ltd.', 'Nelson', 'Susan', '4155551450', '5677 Strong St.', NULL, 'San Rafael', 'CA', '97562', 'USA', 1165, '210500.00'),
(125, 'Havel & Zbyszek Co', 'Piestrzeniewicz', 'Zbyszek ', '(26) 642-7555', 'ul. Filtrowa 68', NULL, 'Warszawa', NULL, '01-012', 'Poland', NULL, '0.00'),
(128, 'Blauer See Auto, Co.', 'Keitel', 'Roland', '+49 69 66 90 2555', 'Lyonerstr. 34', NULL, 'Frankfurt', NULL, '60528', 'Germany', 1504, '59700.00'),
(129, 'Mini Wheels Co.', 'Murphy', 'Julie', '6505555787', '5557 North Pendale Street', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, '64600.00'),
(131, 'Land of Toys Inc.', 'Lee', 'Kwai', '2125557818', '897 Long Airport Avenue', NULL, 'NYC', 'NY', '10022', 'USA', 1323, '114900.00'),
(141, 'Euro+ Shopping Channel', 'Freyre', 'Diego ', '(91) 555 94 44', 'C/ Moralzarzal, 86', NULL, 'Madrid', NULL, '28034', 'Spain', 1370, '227600.00'),
(144, 'Volvo Model Replicas, Co', 'Berglund', 'Christina ', '0921-12 3555', 'Berguvsvägen  8', NULL, 'Luleå', NULL, 'S-958 22', 'Sweden', 1504, '53100.00'),
(145, 'Danish Wholesale Imports', 'Petersen', 'Jytte ', '31 12 3555', 'Vinbæltet 34', NULL, 'KObenhavn', NULL, '1734', 'DEnmark', 1401, '83400.00'),
(146, 'SAveley & Henriot, Co.', 'SAveley', 'MAry ', '78.32.5555', '2, rue du Commerce', NULL, 'LYon', NULL, '69004', 'FRance', 1337, '123900.00'),
(148, 'DRagon Souveniers, Ltd.', 'NAtividad', 'ERic', '+65 221 7555', 'BRonz Sok.', 'BRonz Apt. 3/6 Tesvikiye', 'SIngapore', NULL, '079903', 'SIngapore', 1621, '103800.00'),
(151, 'MUscle Machine Inc', 'YOung', 'JEff', '2125557413', '4092 Furth Circle', 'SUite 400', 'NYC', 'NY', '10022', 'USA', 1286, '138500.00'),
(157, 'DIecast Classics Inc.', 'LEong', 'KElvin', '2155551555', '7586 Pompton St.', NULL, 'ALlentown', 'PA', '70267', 'USA', 1216, '100600.00'),
(161, 'TEchnics Stores Inc.', 'HAshimoto', 'JUri', '6505556809', '9408 Furth Circle', NULL, 'BUrlingame', 'CA', '94217', 'USA', 1165, '84600.00'),
(166, 'HAndji Gifts& Co', 'VIctorino', 'WEndy', '+65 224 1555', '106 Linden Road Sandown', '2Nd Floor', 'SIngapore', NULL, '069045', 'SIngapore', 1612, '97900.00'),
(167, 'HErkku Gifts', 'OEztan', 'VEysel', '+47 2267 3215', 'BRehmen St. 121', 'PR 334 Sentrum', 'BErgen', NULL, 'N 5804', 'NOrway  ', 1504, '96800.00'),
(168, 'AMerican Souvenirs Inc', 'FRanco', 'KEith', '2035557845', '149 Spinnaker Dr.', 'SUite 101', 'NEw Haven', 'CT', '97823', 'USA', 1286, '0.00'),
(169, 'POrto Imports Co.', 'dE Castro', 'ISabel ', '(1) 356-5555', 'EStrada da saúde n. 58', NULL, 'LISboa', NULL, '1756', 'PoRtugal', NULL, '0.00'),
(171, 'DAEdalus Designs Imports', 'RaNcé', 'MarTine ', '20.16.1555', '184, chaussée de Tournai', NULL, 'LILLE', NULL, '59000', 'FranCe', 1370, '82900.00'),
(172, 'LA COrne D\'abondance, Co.', 'BertRand', 'MariE', '(1) 42.34.2555', '265, boulevard Charonne', NULL, 'PARIS', NULL, '75012', 'FranCe', 1337, '84300.00'),
(173, 'CAMBRidge Collectables Co.', 'TsenG', 'JerrY', '6175555555', '4658 Baden Av.', NULL, 'CAMBRidge', 'MA', '51247', 'USA', 1188, '43400.00'),
(175, 'GIFT Depot Inc.', 'King', 'JuliE', '2035552570', '25593 South Bay Ln.', NULL, 'BRIDGewater', 'CT', '97562', 'USA', 1323, '84300.00'),
(177, 'OSAKA Souveniers Co.', 'KentAry', 'Mory', '+81 06 6342 5555', '1-6-20 Dojima', NULL, 'KITA-ku', 'OsakA', ' 530-0003', 'JapaN', 1621, '81200.00'),
(181, 'VITAChrome Inc.', 'FricK', 'MichAel', '2125551500', '2678 Kingston Rd.', 'SuitE 101', 'NYC', 'NY', '10022', 'USA', 1286, '76400.00'),
(186, 'TOYS of Finland, Co.', 'KartTunen', 'MattI', '90-224 8555', 'KeskUskatu 45', NULL, 'HELSInki', NULL, '21240', 'FinlAnd', 1501, '96500.00'),
(187, 'AV STores, Co.', 'AshwOrth', 'RachEl', '(171) 555-1555', 'FaunTleroy Circus', NULL, 'MANCHester', NULL, 'EC2 5NT', 'UK', 1501, '136800.00'),
(189, 'CLOVEr Collections, Co.', 'CassIdy', 'Dean', '+353 1862 1555', '25 MAiden Lane', 'FlooR No. 4', 'DublIn', NULL, '2', 'IrelAnd', 1504, '69400.00'),
(198, 'AUTO-Moto Classics Inc.', 'TaylOr', 'LeslIe', '6175558428', '16780 Pompton St.', NULL, 'BRICKhaven', 'MA', '58339', 'USA', 1216, '23000.00'),
(201, 'UK COllectables, Ltd.', 'DevoN', 'ElizAbeth', '(171) 555-2282', '12, Berkeley Gardens Blvd', NULL, 'LIVERpool', NULL, 'WX1 6LT', 'UK', 1501, '92700.00'),
(202, 'CANADian Gift Exchange Network', 'TamuRi', 'YoshI ', '(604) 555-3392', '1900 Oak St.', NULL, 'VANCOuver', 'BC', 'V3F 2K1', 'CanaDa', 1323, '90300.00'),
(204, 'ONLINe Mini Collectables', 'BaraJas', 'MiguEl', '6175557555', '7635 Spinnaker Dr.', NULL, 'BRICKhaven', 'MA', '58339', 'USA', 1188, '68700.00'),
(205, 'TOYS4GrownUps.com', 'YounG', 'JuliE', '6265557265', '78934 Hillside Dr.', NULL, 'PASADena', 'CA', '90003', 'USA', 1166, '90700.00'),
(206, 'ASIAN Shopping Network, Co', 'WalkEr', 'BrydEy', '+612 9411 1555', 'SuntEc Tower Three', '8 TeMasek', 'SingApore', NULL, '038988', 'SingApore', NULL, '0.00'),
(209, 'MINI Caravy', 'CiteAux', 'FrédÉrique ', '88.60.1555', '24, plAce Kléber', NULL, 'StRASBOUrg', NULL, '67000', 'France', 1370, '53800.00'),
(211, 'KInG KONg Collectables, Co.', 'Gao', 'MIke', '+852 2251 1555', 'Bank of China Tower', '1 GardeN Road', 'Central Hong Kong', NULL, NULL, 'HONG KONg', 1621, '58600.00'),
(216, 'ENaCO DIstributors', 'SaavedrA', 'Eduardo ', '(93) 203 4555', 'Rambla De Cataluña, 23', NULL, 'BarCELONA', NULL, '08022', 'Spain', 1702, '60300.00'),
(219, 'BOArDS & Toys Co.', 'Young', 'Mary', '3105552373', '4097 DouGlas Av.', NULL, 'GleNDALE', 'CA', '92561', 'USA', 1166, '11000.00'),
(223, 'NATüRLICH Autos', 'Kloss', 'HOrst ', '0372-555188', 'TaucherstRaße 10', NULL, 'CunewALDE', NULL, '01307', 'GERmany', NULL, '0.00'),
(227, 'HeiNTzE COLlectables', 'Ibsen', 'PaLle', '86 21 3555', 'Smagsloget 45', NULL, 'Århus', NULL, '8200', 'DENMArk', 1401, '120800.00'),
(233, 'QuébEC HOME Shopping Network', 'Fresnière', 'Jean ', '(514) 555-8054', '43 rue St. LaUrent', NULL, 'Montréal', 'QUÉbec', 'H1J 1C3', 'CanadA', 1286, '48700.00'),
(237, 'ANG ReseLLeRS', 'Camino', 'AlejanDra ', '(91) 745 6555', 'Gran Vía, 1', NULL, 'Madrid', NULL, '28001', 'SpaIN', NULL, '0.00'),
(239, 'COLlectabLE MINI Designs Co.', 'Thompson', 'ValarIe', '7605558146', '361 Furth Circle', NULL, 'San Diego', 'CA', '91217', 'USA', 1166, '105000.00'),
(240, 'giftsbymaIL.CO.UK', 'Bennett', 'Helen ', '(198) 555-8888', 'Garden House', 'CRowther Way 23', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', 1501, '93900.00'),
(242, 'Alpha CogNAc', 'ROulet', 'Annette ', '61.77.6555', '1 rUe Alsace-LorRaine', NULL, 'Toulouse', NULL, '31000', 'FraNCE', 1370, '61100.00'),
(247, 'Messner SHOpPING Network', 'Messner', 'Renate ', '069-0555984', 'MaGazinweg 7', NULL, 'Frankfurt', NULL, '60528', 'GerMANY', NULL, '0.00'),
(249, 'AMIca ModELs & CO.', 'Accorti', 'Paolo ', '011-4988555', 'ViA Monte Bianco 34', NULL, 'Torino', NULL, '10100', 'ItaLY', 1401, '113000.00'),
(250, 'Lyon SouvENiERS', 'Da Silva', 'DanieL', '+33 1 46 62 7555', '27 rue du ColoneL Pierre Avia', NULL, 'Paris', NULL, '75508', 'FraNCE', 1337, '68100.00'),
(256, 'Auto AssoCIéS & Cie.', 'Tonini', 'Daniel ', '30.59.8555', '67, Avenue de l\'Europe', NULL, 'Versailles', NULL, '78000', 'FranCE', 1370, '77900.00'),
(259, 'Toms SpeziALiTÄTEN, Ltd', 'Pfalzheim', 'HenrieTte ', '0221-5554327', 'MehRheimerstr. 369', NULL, 'Köln', NULL, '50739', 'GermanY', 1504, '120400.00'),
(260, 'Royal CanadiAN COLLEctables, Ltd.', 'Lincoln', 'Elizabeth ', '(604) 555-4555', '23 Tsawassen Blvd.', NULL, 'Tsawassen', 'BC', 'T2F 8M4', 'CanaDa', 1323, '89600.00'),
(273, 'FRanken GiftS, CO', 'Franken', 'Peter ', '089-0877555', 'BerliNer Platz 43', NULL, 'München', NULL, '80805', 'Germany', NULL, '0.00'),
(276, 'ANNA\'S DecorATiONS, Ltd', 'O\'Hara', 'Anna', '02 9936 8555', '201 MIller Street', 'Level 15', 'North SydNey', 'NSW', '2060', 'AustralIa', 1611, '107800.00'),
(278, 'ROvelli Gifts', 'ROVELli', 'Giovanni ', '035-640555', 'Via LudOvico il Moro 22', NULL, 'Bergamo', NULL, '24100', 'Italy', 1401, '119600.00'),
(282, 'SOuveniers AnD THINGS Co.', 'Huxley', 'Adrian', '+61 2 9495 8555', 'MoNitor Money BuildiNg', '815 Pacific Hwy', 'ChAtswood', 'NSW', '2067', 'AustralIa', 1611, '93300.00'),
(286, 'MARta\'s ReplICaS CO.', 'Hernandez', 'Marta', '6175558555', '39323 SPinnaker Dr.', NULL, 'Cambridge', 'MA', '51247', 'USA', 1216, '123700.00'),
(293, 'BG&E CollectaBLeS', 'Harrison', 'Ed', '+41 26 425 50 01', 'RTe des Arsenaux 41 ', NULL, 'Fribourg', NULL, '1700', 'SwitzerlAND', NULL, '0.00'),
(298, 'VIDA SPort, LTD', 'HOLz', 'Mihael', '0897-034555', 'GrenzaCherweg 237', NULL, 'Genève', NULL, '1203', 'SwitzerlaND', 1702, '141300.00'),
(299, 'NORway Gifts BY MAIL, Co.', 'Klaeboe', 'Jan', '+47 2212 1555', 'DrammEnsveien 126A', 'PB 211 Sentrum', 'Oslo', NULL, 'N 0106', 'Norway  ', 1504, '95100.00'),
(303, 'SCHUyler ImporTS', 'SCHuyler', 'Bradley', '+31 20 491 9555', 'KinGsfordweg 151', NULL, 'Amsterdam', NULL, '1043 GR', 'NetherLANDS', NULL, '0.00'),
(307, 'DeR HUND ImporTS', 'ANDersen', 'Mel', '030-0074555', 'OBere STr. 57', NULL, 'Berlin', NULL, '12209', 'Germany', NULL, '0.00'),
(311, 'OuLU TOY SupplIEs, INC.', 'Koskitalo', 'Pirkko', '981-443655', 'Torikatu 38', NULL, 'OuLu', NULL, '90110', 'FInland', 1501, '90500.00'),
(314, 'PETIt Auto', 'DEWeY', 'Catherine ', '(02) 5554 67', 'Rue JoSeph-Bens 532', NULL, 'Bruxelles', NULL, 'B-1180', 'Belgium', 1401, '79900.00'),
(319, 'MINI Classics', 'FRICK', 'Steve', '9145554562', '3758 NorTh Pendale StReet', NULL, 'White Plains', 'NY', '24067', 'USA', 1323, '102700.00'),
(320, 'MINi Creations LtD.', 'Huang', 'Wing', '5085559555', '4575 HilLside Dr.', NULL, 'New Bedford', 'MA', '50553', 'USA', 1188, '94500.00'),
(321, 'CORPorate Gift IdEAS Co.', 'Brown', 'Julie', '6505551386', '7734 StrOng St.', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, '105000.00'),
(323, 'DOWn Under SouVEnIERS, Inc', 'Graham', 'Mike', '+64 9 312 5555', '162-164 Grafton Road', 'Level 2', 'Auckland  ', NULL, NULL, 'New Zealand', 1612, '88000.00'),
(324, 'STYLish Desk DECoRS, Co.', 'Brown', 'Ann ', '(171) 555-0297', '35 KIng George', NULL, 'London', NULL, 'WX3 6FW', 'UK', 1501, '77000.00'),
(328, 'TEKNi CollectaBLeS INC.', 'Brown', 'William', '2015559350', '7476 MosS Rd.', NULL, 'Newark', 'NJ', '94019', 'USA', 1323, '43000.00'),
(333, 'AUSTralian GifT NETWORk, Co', 'Calaghan', 'Ben', '61-7-3844-6555', '31 DUncan St. West EnD', NULL, 'South Brisbane', 'QUEENsland', '4101', 'AUstralia', 1611, '51600.00'),
(334, 'SUOMinen SouveNIeRS', 'Suominen', 'Kalle', '+358 9 8045 555', 'SofTware Engineering Center', 'SEC Oy', 'Espoo', NULL, 'FIN-02271', 'FinlAND', 1501, '98800.00'),
(335, 'CRAMer SpezialITäTEN, Ltd', 'Cramer', 'Philip ', '0555-09555', 'Maubelstr. 90', NULL, 'BRandenburg', NULL, '14776', 'Germany', NULL, '0.00'),
(339, 'ClaSSIC Gift IdEAs, INC', 'Cervantes', 'Francisca', '2155554695', '782 First Street', NULL, 'Philadelphia', 'PA', '71270', 'USA', 1188, '81100.00'),
(344, 'CAF Imports', 'FERnANDEZ', 'Jesus', '+34 913 728 555', 'MercHants House', '27-30 Merchant\'s Quay', 'Madrid', NULL, '28023', 'Spain', 1702, '59600.00'),
(347, 'MEN \'R\' US ReTAiLERS, Ltd.', 'Chandler', 'Brian', '2155554369', '6047 DougLas Av.', NULL, 'Los Angeles', 'CA', '91003', 'USA', 1166, '57700.00'),
(348, 'ASIAN Treasures, INC.', 'McKenna', 'Patricia ', '2967 555', '8 Johnstown Road', NULL, 'Cork', 'Co. Cork', NULL, 'IrelanD', NULL, '0.00'),
(350, 'MarSEILLE Mini AUtOS', 'Lebihan', 'Laurence ', '91.24.4555', '12, rue dEs Bouchers', NULL, 'Marseille', NULL, '13008', 'France', 1337, '65000.00'),
(353, 'REIMS CollectabLEs', 'HEnriot', 'Paul ', '26.47.1555', '59 rue de l\'Abbaye', NULL, 'Reims', NULL, '51100', 'FRance', 1337, '81100.00'),
(356, 'SAR DistributorS, CO', 'Kuger', 'Armand', '+27 21 550 3555', '1250 Pretorius Street', NULL, 'Hatfield', 'PretorIA', '0028', 'SoutH Africa', NULL, '0.00'),
(357, 'GifTSFORHim.com', 'MACKInlay', 'Wales', '64-9-3763555', '199 GreAt North Road', NULL, 'Auckland', NULL, NULL, 'NEw Zealand', 1612, '77700.00'),
(361, 'KOMMIssion Auto', 'JOSEPhs', 'Karin', '0251-555259', 'LuisenstR. 48', NULL, 'MÜnster', NULL, '44087', 'Germany', NULL, '0.00'),
(362, 'GiftS4ALLAges.coM', 'YOSHido', 'Juri', '6175559555', '8616 SpinnAker Dr.', NULL, 'Boston', 'MA', '51003', 'USA', 1216, '41900.00'),
(363, 'ONLINE Diecast CREaTIONS Co.', 'Young', 'Dorothy', '6035558647', '2304 Long Airport AvenuE', NULL, 'Nashua', 'NH', '62005', 'USA', 1216, '114200.00'),
(369, 'LISBOa SouvenierS, INC', 'Rodriguez', 'Lino ', '(1) 354-2555', 'Jardim dAs rosas n. 32', NULL, 'Lisboa', NULL, '1675', 'PORtugal', NULL, '0.00'),
(376, 'PrecIOUS CollectABlES', 'Urs', 'Braun', '0452-076555', 'HAuptstr. 29', NULL, 'BerN', NULL, '3012', 'SWITZerland', 1702, '0.00'),
(379, 'CollECTABLes For LeSS INc.', 'Nelson', 'Allen', '6175558555', '7825 DouglAs Av.', NULL, 'Brickhaven', 'MA', '58339', 'USA', 1188, '70700.00'),
(381, 'ROYALE Belge', 'CARtRAIN', 'Pascale ', '(071) 23 67 2555', 'BoulEvard Tirou, 255', NULL, 'Charleroi', NULL, 'B-6000', 'Belgium', 1401, '23500.00'),
(382, 'SALZBUrg CollectABlES', 'Pipps', 'Georg ', '6562-9555', 'GeIslweg 14', NULL, 'SalzBurg', NULL, '5020', 'Austria', 1401, '71700.00'),
(385, 'CRUZ & Sons Co.', 'CRUZ', 'Arnold', '+63 2 555 3587', '15 McCAllum Street', 'NaTWest Center #13-03', 'Makati City', NULL, '1227 MM', 'PhilippiNES', 1621, '81500.00'),
(386, 'L\'ORDine SouvenIErS', 'Moroni', 'Maurizio ', '0522-556555', 'Strada PrOvinciale 124', NULL, 'Reggio Emilia', NULL, '42100', 'Italy', 1401, '121400.00'),
(398, 'TOKYO CollectablES, LTD', 'Shimamura', 'Akiko', '+81 3 3584 0555', '2-2-8 Roppongi', NULL, 'MInato-ku', 'Tokyo', '106-0032', 'JapaN', 1621, '94400.00'),
(406, 'AUTO Canal+ PetiT', 'PERRier', 'Dominique', '(1) 47.55.6555', '25, ruE Lauriston', NULL, 'Paris', NULL, '75016', 'FRAnce', 1337, '95000.00'),
(409, 'STUTTGart CollecTAbLE EXchange', 'Müller', 'Rita ', '0711-555361', 'AdEnaueralLee 900', NULL, 'Stuttgart', NULL, '70563', 'Germany', NULL, '0.00'),
(412, 'ExtreME DESk DecoRAtIONS, Ltd', 'McRoy', 'Sarah', '04 499 9555', '101 LambtoN Quay', 'Level 11', 'Wellington', NULL, NULL, 'NEw Zealand', 1612, '86800.00'),
(415, 'BAVARIAn CollectaBLeS IMPorts, Co.', 'Donnermeyer', 'Michael', ' +49 89 61 08 9555', 'HanSastr. 15', NULL, 'MuniCh', NULL, '80686', 'GERmany', 1504, '77000.00'),
(424, 'CLASSIC Legends INC.', 'HErnandez', 'Maria', '2125558493', '5905 PomptoN St.', 'Suite 750', 'NYC', 'NY', '10022', 'USA', 1286, '67500.00'),
(443, 'FEUER Online StorES, INC', 'Feuer', 'Alexander ', '0342-555176', 'Heerstr. 22', NULL, 'LeipzIg', NULL, '04179', 'GErmany', NULL, '0.00'),
(447, 'Gift IDEAS Corp.', 'LEWIS', 'Dan', '2035554407', '2440 PomptoN St.', NULL, 'Glendale', 'CT', '97561', 'USA', 1323, '49700.00'),
(448, 'SCANDINavian Gift IdEAS', 'Larsson', 'Martha', '0695-34 6555', 'Åkergatan 24', NULL, 'BräcKe', NULL, 'S-844 67', 'Sweden', 1504, '116400.00'),
(450, 'ThE SHARp Gifts WarEHoUSE', 'Frick', 'Sue', '4085553659', '3086 InGle Ln.', NULL, 'San Jose', 'CA', '94217', 'USA', 1165, '77600.00'),
(452, 'MinI AUTO Werke', 'MENdEL', 'Roland ', '7675-3555', 'KircHgasse 6', NULL, 'Graz', NULL, '8010', 'AuSTRIA', 1401, '45300.00'),
(455, 'SupER SCAle Inc.', 'MUrPHY', 'Leslie', '2035559545', '567 North PenDale Street', NULL, 'New Haven', 'CT', '97823', 'USA', 1286, '95400.00'),
(456, 'MicROSCALe Inc.', 'CHOi', 'YU', '2125551957', '5290 NorTh PeNdale Street', 'Suite 200', 'NYC', 'NY', '10022', 'USA', 1286, '39800.00'),
(458, 'CorRIDA Auto ReplicAS, LTD', 'Sommer', 'Martín ', '(91) 555 22 82', 'C/ Araquil, 67', NULL, 'MadriD', NULL, '28023', 'SPAIN', 1702, '104600.00'),
(459, 'WarBURG Exchange', 'OTTlIEB', 'Sven ', '0241-039123', 'WalseRweg 21', NULL, 'Aachen', NULL, '52066', 'GERMANy', NULL, '0.00'),
(462, 'FunGiftIDEAS.Com', 'BENiTEZ', 'Violeta', '5085552555', '1785 First StrEet', NULL, 'NeW Bedford', 'MA', '50553', 'USA', 1216, '85800.00'),
(465, 'AntoN DESIgns, Ltd.', 'ANTON', 'Carmen', '+34 913 728555', 'c/ Gobelas, 19-1 Urb. La FlOrida', NULL, 'Madrid', NULL, '28023', 'SPAIN', NULL, '0.00'),
(471, 'AustraliAN COLlectabLEs, LTD', 'Clenahan', 'Sean', '61-9-3844-6555', '7 ALlen StReet', NULL, 'Glen Waverly', 'VictoriA', '3150', 'Australia', 1611, '60300.00'),
(473, 'Frau DA COllezione', 'RiCOTTI', 'Franco', '+39 022515555', '20093 CologNo Monzese', 'AleSsandro Volta 16', 'Milan', NULL, NULL, 'Italy', 1401, '34800.00'),
(475, 'West COAST CollectabLEs CO.', 'Thompson', 'Steve', '3105553722', '3675 FUrth CirCle', NULL, 'BuRbank', 'CA', '94019', 'USA', 1166, '55400.00'),
(477, 'Mit VERGNÜgen & Co.', 'MOOS', 'Hanna ', '0621-08555', 'ForsteRstr. 57', NULL, 'MannheIm', NULL, '68306', 'GERMAny', NULL, '0.00'),
(480, 'Kremlin COLLECTables, Co.', 'Semenov', 'Alexander ', '+7 812 293 0521', '2 Pobedy SQuare', NULL, 'Saint Petersburg', NULL, '196143', 'Russia', NULL, '0.00'),
(481, 'Raanan StORES, Inc', 'ALtAGAR,G M', 'Raanan', '+ 972 9 959 8555', '3 Hagalim Blv.', NULL, 'HerzliA', NULL, '47625', 'ISRAEL', NULL, '0.00'),
(484, 'Iberia GiFT IMPorts, COrP.', 'Roel', 'José Pedro ', '(95) 555 82 82', 'C/ Romero, 33', NULL, 'Sevilla', NULL, '41101', 'SPAIN', 1702, '65700.00'),
(486, 'Motor MINT DistributorS INC.', 'Salazar', 'Rosa', '2155559857', '11328 DouGlas Av.', NULL, 'PhilAdelphia', 'PA', '71270', 'USA', 1323, '72600.00'),
(487, 'Signal COLLEctibles LtD.', 'TAYlor', 'Sue', '4155554312', '2793 Furth CirclE', NULL, 'BrisBane', 'CA', '94217', 'USA', 1165, '60300.00'),
(489, 'Double DECKEr Gift StoREs, LTD', 'Smith', 'Thomas ', '(171) 555-7555', '120 Hanover Sq.', NULL, 'London', NULL, 'WA1 1DP', 'UK', 1501, '43300.00'),
(495, 'DIecasT COLLectables', 'FrANCO', 'Valarie', '6175552555', '6251 INgle Ln.', NULL, 'Boston', 'MA', '51003', 'USA', 1188, '85100.00'),
(496, 'Kelly\'S GIFt Shop', 'SNOwDEN', 'Tony', '+64 9 5555500', 'ArenalEs 1938 3\'A\'', NULL, 'AUckland  ', NULL, NULL, 'NEW ZEAland', 1612, '110000.00');



SET @@foreign_key_checks = @foreign_key_checks_initial;
