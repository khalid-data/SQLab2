SELECT F1.tripName,F1.startDate,F1.endDate,f2.pNum
FROM
(SELECT V.tripName ,V.startDate,V.endDate
FROM TravelerInTrip as V
WHERE startDate LIKE '2020-%' AND endDate LIKE '2020-%'
GROUP BY V.tripName,V.startDate,V.endDate
except

-- Trips that have a non returning traveler
SELECT T.tripName,T.startDate,T.endDate
FROM TravelerInTrip as T
WHERE startDate LIKE '2020-%' AND endDate LIKE '2020-%'
AND
      T.tID NOT IN
-- Returning travelers
(SELECT DISTINCT A.tID
FROM TravelerInTrip A, TravelerInTrip B
WHERE (A.tripName = B.tripName AND A.tID = B.tID AND A.startDate != B.startDate AND A.startDate < B.startDate)
AND datediff(month ,A.endDate,b.startDate) <= 3)

GROUP BY T.tripName,T.startDate,T.endDate) AS F1

INNER JOIN

(SELECT A.tripName,A.startDate,A.endDate,COUNT(A.tID) as 'pNum'
FROM TravelerInTrip AS A
GROUP BY A.tripName,A.startDate,A.endDate) AS F2 ON
        (F1.tripName = F2.tripName AND
        F1.startDate = F2.startDate AND
        F1.endDate = F2.endDate)
ORDER BY pNum DESC,F1.tripName ,F1.startDate