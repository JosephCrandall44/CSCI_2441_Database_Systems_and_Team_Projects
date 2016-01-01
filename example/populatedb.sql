/* Populating "Properties" & "Specifications" tables... */ /* DONE */
insert into Properties values('101001', 201505101, 625409002, '921006');
insert into Specifications values('101001', 'Phoenix, AZ', 750000.00, 95000);
insert into Properties values('101002', 201505102, 625402002, '921006');
insert into Specifications values('101002', 'Phoenix, AZ', 10000000.00, 15000);

insert into Properties values('102001', 202505102, 625404002, '921005');
insert into Specifications values('102001', 'Los Angeles, CA', 10000000.00, 31000);
insert into Properties values('102002', 202505112, 625406001, '921001');
insert into Specifications values('102002', 'Los Angeles, CA', 1500000.00, 8750);

insert into Properties values('103001', 203505101, 625404001, '921001');
insert into Specifications values('103001', 'San Francisco, CA', 3000000.00, 13000);
insert into Properties values('103002', 203505102, 625405002, '921001');
insert into Specifications values('103002', 'San Francisco, CA', 75000000.00, 25000);

insert into Properties values('104001', 204505101, 625407001, '921004');
insert into Specifications values('104001', 'Denver, CO', 750000.00, 16000);
insert into Properties values('104002', 204505102, 625407002, '921004');
insert into Specifications values('104002', 'Denver, CO', 18000000.00, 30000);

insert into Properties values('105001', 205505101, 625401001, '921005');
insert into Specifications values('105001', 'Washington, DC', 50000000.00, 29500);
insert into Properties values('105002', 205505102, 625402001, '921003');
insert into Specifications values('105002', 'Washington, DC', 3500000.00, 9000);

insert into Properties values('106001', 206505101, 625408002, '921004');
insert into Specifications values('106001', 'Miami, FL', 75000000.00, 35000);
insert into Properties values('106002', 206505111, 625405001, '921003');
insert into Specifications values('106002', 'Miami, FL', 1000000.00, 12000);
insert into Properties values('106003', 206505102, 625408002, '921003');
insert into Specifications values('106003', 'Miami, FL', 6500000.00, 21000);
insert into Properties values('106004', 206505112, null, '921002');
insert into Specifications values('106004', 'Miami, FL', 2000000.00, 15000);

insert into Properties values('107001', 207505101, 625402004, '921004');
insert into Specifications values('107001', 'Chicago, IL', 750000.00, 8000);
insert into Properties values('107002', 207505102, 625403001, '921004');
insert into Specifications values('107002', 'Chicago, IL', 800000.00, 8000);
insert into Properties values('107003', 207505112, 625403002, '921006');
insert into Specifications values('107003', 'Chicago, IL', 900000.00, 8100);

insert into Properties values('108001', 208505101, 625408002, '921002');
insert into Specifications values('108001', 'New Orleans, LA', 1000000.00, 11500);
insert into Properties values('108002', 208505102, null, '921002');
insert into Specifications values('108002', 'New Orleans, LA', 750000.00, 9500);

insert into Properties values('109001', 209505101, 625401003, '921002');
insert into Specifications values('109001', 'Boston, MA', 2500000.00, 7000);
insert into Properties values('109002', 209505102, 625408003, '921005');
insert into Specifications values('109002', 'Boston, MA', 1750000.00, 20000);

insert into Properties values('110001', 210505101, 625408001, '921002');
insert into Specifications values('110001', 'New York City, NY', 2000000.00, 8000);
insert into Properties values('110002', 210505111, 625401003, '921002');
insert into Specifications values('110002', 'New York City, NY', 15000000.00, 17500);
insert into Properties values('110003', 210505102, 625402003, '921005');
insert into Specifications values('110003', 'New York City, NY', 750000.00, 11000);
insert into Properties values('110004', 210505112, 625402003, '921002');
insert into Specifications values('110004', 'New York City, NY', 1250000.00, 12500);

insert into Properties values('111001', 211505101, 625403003, '921004');
insert into Specifications values('111001', 'Cleveland, OH', 975000.00, 18000);
insert into Properties values('111002', 211505102, 625402004, '921006');
insert into Specifications values('111002', 'Cleveland, OH', 800000.00, 15500);

insert into Properties values('112001', 212505101, 625409002, '921003');
insert into Specifications values('112001', 'Houston, TX', 950000.00, 14000);
insert into Properties values('112002', 212505102, 625409002, '921003');
insert into Specifications values('112002', 'Houston, TX', 1050000.00, 14500);

insert into Properties values('113001', 213505101, 625408004, '921001');
insert into Specifications values('113001', 'Seattle, WA', 1000000.00, 12000);

/* Populating "Owners" table... */ /* DONE */
insert into Owners values(201505101, 'Ryan Lindley', 'Phoenix, AZ' );
insert into Owners values(201505102, 'Eric Beldsoe', 'Phoenix, AZ' );

insert into Owners values(202505102, 'Chris Paul', 'Los Angeles, CA' );
insert into Owners values(202505112, 'Kobe Bryant', 'Los Angeles, CA' );

insert into Owners values(203505101, 'Colin Kaepernick', 'San Francisco, CA' );
insert into Owners values(203505102, 'Stephen Curry', 'San Francisco, CA' );

insert into Owners values(204505101, 'Peyton Manning', 'Denver, CO' );
insert into Owners values(204505102, 'Nate Robinson', 'Denver, CO' );

insert into Owners values(205505101, 'Robert Griffin', 'Washington, DC' );
insert into Owners values(205505102, 'Gilbert Arenas', 'Washington, DC' );

insert into Owners values(206505101, 'Matt Moore', 'Miami, FL' );
insert into Owners values(206505111, 'Ryan Tannerhill', 'Miami, FL' );
insert into Owners values(206505102, 'Dwayne Wade', 'Miami, FL' );
insert into Owners values(206505112, 'LeBron James', 'Miami, FL' );

insert into Owners values(207505101, 'Jordan Palmer', 'Chicago, IL' );
insert into Owners values(207505102, 'Derrick Rose', 'Chicago, IL' );
insert into Owners values(207505112, 'Mike Dunleavy', 'Chicago, IL' );

insert into Owners values(208505101, 'Drew Brees', 'New Orleans, LA' );
insert into Owners values(208505102, 'Anthony Davis', 'New Orleans, LA' );

insert into Owners values(209505101, 'Tom Brady', 'Boston, MA' );
insert into Owners values(209505102, 'Rajon Rondo', 'Boston, MA' );

insert into Owners values(210505101, 'Eli Manning', 'New York City, NY' );
insert into Owners values(210505111, 'Michael Vick', 'New York City, NY' );
insert into Owners values(210505102, 'Paul Pierce', 'New York City, NY' );
insert into Owners values(210505112, 'Carmelo Anthony', 'New York City, NY' );

insert into Owners values(211505101, 'Alex Tanney', 'Cleveland, OH' );
insert into Owners values(211505102, 'Dion Waiters', 'Cleveland, OH' );

insert into Owners values(212505101, 'T. J. Yates', 'Houston, TX' );
insert into Owners values(212505102, 'James Harden', 'Houston, TX' );

insert into Owners values(213505101, 'Russel Wilson', 'Seattle, WA' );

/* Populating "Buyers" table... */ /* DONE */
insert into Buyers values(300100101, 'Shawn Carter', 'New York City, NY', 125000000);
insert into Buyers values(300100102, 'Curtis Jackson', 'New York City, NY', 65000000);
insert into Buyers values(300100103, 'Dwayne Carter', 'New Orleans, LA', 33750000);
insert into Buyers values(300100104, 'Jayceon Taylor', 'Los Angeles, CA', 5000000);
insert into Buyers values(300100105, 'Scott Mescudi', 'Cleveland, OH', 875000);

/* Populating "Agents" table... */ /* DONE */
insert into Agents values(625401001, 'Alpheus Baker', '454001');
insert into Agents values(625401002, 'William Davis', '454001');
insert into Agents values(625401003, 'Samuel Garland', '454001');

insert into Agents values(625402001, 'Joseph Anderson', '454002');
insert into Agents values(625402002, 'Mathew Ector', '454002');
insert into Agents values(625402003, 'Alfred Iverson', '454002');
insert into Agents values(625402004, 'Edward Olin', '454002');

insert into Agents values(625403001, 'Roger Hanson', '454003');
insert into Agents values(625403002, 'Thomas Jackson', '454003');
insert into Agents values(625403003, 'William Quarles', '454003');

insert into Agents values(625404001, 'William Mackall', '454004');
insert into Agents values(625404002, 'Allison Nelson', '454004');

insert into Agents values(625405001, 'Elise Capers', '454005');
insert into Agents values(625405002, 'Charles Field', '454005');

insert into Agents values(625406001, 'Felix Zollicoffer', '454006');

insert into Agents values(625407001, 'Thomas Scott', '454007');
insert into Agents values(625407002, 'Richard Taylor', '454007');

insert into Agents values(625408001, 'Alexander Hawthorn', '454008');
insert into Agents values(625408002, 'Micah Jenkins', '454008');
insert into Agents values(625408003, 'Joseph Kershaw', '454008');
insert into Agents values(625408004, 'Walter Lane', '454008');

insert into Agents values(625409001, 'Robert Vance', '454009');
insert into Agents values(625409002, 'Pierce Young', '454009');

/* Populating "Agencies" table... */ /* DONE */
insert into Agencies values('454001', 'RE/MAX International', 10);
insert into Agencies values('454002', 'Century 21 Real Estate', 10);
insert into Agencies values('454003', 'Coldwell Banker Real Estate LLC', 9);
insert into Agencies values('454004', 'ERA Real Estate', 8);
insert into Agencies values('454005', 'Pangea Properties', 9);
insert into Agencies values('454006', 'Marketplace Homes', 7);
insert into Agencies values('454007', 'Camden Property Trust', 7);
insert into Agencies values('454008', 'Keller Williams Realty', 9);
insert into Agencies values('454009', 'Zillow', 8);

/* Populating "Contractors" table... */ /* DONE */
insert into Contractors values('921001', 'KB Home', 10);
insert into Contractors values('921002', 'Toll Brothers', 9);
insert into Contractors values('921003', 'Comstock Homes', 7);
insert into Contractors values('921004', 'CarrHomes', 8);
insert into Contractors values('921005', 'Platinum Homes', 9);
insert into Contractors values('921006', 'Red House Building Inc.', 8);

/* Populating "Visitors" table... */ /* DONE */
insert into Visitors values('100000', '112002', 300100103);
insert into Visitors values('200000', '103002', 300100101);
insert into Visitors values('300000', '110002', 300100101);
insert into Visitors values('400000', '109001', 300100101);
insert into Visitors values('500000', '110004', 300100103);
insert into Visitors values('600000', '110002', 300100103);
insert into Visitors values('700000', '104001', 300100105);
insert into Visitors values('800000', '110003', 300100105);
insert into Visitors values('900000', '108001', 300100101);
insert into Visitors values('110000', '106001', 300100101);
insert into Visitors values('210000', '109002', 300100103);
insert into Visitors values('310000', '101001', 300100105);
insert into Visitors values('410000', '106002', 300100104);
insert into Visitors values('510000', '103002', 300100102);
insert into Visitors values('610000', '105002', 300100104);
insert into Visitors values('710000', '104002', 300100103);
insert into Visitors values('810000', '105001', 300100101);
insert into Visitors values('910000', '105001', 300100102);
insert into Visitors values('120000', '102001', 300100103);
insert into Visitors values('220000', '108002', 300100105);
insert into Visitors values('320000', '107001', 300100105);
insert into Visitors values('420000', '111002', 300100105);

/* Populating "Cities" table... */ /* DONE */
insert into Cities values('Phoenix, AZ', 1445632, 43960.00);
insert into Cities values('Los Angeles, CA', 3857799, 50028.00);
insert into Cities values('San Francisco, CA', 837442, 72947.00);
insert into Cities values('Denver, CO', 634265, 59230.00);
insert into Cities values('Washington, DC', 646449, 86680.00);
insert into Cities values('Miami, FL', 419777, 43605.00);
insert into Cities values('Chicago, IL', 2714856, 43628.00);
insert into Cities values('New Orleans, LA', 378715, 36468.00);
insert into Cities values('Boston, MA', 636479, 71738.00);
insert into Cities values('New York City, NY', 8405837, 50711.00);
insert into Cities values('Cleveland, OH', 396815, 25371.00);
insert into Cities values('Houston, TX', 2160821, 42877.00);
insert into Cities values('Seattle, WA', 634535, 52048.00);

/* Populating "Universities" table... */ /* DONE */
insert into Universities values('100201', 'Arizona State University', 'Phoenix, AZ');
insert into Universities values('200201', 'Grand Canyon University', 'Phoenix, AZ');
insert into Universities values('300201', 'Arizona Christian University', 'Phoenix, AZ');
insert into Universities values('400201', 'University of Phoenix', 'Phoenix, AZ');

insert into Universities values('100202', 'California State University, Los Angeles', 'Los Angeles, CA');
insert into Universities values('200202', 'California State University, Northridge', 'Los Angeles, CA');
insert into Universities values('300202', 'University of California, Los Angeles', 'Los Angeles, CA');
insert into Universities values('400202', 'Biola University', 'Los Angeles, CA');
insert into Universities values('500202', 'Marymount College', 'Los Angeles, CA');
insert into Universities values('600202', 'Occidental College', 'Los Angeles, CA');
insert into Universities values('700202', 'University of Southern California', 'Los Angeles, CA');

insert into Universities values('100203', 'San Francisco State University', 'San Francisco, CA');
insert into Universities values('200203', 'Academy of Art University', 'San Francisco, CA');
insert into Universities values('300203', 'Golden State University', 'San Francisco, CA');
insert into Universities values('400203', 'University of San Francisco', 'San Francisco, CA');

insert into Universities values('100204', 'Metropolitan State University of Denver', 'Denver, CO');
insert into Universities values('200204', 'University of Colorado Denver', 'Denver, CO');
insert into Universities values('300204', 'Colorado Heights University', 'Denver, CO');
insert into Universities values('400204', 'Regis University', 'Denver, CO');
insert into Universities values('500204', 'University of Denver', 'Denver, CO');
insert into Universities values('600204', 'Heritage College', 'Denver, CO');
insert into Universities values('700204', 'National American University', 'Denver, CO');
insert into Universities values('800204', 'Rocky Mountain College of Art and Design', 'Denver, CO');

insert into Universities values('100205', 'American University', 'Washington, DC');
insert into Universities values('200205', 'Catholic University of America', 'Washington, DC');
insert into Universities values('300205', 'George Washington University', 'Washington, DC');
insert into Universities values('400205', 'Georgetown University', 'Washington, DC');
insert into Universities values('500205', 'Howard University', 'Washington, DC');
insert into Universities values('600205', 'Trinity Washington University', 'Washington, DC');
insert into Universities values('700205', 'University of the District of Columbia', 'Washington, DC');
insert into Universities values('800205', 'Johns Hopkins University', 'Washington, DC');

insert into Universities values('100206', 'Barry University', 'Miami, FL');
insert into Universities values('200206', 'Florida International University', 'Miami, FL');
insert into Universities values('300206', 'Florida Memorial University', 'Miami, FL');
insert into Universities values('400206', 'Miami Dade College', 'Miami, FL');
insert into Universities values('500206', 'St. Thomas University', 'Miami, FL');
insert into Universities values('600206', 'University of Miami', 'Miami, FL');

insert into Universities values('100207', 'University of Chicago', 'Chicago, IL');
insert into Universities values('200207', 'Northwestern University', 'Chicago, IL');
insert into Universities values('300207', 'Loyola University Chicago', 'Chicago, IL');
insert into Universities values('400207', 'Illinois Institute of Technology', 'Chicago, IL');
insert into Universities values('500207', 'DePaul University', 'Chicago, IL');
insert into Universities values('600207', 'University of Illinois at Chicago', 'Chicago, IL');
insert into Universities values('700207', 'Chicago State University', 'Chicago, IL');
insert into Universities values('800207', 'North Park University', 'Chicago, IL');
insert into Universities values('900207', 'Northeastern Illinois University', 'Chicago, IL');
insert into Universities values('110207', 'Robert Morris University', 'Chicago, IL');
insert into Universities values('210207', 'Roosevelt University', 'Chicago, IL');
insert into Universities values('310207', 'Saint Xavier University', 'Chicago, IL');
insert into Universities values('410207', 'Rush University', 'Chicago, IL');
insert into Universities values('510207', 'Shimer College', 'Chicago, IL');

insert into Universities values('100208', 'Tulane University', 'New Orleans, LA');
insert into Universities values('200208', 'Loyola University New Orleans', 'New Orleans, LA');
insert into Universities values('300208', 'University of New Orleans', 'New Orleans, LA');
insert into Universities values('400208', 'Xavier University of Louisiana', 'New Orleans, LA');
insert into Universities values('500208', 'Dillard University', 'New Orleans, LA');

insert into Universities values('100209', 'Boston University', 'Boston, MA');
insert into Universities values('200209', 'Northeastern University', 'Boston, MA');
insert into Universities values('300209', 'Suffolk University', 'Boston, MA');
insert into Universities values('400209', 'Boston College', 'Boston, MA');
insert into Universities values('500209', 'University of Massachusetts Boston', 'Boston, MA');

insert into Universities values('100210', 'Barnard College', 'New York City, NY');
insert into Universities values('200210', 'Columbia University', 'New York City, NY');
insert into Universities values('300210', 'Cooper Union', 'New York City, NY');
insert into Universities values('400210', 'Fordham University', 'New York City, NY');
insert into Universities values('500210', 'New York University', 'New York City, NY');
insert into Universities values('600210', 'Pace University', 'New York City, NY');
insert into Universities values('700210', 'Yeshiva University', 'New York City, NY');
insert into Universities values('800210', 'The Juilliard School', 'New York City, NY');
insert into Universities values('900210', 'Manhattan College', 'New York City, NY');
insert into Universities values('110210', 'Wagner College', 'New York City, NY');

insert into Universities values('100211', 'Case Western Reserve University', 'Cleveland, OH');
insert into Universities values('200211', 'Cleveland State University', 'Cleveland, OH');

insert into Universities values('100212', 'University of Houston', 'Houston, TX');
insert into Universities values('200212', 'Texas Southern University', 'Houston, TX');
insert into Universities values('300212', 'The University of St. Thomas', 'Houston, TX');
insert into Universities values('400212', 'Rice University', 'Houston, TX');

insert into Universities values('100213', 'University of Washington', 'Seattle, WA');
insert into Universities values('200213', 'Seattle University', 'Seattle, WA');
insert into Universities values('300213', 'Seattle Pacific University', 'Seattle, WA');
