SET SQL_SAFE_UPDATES = 0;

start transaction;

delete from yomate.nationnalite;
delete from yomate.language;
delete from yomate.loisir;
delete from yomate.profession;

LOAD DATA LOCAL INFILE 'F:/UTC/NF28+IA04/Yomate/src/nationnalite.csv' 
INTO TABLE yomate.nationnalite FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'F:/UTC/NF28+IA04/Yomate/src/langue.csv' 
INTO TABLE yomate.language FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'F:/UTC/NF28+IA04/Yomate/src/loisir.csv' 
INTO TABLE yomate.loisir FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'F:/UTC/NF28+IA04/Yomate/src/profession.csv' 
INTO TABLE yomate.profession FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

update yomate.nationnalite set nationnalite = REPLACE (nationnalite,"\"","");
update yomate.loisir set loisir = REPLACE (loisir,"\"",""); 
update yomate.language set language = REPLACE (language,"\"",""); 
update yomate.profession set profession = REPLACE (profession,"\"","");  
update yomate.nationnalite set nationnalite = REPLACE (nationnalite,"\r","");
update yomate.loisir set loisir = REPLACE (loisir,"\r",""); 
update yomate.language set language = REPLACE (language,"\r",""); 
update yomate.profession set profession = REPLACE (profession,"\r","");

update yomate.loisir set loisir = substring(loisir, 2); 
update yomate.language set language = substring(language, 2); 
update yomate.profession set profession = substring(profession, 2);
commit;