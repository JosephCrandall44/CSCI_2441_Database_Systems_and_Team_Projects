/* INSERT */ /* WORKING */
insert into Agents values(625409003, 'Jeb Stuart', '454009');
insert into Cities values('Baltimore, MD', 622104, 71122.00);
insert into Visitors values('520000', '102001', 300100102);

/* DELETE */ /* WORKING */
DELETE FROM Universities
WHERE uni_ID = '510207';

/* UPDATE */ /* WORKING */
UPDATE Properties
SET agent_SSN = 625409003
WHERE property_ID = '101001';

/* 1. Display all names of home owners. */ /* WORKING */
/* Retrieval, DISTINCT */
SELECT DISTINCT owner_name, SSN
FROM Owners;

/* 2. Display all properties, with full information, ordered by contractors. */ /* WORKING */
/* Retrieval, 2 tables, GROUP BY */
SELECT Specifications.*, Properties.*
FROM Specifications INNER JOIN Properties
ON Specifications.property_ID = Properties.property_ID
ORDER BY (contractor_ID);

/* 3. Display all buyers, ordered by their budget. */ /* WORKING */
/* Retrieval, ORDER BY */
SELECT buyer_name, budget
FROM Buyers
ORDER BY (budget);

/* 4. Display the names of everyone logged in the database. */ /* WORKING */
/* Retrieval, 3 tables, nested subquery, ORDER BY, UNION */
SELECT buyer_name as tname FROM Buyers
	UNION
SELECT owner_name as tname FROM Owners
	 UNION
 SELECT agent_name as tname FROM Agents
ORDER BY (tname);

/* 5. Display all universities, grouped by city. */ /* WORKING */
/* Retrieval, GROUP BY */
SELECT uni_name, city
FROM Universities
GROUP BY (city);

/* 6. Display all homes which have been visited. */ /* WORKING */
/* Retrieval, DISTINCT */
SELECT DISTINCT property_ID
FROM Visitors;

/* 7. Display all agencies and contractors, ordered by rating. */ /* WORKING */
/* Retrieval, 2 tables, ORDER BY, UNION */
SELECT rating, agency_name as company FROM Agencies
	UNION
SELECT rating, contractor_name as company FROM Contractors
ORDER BY (rating);

/* 8. Display all properties held by Alfred Iverson. */ /* WORKING */
/* Retrieval, 2 tables, nested subquery */
SELECT property_ID
FROM Properties
WHERE ( SELECT SSN
		FROM Agents
		WHERE agent_name = 'Alfred Iverson'
		AND Agents.SSN = Properties.agent_SSN );

/* 9. Display all agents working for "Zillow". */ /* WORKING */
/* Retrieval, 2 tables, nested subquery */
SELECT agent_name
FROM Agents
WHERE ( SELECT agency_ID
		FROM Agencies
		WHERE agency_name = 'Zillow'
		AND Agencies.agency_ID = Agents.agency_ID );

/* 10. Display all properties within Scott Mescudi's budget. */ /* WORKING */
/* Retrieval, 2 tables, nested subquery, ORDER BY */
SELECT property_ID, price
FROM Specifications
WHERE ( SELECT budget
		FROM Buyers
		WHERE buyer_name = 'Scott Mescudi'
		AND Specifications.price <= Buyers.budget )
ORDER BY (price);