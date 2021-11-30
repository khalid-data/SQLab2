SELECT Traveler.tID,Traveler.name,friendsNum
FROM
(SELECT tID1,COUNT(tID2) AS 'friendsNum'
FROM Friends
GROUP BY tID1) as t1
INNER JOIN Traveler on t1.tID1=Traveler.tID
WHERE friendsNum >= 5
ORDER BY friendsNum DESC,Traveler.tID DESC
