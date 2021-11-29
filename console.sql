CREATE TABLE OrganizedTrip(
    otName VARCHAR(50) PRIMARY KEY ,
    otDesc VARCHAR(50),
    otDays INT CHECK (otDays > 3),
    otMaxRegist INT,
    otGuide INT, FOREIGN KEY (otGuide) REFERENCES  Guide(gId)
)

CREATE TABLE Trips(
    tNAME VARCHAR(50),
    tRATE FLOAT CHECK (tRATE>=1 AND tRATE <=5),
    tCOAST INT,
    tCOUNTRY VARCHAR(50), FOREIGN KEY (tCOUNTRY) REFERENCES Countries(CNAME),
    UNIQUE (tNAME, tCOUNTRY)
)

CREATE TABLE Countries(
    cName VARCHAR(50) PRIMARY KEY ,
    cCapital VARCHAR(50) unique ,
    cLang VARCHAR(50),
)

CREATE TABLE Guide(
    gId INT PRIMARY KEY,
    gName VARCHAR(50),
    gBirthday VARCHAR(50) CHECK (gBirthday LIKE '1___-__-__'),
    gMail VARCHAR(50) CHECK (gMail LIKE '%@%'),
    gExperience VARCHAR(50) CHECK (gExperience = 'beginner' OR gExperience = 'experienced'),
    gFavouriteCountry VARCHAR(50) ,
        FOREIGN KEY (gFavouriteCountry) REFERENCES Countries(cName)
)

-- we cant fuckin make the last relation
