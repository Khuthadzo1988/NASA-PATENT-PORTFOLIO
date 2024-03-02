--A count of Nasa Patents

SELECT count (center) as Total_Number_of_Patents
FROM [master].[dbo].[NASA_Patents]

-----------------------------------------------------------------------------------------------------------------------------
--Number of patents emanating from varoius divisions of Nasa

SELECT distinct(Center), Count(Center) as Number_Of_Patents
FROM [master].[dbo].[NASA_Patents]
Group by Center

-----------------------------------------------------------------------------------------------------------------------------
-- Status of the Nasa Patents

SELECT distinct([Status]), Count(Status) as Status_Count
FROM [master].[dbo].[NASA_Patents]
Group by [Status]

-----------------------------------------------------------------------------------------------------------------------------
--Patent Expiration

SELECT Count(patent_expiration_date) as Count_Patents_Expiration_Date, (patent_expiration_date)
FROM [master].[dbo].[NASA_Patents]
Group by patent_expiration_date

-----------------------------------------------------------------------------------------------------------------------------
--word count of 'Title' to determine the areas/Tech in which NASA is filing patents
--The count will look at words with more than 3 letters

 WITH WordCounts AS (
    SELECT
        TRIM(value) AS word
    FROM
        [master].[dbo].[NASA_Patents]
    CROSS APPLY
        STRING_SPLIT(Title, ' ')
    WHERE LEN(TRIM(value)) > 3
 )

 SELECT TOP 100
    word AS TopWord,
    COUNT(*) AS WordCount
 FROM
    WordCounts
 GROUP BY
    word
 ORDER BY
    COUNT(*) DESC;

-----------------------------------------------------------------------------------------------------------------------------
