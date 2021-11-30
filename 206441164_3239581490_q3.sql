Select F1.favTripsType,F1.tID,F2.num as 'lastReturn'
FROM
(SELECT *
FROM
(select A.tID, name, favTripsType, num
from Traveler A INNER JOIN (select  A.tID, COUNT(A.tID) as num
from TravelerInTrip A
group by A.tID) B on A.tID = B.tID) as AB

EXCEPT

SELECT AB.tID,AB.name,AB.favTripsType,AB.num
FROM
(select A.tID, name, favTripsType, num
from Traveler A INNER JOIN (select  A.tID, COUNT(A.tID) as num
from TravelerInTrip A
group by A.tID) B on A.tID = B.tID) as AB,

(select A.tID, name, favTripsType, num
from Traveler A INNER JOIN (select  A.tID, COUNT(A.tID) as num
from TravelerInTrip A
group by A.tID) B on A.tID = B.tID) as AC
WHERE AC.favTripsType = AB.favTripsType AND AB.num < AC.num) as F1

INNER JOIN

(SELECT T.tID,MAX(T.endDate) as 'num'
FROM TravelerInTrip as T
group by T.tID) as F2 on F1.tID = F2.tID