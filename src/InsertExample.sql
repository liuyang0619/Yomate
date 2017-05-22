start transaction;

LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Documents/GitHub/YomateFront/Yomate/src/nationnalite.csv' 
INTO TABLE yomate.nationnalite FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';



commit;