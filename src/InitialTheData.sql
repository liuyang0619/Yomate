start transaction;

delete from yomate.nationnalite;
delete from yomate.language;
delete from yomate.loisir;
delete from yomate.profession;

LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Documents/GitHub/YomateFront/Yomate/src/nationnalite.csv' 
INTO TABLE yomate.nationnalite FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Documents/GitHub/YomateFront/Yomate/src/langue.csv' 
INTO TABLE yomate.language FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Documents/GitHub/YomateFront/Yomate/src/loisir.csv' 
INTO TABLE yomate.loisir FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'C:/Users/lenovo/Documents/GitHub/YomateFront/Yomate/src/profession.csv' 
INTO TABLE yomate.profession FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

update yomate.nationnalite set nationnalite = REPLACE (nationnalite,"\"","");
update yomate.loisir set loisir = REPLACE (loisir,"\"",""); 
update yomate.language set language = REPLACE (language,"\"",""); 
update yomate.profession set profession = REPLACE (profession,"\"","");  
update yomate.nationnalite set nationnalite = REPLACE (nationnalite,"\r","");
update yomate.loisir set loisir = REPLACE (loisir,"\r",""); 
update yomate.language set language = REPLACE (language,"\r",""); 
update yomate.profession set profession = REPLACE (profession,"\r","");  

commit;