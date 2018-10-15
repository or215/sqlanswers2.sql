# sqlanswers2.sql

--/SUM and COUNT--

#--Problema 1--
#--Show the total population of the world.--

SELECT SUM(population)
FROM world


#--Problema 2--
#--List all the continents - just once each.--

SELECT DISTINCT(continent)
FROM world


#--Problema 3--
#--Give the total GDP of Africa--

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'


#--Problema 4--
#--How many countries have an area of at least 1000000--

SELECT COUNT(name)
FROM world
WHERE area >= 1000000

#--Problema 5--
#--What is the total population of ('Estonia', 'Latvia', 'Lithuania')--

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

#--Problema 6--
#--For each continent show the continent and number of countries.--

SELECT continent, COUNT(name)
FROM world
GROUP BY continent

#--Problema 7--
#--For each continent show the continent and number of countries with populations of at least 10 million.--

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

#--Problema 8--
#--List the continents that have a total population of at least 100 million.--

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000

#--SELECT from Nobel Tutorial--

#--Problema 1--
#--Change the query shown so that it displays Nobel prizes for 1950.--

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
#--Problema 2--
#--Show who won the 1962 prize for Literature.--

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

#--Problema 3--
#--Show the year and subject that won 'Albert Einstein' his prize.--

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

#--Problema 4--
#--Give the name of the 'Peace' winners since the year 2000, including 2000.--

SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000

#--Problema 5--
#--Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.--

SELECT yr, subject, winner
FROM nobel
WHERE (yr >=1980 AND yr <=1989) AND subject = 'Literature'

#--Problema 6--
#--Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama--

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

#--Problema 7--
#--Show the winners with first name John--

SELECT winner
FROM nobel
WHERE winner LIKE 'john%'

#--Problema 8--
#--Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.--

SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = '1980') OR (subject = 'Chemistry' AND yr = 1984)

#--Problema 9--
#--Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine--

SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

#--Problema 10--
#--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)--

SELECT *
FROM nobel
WHERE (subject  = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

#--Problema 11--
#--Find all details of the prize won by PETER GRÜNBERG--

SELECT *
FROM nobel
WHERE winner LIKE 'peter gr%nberg'

#--Problema 12--
#--Find all details of the prize won by EUGENE O'NEILL--

SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill'

#--Problema 13--
#--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.--

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'sir%'
ORDER BY yr DESC, winner

#--Problema 14--
#--The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.--

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'),subject,winner
