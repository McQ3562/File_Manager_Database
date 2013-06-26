DECLARE @InputDate DATETIME = '6-18-2012'

CREATE TABLE #MonthWeek (
	WeekNumber INT,
	WeekStart DATE,
	WeekEND DATE
)

DECLARE @FristOfMonth DATE
SET @FristOfMonth = DATEADD(Month, DATEDIFF(Month, -1, @InputDate) -1, -1) +1
SELECT @FristOfMonth AS FirstOfMonth

DECLARE @FirstWeekOfMonthStart datetime
DECLARE @FirstWeekOfMonthEnd datetime
SET @FirstWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, @FristOfMonth) - 1), @FristOfMonth)
SET @FirstWeekOfMonthEnd = DATEADD(dd,-(DATEPART(dw, @FristOfMonth) - 7), @FristOfMonth)
INSERT INTO #MonthWeek (WeekNumber, WeekStart, WeekEND)
VALUES (1, @FirstWeekOfMonthStart, @FirstWeekOfMonthEnd)

DECLARE @SecondWeekOfMonthStart datetime
DECLARE @SecondWeekOfMonthEnd datetime
SET @SecondWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FirstWeekOfMonthEnd)) - 1),DATEADD(dd, 1, @FirstWeekOfMonthEnd))
SET @SecondWeekOfMonthEnd =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FirstWeekOfMonthEnd)) - 7),DATEADD(dd, 1, @FirstWeekOfMonthEnd))
INSERT INTO #MonthWeek (WeekNumber, WeekStart, WeekEND)
VALUES (2, @SecondWeekOfMonthStart, @SecondWeekOfMonthEnd)

DECLARE @ThirdWeekOfMonthStart datetime
DECLARE @ThirdWeekOfMonthEnd datetime
SET @ThirdWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @SecondWeekOfMonthEnd)) - 1),DATEADD(dd, 1, @SecondWeekOfMonthEnd))
SET @ThirdWeekOfMonthEnd =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @SecondWeekOfMonthEnd)) - 7),DATEADD(dd, 1, @SecondWeekOfMonthEnd))

DECLARE @FourthWeekOfMonthStart datetime
DECLARE @FourthWeekOfMonthEnd datetime
SET @FourthWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @ThirdWeekOfMonthEnd)) - 1),DATEADD(dd, 1, @ThirdWeekOfMonthEnd))
SET @FourthWeekOfMonthEnd =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @ThirdWeekOfMonthEnd)) - 7),DATEADD(dd, 1, @ThirdWeekOfMonthEnd))

DECLARE @FithWeekOfMonthStart datetime
DECLARE @FithWeekOfMonthEnd datetime
SET @FithWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FourthWeekOfMonthEnd)) - 1),DATEADD(dd, 1, @FourthWeekOfMonthEnd))
SET @FithWeekOfMonthEnd =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FourthWeekOfMonthEnd)) - 7),DATEADD(dd, 1, @FourthWeekOfMonthEnd))

DECLARE @SixthWeekOfMonthStart datetime
DECLARE @SixthWeekOfMonthEnd datetime
SET @SixthWeekOfMonthStart =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FithWeekOfMonthEnd)) - 1),DATEADD(dd, 1, @FithWeekOfMonthEnd))
SET @SixthWeekOfMonthEnd =  DATEADD(dd,-(DATEPART(dw, DATEADD(dd, 1, @FithWeekOfMonthEnd)) - 7),DATEADD(dd, 1, @FithWeekOfMonthEnd))

SELECT @FirstWeekOfMonthStart, @FirstWeekOfMonthEnd
SELECT @SecondWeekOfMonthStart, @SecondWeekOfMonthEnd
SELECT @ThirdWeekOfMonthStart, @ThirdWeekOfMonthEnd
SELECT @FourthWeekOfMonthStart, @FourthWeekOfMonthEnd
SELECT @FithWeekOfMonthStart, @FithWeekOfMonthEnd
SELECT @SixthWeekOfMonthStart, @SixthWeekOfMonthEnd

SELECT *
FROM #MonthWeek

DROP TABLE #MonthWeek

--Getting First Day of the week
--DECLARE @Date datetime
--SET @Date = '2001/08/31'
--SELECT DATEADD(dd,-(DATEPART(dw, @Date) - 1),@Date) AS 'First day of the week'
--GO
--Getting Last Day of the week
--DECLARE @Date datetime 
--SET @Date = '2001/08/31'
--SELECT DATEADD(dd,-(DATEPART(dw, @Date) - 7),@Date) AS 'Last day of the week'
--GO
-- Return First and Last Date of a Month
--DECLARE @Month smallint
--SET @Month = 1
--
--SELECT 
--DATEADD(Month, DATEDIFF(Month, -1, getdate()) - 2, -1) + 1 as FirstDayofMonth,
--DATEADD(Month, DATEDIFF(Month,0,getdate())+@Month, -1) as LastDayOfMonth