start transaction;

delete from yomate.user_language;
delete from yomate.user_loisir;
delete from yomate.user_photo;
delete from yomate.user;


INSERT INTO yomate.user 
(idUser, nom, prenom, birthday, sex, email, password, haspet, situationFam, ecole, profession, nationnalite)  
VALUES				
(1, "ZHU", "Jiawei", "1993-09-14", "0", "olivier_zhu@163.com", "1234", "0", "célibataire", "utc", 1, 2);

INSERT INTO yomate.user_language
(user, language)
value
(1, 2);

INSERT INTO yomate.user_loisir
(user, loisir)
value
(1, 2);

INSERT INTO yomate.user_photo
(user, image)
value
(1, "photo/1.jpg");

commit;