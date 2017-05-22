CREATE DATABASE yomate;

USE yomate;

CREATE TABLE Language (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    language varchar(255)
);

CREATE TABLE loisir (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    loisir varchar(255)
);

CREATE TABLE Profession (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    profession varchar(255)
);

CREATE TABLE Nationnalite (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nationnalite varchar(255)
);

CREATE TABLE User (
    idUser INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom varchar(20) NOT NULL,
    prenom varchar(20) NOT NULL,
    birthday DATE,
    sex INT(1) not null,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    haspet INT(1),
    situationFam varchar(255),
    ecole varchar(255),
    profession INT,
    nationnalite INT,
    FOREIGN KEY (profession) REFERENCES Profession(id),
	FOREIGN KEY (nationnalite) REFERENCES Nationnalite(id)
); 

CREATE TABLE user_photo(
	user INT,
    image varchar(255),
    PRIMARY KEY (user,image),
    FOREIGN KEY(user) REFERENCES User(idUser)
);


CREATE TABLE user_language (
    user INT NOT NULL ,
    language INT NOT NULL,
    PRIMARY KEY (user, language),
    FOREIGN KEY (user) REFERENCES User(idUser),
	FOREIGN KEY (language) REFERENCES language(id)
);

CREATE TABLE user_loisir (
    user INT NOT NULL ,
    loisir INT NOT NULL ,
    PRIMARY KEY (user, loisir),
    FOREIGN KEY (user) REFERENCES User(idUser),
	FOREIGN KEY (loisir) REFERENCES loisir(id)
);

CREATE TABLE Evaluation (
    user_commenter INT NOT NULL,
    user_commented INT NOT NULL ,
    note INT,
    desription varchar(25),
	date_evaluation date, 
    FOREIGN KEY (user_commenter) REFERENCES User(idUser),
	FOREIGN KEY (user_commented) REFERENCES User(idUser)
);

CREATE TABLE HistoireMessage (
    sender INT NOT NULL,
    receiver INT NOT NULL,
    time dateTime,
    contenu varchar(25),
    FOREIGN KEY (sender) REFERENCES User(idUser),
	FOREIGN KEY (receiver) REFERENCES User(idUser)
);


CREATE TABLE Annonce (
    idAnnonce INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    date_proposer DATE,
    date_debut DATE,
    date_fin DATE,
    proposer INT NOT NULL,
    description varchar(255),
    budget INT,
    nbPersonneBesoin INT,
    lieu varchar(255),
    description_logement varchar(255),
    sex INT(1),
    age_min INT,
    age_max INT,
    status INT(1),
    haspet INT(1),
    situationFam varchar(255),
    ecole varchar(255),
    profession INT,
    nationnalite INT,
    FOREIGN KEY (profession) REFERENCES Profession(id),
    FOREIGN KEY (proposer) REFERENCES User(idUser),
    FOREIGN KEY (nationnalite) REFERENCES Nationnalite(id)
);

CREATE TABLE HistoireColo (
    user1 INT NOT NULL,
    user2 INT NOT NULL,
    dateDebut DATE,
    dateFin DATE,
    annonce INT NOT NULL,
    FOREIGN KEY (user1) REFERENCES User(idUser),
	FOREIGN KEY (user2) REFERENCES User(idUser),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce)
);

CREATE TABLE Annonc_user(
	annonce INT NOT NULL,
    user INT NOT NULL,
    PRIMARY KEY (annonce,user),
    FOREIGN KEY (user) REFERENCES User(idUser),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce)
);

CREATE TABLE Annonce_language(
	annonce INT NOT NULL ,
    language INT NOT NULL,
    PRIMARY KEY (annonce, language),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
	FOREIGN KEY (language) REFERENCES language(id)
);

CREATE TABLE Annonce_loisir(
	annonce INT NOT NULL ,
    loisir INT NOT NULL,
    PRIMARY KEY (annonce, loisir),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
	FOREIGN KEY (loisir) REFERENCES Loisir(id)
);


CREATE TABLE Watch(
    user INT NOT NULL,
    annonce INT NOT NULL,
    PRIMARY KEY (user, annonce),
    time dateTime,
    FOREIGN KEY (user) REFERENCES User(idUser),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce)
);

CREATE TABLE Annonce_obligatoire(
	annonce INT,
    critere varchar(255),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
    PRIMARY KEY(annonce, critere)
);

CREATE TABLE Annonce_important(
	annonce INT,
    critere varchar(255),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
    PRIMARY KEY(annonce, critere)
);

CREATE TABLE Annonce_peutetre(
	annonce INT,
    critere varchar(255),
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
    PRIMARY KEY(annonce, critere)
);


CREATE TABLE Matching(
	annonce INT,
    user INT,
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
    FOREIGN KEY (user) REFERENCES User(idUser)
);


CREATE TABLE Favoriser(
	annonce INT,
    user INT,
    FOREIGN KEY (annonce) REFERENCES Annonce(idAnnonce),
    FOREIGN KEY (user) REFERENCES User(idUser)
);



