-- Database Creation and Setup
CREATE DATABASE [Tableau Project 1];
USE [Tableau Project 1];

-- Data Cleaning and Standardization
ALTER TABLE [Depression+Student+Dataset]
ADD Age_Group varchar(max),
    Index_Column int IDENTITY(1,1);

ALTER TABLE [Depression+Student+Dataset]
ALTER COLUMN Depression VARCHAR(MAX);

-- Gender Standardization
UPDATE [Depression+Student+Dataset]
SET Gender = CASE 
    WHEN Gender = 'Female' THEN 'F'
    WHEN Gender = 'male' THEN 'M'
    ELSE Gender END;

-- Age Group Classification
UPDATE [Depression+Student+Dataset]
SET Age_Group = CASE 
    WHEN Age BETWEEN 18 AND 24 THEN 'A1'
    WHEN Age BETWEEN 25 AND 30 THEN 'A2'
    ELSE 'A3' END;

-- Depression Status Update
UPDATE [Depression+Student+Dataset]
SET Depression = CASE 
    WHEN Depression = '0' THEN 'No'
    WHEN Depression = '1' THEN 'Yes'
    ELSE Depression END;

-- Analysis Queries
SELECT Gender, COUNT(*) as GenderCount 
FROM [Depression+Student+Dataset]
GROUP BY Gender;

SELECT Age_Group, COUNT(*) as AgeGroupCount 
FROM [Depression+Student+Dataset]
GROUP BY Age_Group;

SELECT Sleep_Duration, COUNT(*) as SleepCount 
FROM [Depression+Student+Dataset]
GROUP BY Sleep_Duration;

SELECT Have_you_ever_had_suicidal_thoughts, COUNT(*) as ThoughtCount 
FROM [Depression+Student+Dataset]
GROUP BY Have_you_ever_had_suicidal_thoughts;

SELECT Depression, COUNT(*) as DepressionCount 
FROM [Depression+Student+Dataset]
GROUP BY Depression;
