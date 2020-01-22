create database catalogo;

use catalogo;

create table utente (
	mail varchar(63) not null primary key,
    nome varchar(31) not null,
    cognome varchar(31) not null,
    CF char(16) not null,
    password varchar(31) not null,
    stato varchar(31),
    tipo varchar(31),
    collaborazione boolean default false
    );
    
create table pubblicazione (
	ISBN char(13) not null primary key,
    titolo varchar(31) not null,
    editore varchar(31),
    lingua varchar(31),
    dataPubblicazione date,
    n°pagine integer,
    disponibilitàDownload boolean default false,
    n°miPiace integer default 0,
    approvazione varchar(63) default 'in attesa',
    commitUser varchar(63),
    foreign key (commitUser) references utente(mail) on update cascade on delete set null
    );
    
create table Autori(
	refPubblicazione char(13) not null,
    autore varchar(31) not null,
	foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade
    );
    
create table ristampa(
     refPubblicazione char(13) not null,
     Nristampa integer,
     data_ristampa date,
     foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade
     );

create table chiavi(
     refPubblicazione char(13) not null,
     chiave varchar(31) not null,
     foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade
    );

create table Recensione(
	IDRecensione integer not null primary key auto_increment,
    testo varchar(511),
    dataRecensione date,
    approvazione varchar (63) default 'in attesa',
    refPubblicazione char(13) not null,
    refUtente varchar(63),
    foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade,
    foreign key (refUtente) references utente(mail) on update cascade on delete set null
    );
    
create table miPiace(
	dataMiPiace timestamp,
    refPubblicazione char(13) not null,
    refUtente varchar(63),
    foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade,
    foreign key (refUtente) references utente(mail) on update cascade on delete set null
    );
    
create table Storico(
	IDStorico integer not null primary key auto_increment,
    time_stamp timestamp,
    descrizione varchar(255),
    refPubblicazione char(13),
    refUtente varchar(63),
    foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete set null,
    foreign key (refUtente) references utente(mail) on update cascade on delete set null
    );
    
create table indice(
	n°capitolo integer,
    titoloCapitolo varchar(63),
    refPubblicazione char(13) not null,
    foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade
    );

create table sorgente(
	IDSorgente integer not null primary key auto_increment,
	uri varchar(63),
    tipo varchar(63),
    formato varchar(63),
    descrizione varchar(255),
	refPubblicazione char(13) not null,
    foreign key (refPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade
    );
    
create table inserisce(
  ISBNInserisce char(13) not null,
  mailInserente varchar(63),
  dataInserimento timestamp,
  foreign key (ISBNInserisce) references pubblicazione(ISBN) on update cascade on delete cascade,
  foreign key (mailInserente) references utente(mail) on update cascade on delete set null
  );
    
create table moderatoreP (
ISBNPubblicazione char(13) not null,  
approvato varchar(13),
mailModeratore varchar(63),
tipoOperazione varchar(13) not null,
 foreign key (ISBNPubblicazione) references pubblicazione(ISBN) on update cascade on delete cascade,
    foreign key (mailModeratore) references utente(mail) on update cascade on delete set null
);

create table moderatoreR (
IDRecensioneDaAccettare integer,
approvato varchar(13),
mailModeratoreCheAccetta varchar(63),
tipoOperazione varchar(13) not null,
 foreign key (IDRecensioneDaAccettare) references recensione(IDRecensione) on update cascade on delete cascade,
 foreign key (mailModeratoreCheAccetta) references utente(mail) on update cascade on delete set null
 );
    
    

    
    