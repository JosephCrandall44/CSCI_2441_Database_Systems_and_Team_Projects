/* querydb.sql */

/* 5 modification commands */
/* Insert function */
INSERT INTO Building VALUES (10008, 'Science & Engineering Hall', '800 22nd St NW Washington, DC','Academic');
INSERT INTO Event VALUES (4000006, 'Commencement Speech', 10008, NULL, NULL);
INSERT INTO StudentOrg VALUES (30000009,'Young Database Administrators',10008);
/* Delete function */
DELETE FROM Event WHERE eventid = '4000006';
/* Update Function*/
UPDATE StudentOrg SET name='Young Sys Admins' WHERE studentorgid='30000009';

/*The queries you specify in querydb.sql must satisfy the following requirements: • Your script should contain at least ten retrieval commands and five modification commands (at least one INSERT, one DELETE, one UPDATE). All queries must have explanations that make sense in your application setup (chosen in Part 1).
• At least 6 queries must involve 2 or more tables. One query should involve at least 3 tables. (#1,#2,#5,#11,#12,#13)
• At least 4 queries must have a nested subquery.
(#1,#2,#11,#13)
• At least 3 queries must be an aggregate query including GROUP BY and ORDER BY.
(#3,#6,#7)
• At least 2 queries must create views that make sense in your application setup.
(#4, #5)
• At least 2 queries must be a UNION query.
(#2, #14)
• At least 2 queries must have keyword DISTINCT.
(#8, #9, #10 )*/

/*10 retrieval commands */

/* 1. Select all Yaks about Gelman Library */

(SELECT message,score,lat,lon,attitude FROM About NATURAL JOIN Post NATURAL JOIN Yaks WHERE buildingid=10005);


/* 2. Select all Yaks and FBStatuses about Gelman */
SELECT * FROM Yaks WHERE (SELECT postid FROM About WHERE buildingid = '10001')
UNION
SELECT * FROM FBstatus WHERE (SELECT postid FROM About WHERE buildingid = '10001');

/* 3. Get Yaks ordered by scores descending*/
SELECT message, score, lat, lon FROM Yaks ORDER BY score desc;

/*  4.  View all events happening in Gelman*/
CREATE VIEW events_in_gelman AS
SELECT eventid,name,buildingid,studentorgid,officeid
FROM Event
WHERE buildingid-10005;

/* 5.   View all negative yaks or facebook posts*/
CREATE VIEW negative_yaks_FB_posts
SELECT message AS m, m.Yaks , m.FBstatus
FROM Yaks , FBstatus
WHERE attitude.Yaks AND attitude.FBstatus = 'negative';

/* 6.  Get Yaks ordered by ascending*/
SELECT message, score, lat, lon FROM Yaks ORDER BY score;

/*7. Get FB Statuses ordered by descending likes*/
SELECT message, likes FROM FBstatus ORDER BY likes desc;

/*8. Get number of different people posting Facebook statuses*/
SELECT COUNT(DISTINCT userid) FROM FBstatus;

/*9. Get number of different people posting Yaks*/
SELECT COUNT(DISTINCT userid) FROM Yaks;

/*10. Get number of different people posting Tweets*/
SELECT COUNT(DISTINCT userid) FROM Tweets;

/*#11 Display all building names in which the name of
the building is the same in both building and office tables
and it is one of the first four buildings entered into the database*/
SELECT b.name
FROM Building AS b
WHERE ( SELECT officeid
		FROM SchoolOffice
		WHERE  officeid < 5
		AND Building.name = SchoolOffice.Building );

/* 12. Select the facebook messages of the users who have more than 10 likes on their message as well as 10 retweets on all their tweets as well as 10 likes on all their yacks*/
SELECT f.message
FROM FBstatus AS f, Tweets AS t, Yaks As y
WHERE f.likes > 10 AND t.retweets > 10 AND y.score > 10 And f.userid = t.userid AND f.userid = y.userid ( SELECT agency_ID

/*13 selects the name of the studnet orgnaization and the dorm that they are having a party in*/

SELECT s.name, b.name
From StudentOrg AS S, Event As E
WHERE( Select name
		From Building AS b
		WHERE useCLass = "dorm"

) AND e.name = "party"

/*14  Most liked posts : Select Yaks, FB statuses or Tweets with more than 5 hits*/
SELECT message
FROM Yaks
WHERE score > 5
UNION
SELECT message
FROM FBstatus
WHERE likes > 5
UNION
SELECT message
FROM Tweets
WHERE retweets > 5 AND favorites >5;


