CREATE TABLE Final_Project_News_Sources (
	indexID INT NOT NULL,
	RespondentID BIGINT NOT NULL,
	New_York_Times VARCHAR NOT NULL,
	Wall_Street_Journal VARCHAR NOT NULL,
	USA_Today VARCHAR NOT NULL,
	Washington_Post VARCHAR NOT NULL,
	Fox_News VARCHAR NOT NULL,
	Breitbart VARCHAR NOT NULL,
	CNN VARCHAR NOT NULL,
	BuzzFeed VARCHAR NOT NULL,
	Huffington_Post VARCHAR NOT NULL,
	Time VARCHAR NOT NULL,
	US_News_and_World_Report VARCHAR NOT NULL,
	Other VARCHAR NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	PRIMARY KEY (RespondentID),
	UNIQUE (indexID, RespondentID)
);
CREATE TABLE Final_Project_01 (
	indexID INT NOT NULL,
	RespondentID BIGINT NOT NULL,
	Political_Views VARCHAR NOT NULL,
	Trust_In_Press VARCHAR NOT NULL,
	Online_Paid_Access VARCHAR NOT NULL,
	Impression_With_Access_To_Data VARCHAR NOT NULL,
	Trump_As_President VARCHAR NOT NULL,
	Age VARCHAR NOT NULL,
	Gender VARCHAR NOT NULL,
	Income VARCHAR NOT NULL,
	US_Region VARCHAR NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	PRIMARY KEY (RespondentID),
	UNIQUE (indexID, RespondentID)
);

SELECT * FROM final_project_01

SELECT * FROM final_project_news_sources

DROP TABLE final_project_01

DROP TABLE final_project_news_sources

-- Create new table for New York Times naming it NYT - Didn't end up using this table

SELECT final_project_01.respondentid, final_project_01.gender, final_project_news_sources.new_york_times
INTO NYT
FROM final_project_01
LEFT JOIN final_project_news_sources ON final_project_01.respondentid = final_project_news_sources.respondentid
WHERE final_project_news_sources.New_York_Times = '1';

-- Check the table
SELECT * FROM NYT;

-- Create new table with all data naming it final_project_full
SELECT 
	final_project_01.respondentid, 
	final_project_01.Political_Views, 
	final_project_01.Trust_In_Press, 
	final_project_01.Online_Paid_Access, 
	final_project_01.Impression_With_Access_To_Data,
	final_project_01.Trump_As_President,
	final_project_01.Age,
	final_project_01.gender,
	final_project_01.Income,
	final_project_01.US_Region,
	final_project_01.StartDate,
	final_project_01.EndDate,
	final_project_news_sources.new_york_times,
	final_project_news_sources.Wall_Street_Journal,
	final_project_news_sources.USA_Today,
	final_project_news_sources.Washington_Post,
	final_project_news_sources.Fox_News,
	final_project_news_sources.Breitbart,
	final_project_news_sources.CNN,
	final_project_news_sources.BuzzFeed,
	final_project_news_sources.Huffington_Post,
	final_project_news_sources.Time,
	final_project_news_sources.US_News_and_World_Report,
	final_project_news_sources.Other
INTO final_project_full
FROM final_project_01
FULL OUTER JOIN final_project_news_sources 
ON final_project_01.respondentid = final_project_news_sources.respondentid;

-- Check the table
SELECT * FROM final_project_full;

CREATE TABLE Final_Project_Regions (
	States VARCHAR NOT NULL,
	Abbrev VARCHAR NOT NULL,
	US_Region VARCHAR NOT NULL,
	PRIMARY KEY (US_Region),
	UNIQUE (States, Abbrev)
);

select * from final_project_regions

-- Updated ERD with Regions 

Final_Project_01
-
index int
RespondentID int pk fk - Final_Project_News_Sources.RespondentID
Political_Views varchar
Trust_In_Press varchar
Online_Paid_Access varchar
Impression_With_Access_To_Data varchar
Trump_As_President varchar
Age varchar
Gender varchar
Income varchar
US_Region varchar fk
StartDate date
EndDate date

Final_Project_News_Sources
-
index int 
RespondentID int pk
New_York_Times varchar
Wall_Street_Journal varchar
USA_Today varchar
Washington_Post varchar
Fox_News varchar
Breitbart varchar
CNN varchar
BuzzFeed varchar
Huffington_Post varchar
Time varchar
US_News_and_World_Report varchar
Other varchar
StartDate date
EndDate date

Final_Project_Regions
-
State varchar pk
Abbrev varchar
US_Region varchar fk fk - final_project_01.US_Region