CREATE TABLE FarmerMarketDump (
    FMID            BIGINT  PRIMARY KEY,
    MarketName      VARCHAR,
    Website         VARCHAR,
    Facebook,
    Twitter,
    Youtube,
    OtherMedia,
    street,
    city,
    County,
    State,
    zip,
    Season1Date,
    Season1FromDate,
    Season1ToDate,
    Season1Time,
    [Season1Time 1],
    [Season1Time 2],
    [Season1Time 3],
    [Season1Time 4],
    [Season1Time 5],
    [Season1Time 6],
    [Season1Time 7],
    [Season1Time 8],
    Season2Date,
    Season2FromDate,
    Season2ToDate,
    Season2Time,
    [Season2Time 1],
    [Season2Time 2],
    [Season2Time 3],
    [Season2Time 4],
    [Season2Time 5],
    [Season2Time 6],
    [Season2Time 7],
    [Season2Time 8],
    Season3FromDate,
    Season3ToDate,
    Season3Time,
    [Season3Time 1],
    [Season3Time 2],
    [Season3Time 3],
    [Season3Time 4],
    [Season3Time 5],
    [Season3Time 6],
    [Season3Time 7],
    Season4Date,
    Season4FromDate,
    Season4ToDate,
    Season4Time,
    [Season4Time 1],
    [Season4Time 2],
    [Season4Time 3],
    x,
    y,
    Location,
    Credit,
    WIC,
    WICcash,
    SFMNP,
    SNAP,
    Organic,
    Bakedgoods,
    Cheese,
    Crafts,
    Flowers,
    Eggs,
    Seafood,
    Herbs,
    Vegetables,
    Honey,
    Jams,
    Maple,
    Meat,
    Nursery,
    Nuts,
    Plants,
    Poultry,
    Prepared,
    Soap,
    Trees,
    Wine,
    Coffee,
    Beans,
    Fruits,
    Grains,
    Juices,
    Mushrooms,
    PetFood,
    Tofu,
    WildHarvested,
    updateTime
);





INSERT INTO FarmerMarkets (
                              FMID,
                              MarketName,
                              Website,
                              Facebook,
                              Twitter,
                              Youtube,
                              OtherMedia,
                              street,
                              city,
                              County,
                              State,
                              zip,
                              x,
                              y,
                              Location,
                              Credit,
                              WIC,
                              WICcash,
                              SFMNP,
                              SNAP,
                              updateTime
                          )
                         select FMID,
                              MarketName,
                              Website,
                              Facebook,
                              Twitter,
                              Youtube,
                              OtherMedia,
                              street,
                              city,
                              County,
                              State,
                              zip,
                              x,
                              y,
                              Location,
                              Credit,
                              WIC,
                              WICcash,
                              SFMNP,
                              SNAP,
                              updateTime from FarmerMarketDump
							  
							  
CREATE TABLE Seasons (
    FMID           BIGINT  REFERENCES FarmerMarkets (FMID),
    SeasonFromDate DATE,
    SeasonToDate   DATE,
    SeasonDay      VARCHAR,
    SeasonFromTime VARCHAR,
    SeasonToTime   VARCHAR
);

--Remove space

update FarmerMarketDump set [Season1Time 1]= replace([Season1Time 1],' ','');
update FarmerMarketDump set [Season1Time 2]= replace([Season1Time 2],' ','');
update FarmerMarketDump set [Season1Time 3]= replace([Season1Time 3],' ','');
update FarmerMarketDump set [Season1Time 4]= replace([Season1Time 4],' ','');
update FarmerMarketDump set [Season1Time 5]= replace([Season1Time 5],' ','');
update FarmerMarketDump set [Season1Time 6]= replace([Season1Time 6],' ','');
update FarmerMarketDump set [Season1Time 7]= replace([Season1Time 7],' ','');
update FarmerMarketDump set [Season1Time 8]= replace([Season1Time 8],' ','');

update FarmerMarketDump set [Season2Time 1]= replace([Season2Time 1],' ','');
update FarmerMarketDump set [Season2Time 2]= replace([Season2Time 2],' ','');
update FarmerMarketDump set [Season2Time 3]= replace([Season2Time 3],' ','');
update FarmerMarketDump set [Season2Time 4]= replace([Season2Time 4],' ','');
update FarmerMarketDump set [Season2Time 5]= replace([Season2Time 5],' ','');
update FarmerMarketDump set [Season2Time 6]= replace([Season2Time 6],' ','');
update FarmerMarketDump set [Season2Time 7]= replace([Season2Time 7],' ','');
update FarmerMarketDump set [Season2Time 8]= replace([Season2Time 8],' ','');

update FarmerMarketDump set [Season3Time 1]= replace([Season3Time 1],' ','');
update FarmerMarketDump set [Season3Time 2]= replace([Season3Time 2],' ','');
update FarmerMarketDump set [Season3Time 3]= replace([Season3Time 3],' ','');
update FarmerMarketDump set [Season3Time 4]= replace([Season3Time 4],' ','');
update FarmerMarketDump set [Season3Time 5]= replace([Season3Time 5],' ','');
update FarmerMarketDump set [Season3Time 6]= replace([Season3Time 6],' ','');
update FarmerMarketDump set [Season3Time 7]= replace([Season3Time 7],' ','');
update FarmerMarketDump set [Season3Time 8]= replace([Season3Time 8],' ','');

update FarmerMarketDump set [Season4Time 1]= replace([Season4Time 1],' ','');
update FarmerMarketDump set [Season4Time 2]= replace([Season4Time 2],' ','');
update FarmerMarketDump set [Season4Time 3]= replace([Season4Time 3],' ','');
update FarmerMarketDump set [Season4Time 4]= replace([Season4Time 4],' ','');
update FarmerMarketDump set [Season4Time 5]= replace([Season4Time 5],' ','');
update FarmerMarketDump set [Season4Time 6]= replace([Season4Time 6],' ','');
update FarmerMarketDump set [Season4Time 7]= replace([Season4Time 7],' ','');
update FarmerMarketDump set [Season4Time 8]= replace([Season4Time 8],' ','');

--split time and insert into Seasons table

insert into Seasons 
select FMID,Season1FromDate,Season1ToDate,substr([Season1Time 1],0,instr([Season1Time 1],':')),
substr([Season1Time 1],instr([Season1Time 1],':')+1,instr([Season1Time 1],'-')-5),
substr([Season1Time 1],instr([Season1Time 1],'-')+1,length([Season1Time 1])) 
from FarmerMarketDump




insert into Seasons 
select FMID,Season1FromDate,Season1ToDate,substr([Season1Time 2],0,instr([Season1Time 2],':')),
substr([Season1Time 2],instr([Season1Time 2],':')+1,instr([Season1Time 2],'-')-5),
substr([Season1Time 2],instr([Season1Time 2],'-')+1,length([Season1Time 2])) 
from FarmerMarketDump


---Checking which market is open right now

select * from Seasons where '06/09/2016' between SeasonFromDate and SeasonToDate and SeasonDay='Wed' and time() between SeasonFromTime and SeasonToTime

---Create Inventory

CREATE TABLE Inventory (
    FMID          BIGINT  REFERENCES FarmerMarkets (FMID),
    Organic       BOOLEAN,
    Bakedgoods    BOOLEAN,
    Cheese        BOOLEAN,
    Crafts        BOOLEAN,
    Flowers       BOOLEAN,
    Eggs          BOOLEAN,
    Seafood       BOOLEAN,
    Herbs         BOOLEAN,
    Vegetables    BOOLEAN,
    Honey         BOOLEAN,
    Jams          BOOLEAN,
    Maple         BOOLEAN,
    Meat          BOOLEAN,
    Nursery       BOOLEAN,
    Nuts          BOOLEAN,
    Plants        BOOLEAN,
    Poultry       BOOLEAN,
    Prepared      BOOLEAN,
    Soap          BOOLEAN,
    Trees         BOOLEAN,
    Wine          BOOLEAN,
    Coffee        BOOLEAN,
    Beans         BOOLEAN,
    Fruits        BOOLEAN,
    Grains        BOOLEAN,
    Juices        BOOLEAN,
    Mushrooms     BOOLEAN,
    PetFood       BOOLEAN,
    Tofu          BOOLEAN,
    WildHarvested BOOLEAN
);

insert into Inventory
(
FMID ,        
Organic    ,  
Bakedgoods  , 
Cheese    ,   
Crafts  ,     
Flowers  ,    
Eggs     ,    
Seafood  ,   
Herbs       , 
Vegetables  , 
Honey       , 
Jams        , 
Maple       , 
Meat        , 
Nursery     , 
Nuts        , 
Plants      , 
Poultry     , 
Prepared    , 
Soap        , 
Trees      ,  
Wine       ,  
Coffee     ,  
Beans      ,  
Fruits     ,  
Grains      , 
Juices      , 
Mushrooms  ,  
PetFood    ,  
Tofu      ,   
WildHarvested)  
select FMID ,        
Organic    ,  
Bakedgoods  , 
Cheese    ,   
Crafts  ,     
Flowers  ,    
Eggs     ,    
Seafood  ,   
Herbs       , 
Vegetables  , 
Honey       , 
Jams        , 
Maple       , 
Meat        , 
Nursery     , 
Nuts        , 
Plants      , 
Poultry     , 
Prepared    , 
Soap        , 
Trees      ,  
Wine       ,  
Coffee     ,  
Beans      ,  
Fruits     ,  
Grains      , 
Juices      , 
Mushrooms  ,  
PetFood    ,  
Tofu      ,   
WildHarvested from FarmerMarketDump


--- Give me markets in Newyork which accepts credit card and keeps organic vegetables and was open on Wednesday


select * from FarmerMarkets where FMID in (
select FMID from Inventory where Organic='True' and Vegetables='True' and FMID in (
select FMID from Seasons where '06/09/2016' between SeasonFromDate and SeasonToDate and SeasonDay='Wed' and time() between SeasonFromTime and SeasonToTime ) )
 and Credit='True' and State='New York'
    