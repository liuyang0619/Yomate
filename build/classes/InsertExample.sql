start transaction;

delete from yomate.user_language;
delete from yomate.user_loisir;
delete from yomate.user_photo;
delete from yomate.user;


INSERT INTO yomate.user 
(nom, prenom, birthday, sex, email, password, haspet, situationFam, ecole, profession, nationnalite)  
VALUES				
("ZHU", "Jiawei", "1993-09-14", "0", "olivier_zhu@163.com", "1234", "0", "célibataire", "utc", 1, 2), 
("LOU", "GOU", "1993-10-04", "0", "Gou_lou@163.com", "1234", "1", "couple", "shu", 5, 12);

INSERT INTO yomate.user_language
(user, language)
values
(1, 2),
(1, 3),
(2, 4);

INSERT INTO yomate.user_loisir
(user, loisir)
value
(1, 2),
(2, 4),
(2, 3);

INSERT INTO yomate.user_photo
(user, image)
value
(1, "photo/1.jpg");

commit;

start transaction;

delete from yomate.annonce;
delete from yomate.annonce_language;
delete from yomate.annonce_loisir;
delete from yomate.annonce_obligatoire;
delete from yomate.annonce_important;
delete from yomate.annonce_peutetre;
delete from yomate.annonc_user;


INSERT INTO yomate.annonce 
(date_proposer, date_debut, date_fin, proposer, description, budget, nbPersonneBesoin, lieu, description_logement, sex, age_min, age_max, status, haspet, situationFam, ecole, profession, nationnalite)  
VALUES				
("2016-08-01", "2016-09-01","2017-02-01", 1, "je cherche une colocataire qui est jolie!", 450, 2, "Paris", null, 1, 18, 25, 1, 0, "couple", "utc", 5, 1), 
("2013-08-01", "2014-09-01","2015-09-01", 1, "me contacter par email, svp", 570, 1, "compiegne", null, 1, 18, 25, 1, 0, "couple", "shu", 6, 5);

INSERT INTO yomate.annonce_language
(annonce, language)
values
(1, 2),
(1, 3),
(2, 4);

INSERT INTO yomate.annonce_loisir
(annonce, loisir)
values
(1, 2),
(2, 4),
(2, 3);

INSERT INTO yomate.annonce_obligatoire
(annonce, critere)
values
(1, "budget"),
(1, "sex");

INSERT INTO yomate.annonce_important
(annonce, critere)
values
(1, "ecole"),
(1, "age");

INSERT INTO yomate.annonce_peutetre
(annonce, critere)
values
(1, "haspet");

commit;

start transaction;

INSERT INTO yomate.histoirecolo
(user1, user2, dateDebut, dateFin, annonce)
values
(1, 2, "2016-09-01","2017-02-01", 1);

INSERT INTO yomate.favoriser
(user, annonce)
values
(2, 2);

INSERT INTO yomate.evaluation
(user_commenter, user_commented, note, desription, date_evaluation)
values
(1, 2, 3, "Bon colocataire", "2017-09-01");

commit;

