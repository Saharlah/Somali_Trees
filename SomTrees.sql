CREATE SCHEMA Somali_Trees_db;

CREATE TABLE Tree_Climate_Zones(
	Botanical_Name varchar(255) NOT NULL,
    Climate_Zone varchar(255),
    CONSTRAINT PK_TCZ PRIMARY KEY (Botanical_Name,Climate_Zone)
);

CREATE TABLE Rainfall_Requirements(
	Botanical_Name varchar(255),
    Min_Rainfall_mmperyr int,
    Irrigated varchar(255),
    PRIMARY KEY (Botanical_Name)
);

CREATE TABLE Tree_Uses(
	Botanical_Name varchar(255),
    Uses varchar(255),
    Usefulness varchar(255),
    CONSTRAINT PK_TU PRIMARY KEY (Botanical_Name,Uses)
);

CREATE TABLE Climate_Zone_Key(
	Zone_Code varchar(255),
    Climate_Description varchar(255),
    Rainfall_mmperyr varchar(255),
    Altitude_m varchar(255),
    Temp_C varchar(255),
    PRIMARY KEY (Zone_Code)
);

CREATE TABLE Alternate_Somali_Names(
	Somali_Name varchar(255) NOT NULL,
    Alternate_Spelling varchar(255),
    Part_of_Plant varchar(255),
    Tree_Type varchar(255),
    CONSTRAINT PK_TU PRIMARY KEY (Somali_Name,Alternate_Spelling)
);

CREATE TABLE Botanical_Tree_Names(
	Botanical_Name varchar(255),
    Tree_Type varchar(255),
    Somali_Name varchar(255),
    Arabic_Name varchar(255),
    Alternate_Arabic_Name varchar(255),
    English_Name varchar(255),
    Alternate_English_Name varchar(255),
    PRIMARY KEY (Botanical_Name)
);

ALTER TABLE Tree_Climate_Zones 
ADD FOREIGN KEY (Climate_Zone) 
REFERENCES Climate_Zone_Key(Zone_Code);

ALTER TABLE Tree_Uses
ADD FOREIGN KEY (Botanical_Name)
REFERENCES Botanical_Tree_Names(Botanical_Name);

ALTER TABLE Rainfall_Requirements
ADD FOREIGN KEY (Botanical_Name)
REFERENCES Botanical_Tree_Names(Botanical_Name);

ALTER TABLE Tree_Climate_Zones
ADD FOREIGN KEY (Botanical_Name)
REFERENCES Botanical_Tree_Names(Botanical_Name);

ALTER TABLE Botanical_Tree_Names
ADD UNIQUE (Somali_Name);

ALTER TABLE Alternate_Somali_Names
ADD FOREIGN KEY (Somali_Name)
REFERENCES Botanical_Tree_Names(Somali_Name);

