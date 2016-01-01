
create table Tweets (
	tweetid varchar(25) primary key,
	message VARCHAR(255),
	userid VARCHAR(30),
	favorites int(11),
	retweets int(11),
	datePosted date,
	attitude VARCHAR(20),
	lat float,
	lon float,
	CHECK (message<>'NULL'),
	CONSTRAINT attitude FOREIGN KEY (attitude) REFERENCES Sentiment(attitude)
);

create table Yaks (
	yakid varchar(25) primary key,
	message VARCHAR(255),
	userid VARCHAR(30),
	score int(11),
	attitude VARCHAR(20),
	lat float,
	lon float,
	CHECK (message<>'NULL'),
	CONSTRAINT attitude FOREIGN KEY (attitude) REFERENCES Sentiment(attitude)
);

create table FBstatus (
	statusid varchar(25) primary key,
	message VARCHAR(255),
	userid VARCHAR(30),
	attitude VARCHAR(20),
	date date,
	likes int(11),
	shared_by int(11),
	CONSTRAINT attitude FOREIGN KEY (attitude) REFERENCES Sentiment(attitude)
);

create table Building (
	buildingid varchar(5) primary key,
	name varchar(30),
	address varchar(60),
	useClass varchar(25)
);

create table SchoolOffice ( 
	officeid varchar(25) primary key,
	name varchar(30),
	building varchar(5),
	floor int(2)
);

create table StudentOrg (
	studentorgid varchar(25) primary key,
	name varchar(30),
	building varchar(5)
);

create table Event (
	eventid varchar(25) PRIMARY KEY,
	name varchar(45),
	buildingid varchar(5),
	studentorgid varchar(25),
	officeid varchar(25),
	CONSTRAINT buildingid FOREIGN KEY (buildingid) REFERENCES Building(buildingid),
	CONSTRAINT studentorgid FOREIGN KEY (studentorgid) REFERENCES StudentOrg(studentorgid),
	CONSTRAINT officeid FOREIGN KEY (officeid) REFERENCES SchoolOffice(officeid)
);

create table Sentiment (
	attitude varchar(20) primary key,
	polarity int(3)
);

create table Post (
	postid varchar(25) primary key,
	yakid varchar(25),
	statusid varchar(25),
	tweetid varchar(25),
	CONSTRAINT yakid FOREIGN KEY (yakid) REFERENCES Yaks(yakid),
	CONSTRAINT statusid FOREIGN KEY (statusid) REFERENCES FBstatus(statusid),
	CONSTRAINT tweetid FOREIGN KEY (tweetid) REFERENCES Tweets(tweetid)
);

create table About (
	traitid varchar(25) primary key,
	postid varchar(25),
	buildingid varchar(5),
	officeid varchar(25),
	studentorgid varchar(25),
	eventid varchar(25),
	CONSTRAINT postid FOREIGN KEY (postid) REFERENCES Post(postid),
	CONSTRAINT buildingid FOREIGN KEY (buildingid) REFERENCES Building(buildingid),
	CONSTRAINT officeid FOREIGN KEY (officeid) REFERENCES SchoolOffice(officeid),
	CONSTRAINT studentorgid FOREIGN KEY (studentorgid) REFERENCES StudentOrg(studentorgid),
	CONSTRAINT eventid FOREIGN KEY (eventid) REFERENCES event(eventid),
)


