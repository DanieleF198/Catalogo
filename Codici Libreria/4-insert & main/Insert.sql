use catalogo;

insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('gianluca.rea@gmail.com','Gianluca','Rea','REAGLC97P26I838S','ciaociao','attivo','moderatore');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('daniele.fossemo@gmail.com','Daniele','Fossemo','DNLFSM98P25I203S','admin','passivo','moderatore');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('davide.ricci@gmail.com','Davide','Ricci','DVDRCC98P23I230S','sveglia','passivo','moderatore');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('maria.defilippi@gmail.com','Maria','De Filippi','MRADFP12P22I123S','amici','attivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('francesco.totti@gmail.com','Francesco','Totti','FRTTTP76P26I838S','forzaRoma','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('alex.delpiero@gmail.com','Alex','DelPiero','DPRALX7P21I886S','Mondiali2006','attivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('eric.cantona@gmail.com','Eric','Cantona','CNTERC68P14I999S','TheKing','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('joey.tribbiani@gmail.com','Joey','Tribbiani','JOETRB7P21I999S','HowYouDoin','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('chandler.bing@gmail.com','Chandler','Bing','CDLBNG9S24S976D','KingofSarcasm','attivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('ross.geller@gmail.com','Ross','Geller','RSSGLL3C16I456S','PivotPivot','attivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('rachel.green@gmail.com','Rachel','Green','RCLGRN6P46I368D','Igotofftheplane','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('monica.geller@gmail.com','Monica','Geller','MNCGLL3P11I392S','IalwaysWin','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('phoebe.buffay@gmail.com','Phoebe','Buffay','POBBFF3P17I237S','SmellyCat','passivo','finale');
insert into utente (mail,nome,cognome,CF,password,stato,tipo) value('frank.sinatra@gmail.com','Frank','Sinatra','FRKSNT7P21I999S','NewYork','passivo','finale');


insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788854165069','Divina Commedia','D Agostini','Dialetto Fiorentino','2000-02-02',1000,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854165069','Dante');
insert into chiavi(refPubblicazione,chiave) value ('9788854165069','Alighieri');
insert into chiavi(refPubblicazione,chiave) value ('9788854165069','Divina');
insert into chiavi(refPubblicazione,chiave) value ('9788854165069','Commedia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165069',1,'2000-04-04');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165069',2,'2000-06-05');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165069',3,'2000-07-06');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('http://server.net/coverDC.jpg', 'immagine', 'image/jpeg', 'copertina', '9788854165069');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('http://server.net/DivinaCommedia.pdf', 'download', 'application/pdf', 'versione elettronica gratuita', '9788854165069');
insert into indice value (1, 'paradiso', '9788854165069');
insert into indice value (2, 'purgatorio', '9788854165069');
insert into indice value (3, 'inferno', '9788854165069');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9781118503256','The Warrent Buffet way','John Wiley','Inglese','2004-05-02',281,'eric.cantona@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9781118503256','Robert G. Hagstrom');
insert into chiavi(refPubblicazione,chiave) value ('9781118503256','Warren');
insert into chiavi(refPubblicazione,chiave) value ('9781118503256','Buffett');
insert into chiavi(refPubblicazione,chiave) value ('9781118503256','Economia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9781118503256',1,'2004-07-10');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9781118503256',2,'2004-09-6');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('http://server.net/coverTWBW.jpg', 'immagine', 'image/jpeg', 'copertina', '9781118503256');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('”http://www.amazon.it/TheWarrentBUffetWay', 'acquisto', 'cartaceo, copertina rigida', 'Acquista online', '9781118503256');
insert into indice value (1, 'The first', '9781118503256');
insert into indice value (2, 'The second', '9781118503256');
insert into indice value (3, 'And yeah, the third!', '9781118503256');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788854181434','Decameron','Mondadori','Dialetto Fiorentino','2003-02-01',699,'eric.cantona@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854181434','Giovanni Boccaccio');
insert into chiavi(refPubblicazione,chiave) value ('9788854181434','Giovanni');
insert into chiavi(refPubblicazione,chiave) value ('9788854181434','Boccaccio');
insert into chiavi(refPubblicazione,chiave) value ('9788854181434','Decameron');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854181434',1,'2003-11-23');
insert into indice value (1, 'Novella prima', '9788854181434');
insert into indice value (2, 'novella seconda', '9788854181434');
insert into indice value (3, 'novella terza', '9788854181434');
insert into indice value (4, 'Novella quarta', '9788854181434');
insert into indice value (5, 'novella quinta', '9788854181434');
insert into indice value (6, 'novella sesta', '9788854181434');
insert into indice value (7, 'Novella settima', '9788854181434');
insert into indice value (8, 'novella ottava', '9788854181434');
insert into indice value (9, 'novella nona', '9788854181434');
insert into indice value (10, 'Novella decima', '9788854181434');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788854187177','Odissea','Newton Compton','Greco Antico','2013-05-03',383,'eric.cantona@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854187177','Omero');
insert into chiavi(refPubblicazione,chiave) value ('9788854187177','Omero');
insert into chiavi(refPubblicazione,chiave) value ('9788854187177','Odissea');
insert into chiavi(refPubblicazione,chiave) value ('9788854187177','Grecia');
insert into chiavi(refPubblicazione,chiave) value ('9788854187177','Greco');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854187177',1,'2013-09-23');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854187177',2,'2013-12-19');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('”http://www.amazon.it/Odissea', 'acquisto', 'cartaceo, copertina rigida', 'Acquista online', '9788854187177');
insert into indice value (1, 'Il cavallo di troia', '9788854187177');
insert into indice value (2, 'Polifemo ATTACK!', '9788854187177');
insert into indice value (3, 'le sireneeeee', '9788854187177');
insert into indice value (4, 'ARRIVANO I PROCI!', '9788854187177');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788854186231','Illiade','Newton Compton','Greco Antico','2013-05-02',510,'alex.delpiero@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854186231','Omero');
insert into chiavi(refPubblicazione,chiave) value ('9788854186231','Omero');
insert into chiavi(refPubblicazione,chiave) value ('9788854186231','Illiade');
insert into chiavi(refPubblicazione,chiave) value ('9788854186231','Grecia');
insert into chiavi(refPubblicazione,chiave) value ('9788854186231','Greco');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854186231',1 ,'2013-06-13');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854186231',2 ,'2013-12-02');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854186231',3 ,'2014-03-21');
insert into indice value (1, 'Eneide, SCAPPA!', '9788854186231');
insert into indice value (2, 'Eneide sta scappando!', '9788854186231');
insert into indice value (3, 'Eneide sta ancora scappando!', '9788854186231');
insert into indice value (4, 'Eneide... È SCAPPATA!', '9788854186231');


insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,disponibilitàDownload,commitUser) value ('9788854165511','Database Systems','McGraw-Hill','Inglese','1999-05-05',612,true,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854165511','Azteni');
insert into Autori(refPubblicazione,autore) value ('9788854165511','Ceri');
insert into Autori(refPubblicazione,autore) value ('9788854165511','Paraboschi');
insert into Autori(refPubblicazione,autore) value ('9788854165511','Torlone');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165511',1 ,'2000-01-30');
insert into indice value (1, 'PARTE PRIMA', '9788854165511');
insert into indice value (2, 'PARTE SECONDA', '9788854165511');
insert into indice value (3, 'PARTE TERZA', '9788854165511');
insert into indice value (4, 'PARTE QUARTA', '9788854165511');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788864401607','Liberi di Scegliere','IBL Libri','Inglese','1974-02-02',305,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788864401607','Milton Friedman');
insert into chiavi(refPubblicazione,chiave) value ('9788864401607','Friedman');
insert into chiavi(refPubblicazione,chiave) value ('9788864401607','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788864401607','Capitalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788864401607','Economia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788864401607',1,'1974-06-22');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788864401607',2,'1975-04-19');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788864400235','Capitalismo e libertà','IBL Libri','Inglese','1976-06-05',298,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788864400235','Milton Friedman');
insert into chiavi(refPubblicazione,chiave) value ('9788864400235','Friedman');
insert into chiavi(refPubblicazione,chiave) value ('9788864400235','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788864400235','Capitalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788864400235','Economia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788864400235',1,'1976-12-16');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788864400235',2,'1977-05-16');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788864400235',3,'1978-11-07');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788849830842','La via della schiavitù','IBL Libri','Inglese','1980-09-09',293,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788849830842','Friedrich A. von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849830842','von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849830842','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849830842','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849830842','Capitalismo');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849830842',1,'1980-12-12');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849830842',2,'1981-02-27');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849830842',3,'1982-03-01');
insert into sorgente(uri, tipo, formato, descrizione, refPubblicazione) value ('http://server.net/LaViaDellaSchiavitù.pdf', 'download', 'application/pdf', 'versione elettronica gratuita', '9788849830842');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788849833409','Liberalismo','Rubbettino','Italiano','1974-06-08',70,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788849833409','Friedrich A. von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849833409','von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849833409','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849833409','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849833409','Capitalismo');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849833409',1,'1974-09-18');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849833409',2,'1975-04-28');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788849829839','La società libera','Rubbetino','Inglese','1979-08-06',714,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788849829839','Friedrich A. von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849829839','von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849829839','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849829839','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849829839','Capitalismo');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849829839',1,'1980-03-07');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788849829631',' stato interventista','Rubbetino','Inglese','1986-04-05',328,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788849829631','Ludwig von Mises');
insert into chiavi(refPubblicazione,chiave) value ('9788849829631','von Mises');
insert into chiavi(refPubblicazione,chiave) value ('9788849829631','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849829631','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849829631','Capitalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849829631','Economia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849829631',1,'1986-09-15');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849829631',2,'1987-02-25');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788854165075','Burocrazia','Rubbetino','Inglese','1971-05-12',161,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788854165075','Ludwig von Mises');
insert into chiavi(refPubblicazione,chiave) value ('9788854165075','von Mises');
insert into chiavi(refPubblicazione,chiave) value ('9788854165075','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788854165075','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788854165075','Capitalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788854165075','Economia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165075',1,'1971-05-12');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788854165075',2,'1972-05-12');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788849851779','competizione e libertà','Rubbetino','Inglese','1953-05-11',150,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788849851779','Friedrich A. von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849851779','von Hayek');
insert into chiavi(refPubblicazione,chiave) value ('9788849851779','Liberismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849851779','Liberalismo');
insert into chiavi(refPubblicazione,chiave) value ('9788849851779','Capitalismo');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849851779',1,'1953-05-11');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849851779',2,'1954-07-28');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849851779',3,'1954-11-23');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788849851779',4,'1955-07-16');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788856500707','Anarchia,stato e utopia','Il Saggiatore','Italiano','2001-04-09',382,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788856500707','Robert Nozick');
insert into chiavi(refPubblicazione,chiave) value ('9788856500707','Nozick');
insert into chiavi(refPubblicazione,chiave) value ('9788856500707','Anarchia');
insert into chiavi(refPubblicazione,chiave) value ('9788856500707','Stato');
insert into chiavi(refPubblicazione,chiave) value ('9788856500707','Utopia');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788856500707',1,'2002-11-09');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788856500707',2,'2003-02-12');

insert into pubblicazione(ISBN,titolo,editore,lingua,dataPubblicazione,n°pagine,commitUser) value ('9788856501707','Operating System','Newton Compton','Inglese','2010-04-09',718,'francesco.totti@gmail.com');
insert into Autori(refPubblicazione,autore) value ('9788856501707','Richer');
insert into chiavi(refPubblicazione,chiave) value ('9788856501707','Richer');
insert into chiavi(refPubblicazione,chiave) value ('9788856501707','Operating');
insert into chiavi(refPubblicazione,chiave) value ('9788856501707','System');
insert into ristampa(refPubblicazione,Nristampa,data_ristampa) value ('9788856501707',1,'2011-05-29');
insert into indice value (1, 'PARTE PRIMA', '9788856501707');
insert into indice value (2, 'PARTE SECONDA', '9788856501707');
insert into indice value (3, 'PARTE TERZA', '9788856501707');
insert into indice value (4, 'PARTE QUARTA', '9788856501707');


insert into moderatorep value ('9788854165069', 'accettata', 'daniele.fossemo@gmail.com', 'inserimento');
insert into moderatorep value ('9788854187177', 'accettata', 'davide.ricci@gmail.com', 'inserimento');
insert into moderatorep value ('9788854186231', 'accettata', 'gianluca.rea@gmail.com', 'inserimento');
insert into moderatorep value ('9788854165511', 'accettata', 'gianluca.rea@gmail.com', 'inserimento');
insert into moderatorep value ('9788854165075', 'accettata', 'gianluca.rea@gmail.com', 'inserimento');
insert into moderatorep value ('9788849851779', 'non accettata', 'davide.ricci@gmail.com', 'inserimento');

call delOfPubblOperation('9788849851779', 'daniele.fossemo@gmail.com');

insert into recensione(testo,dataRecensione,refPubblicazione,refUtente) value ('Grande giove,un libro fantastico','2012-01-01','9788854165069','alex.delpiero@gmail.com');
insert into recensione(testo,dataRecensione,refPubblicazione,refUtente) value ('Grande giove,un bel libro ','2013-02-02','9788854165069','francesco.totti@gmail.com');
insert into recensione(testo,dataRecensione,refPubblicazione,refUtente) value ('Grande giove,un libro carino','2014-02-04','9788854186231','francesco.totti@gmail.com');
insert into recensione(testo,dataRecensione,refPubblicazione,refUtente) value ('Grande giove,un libro consigliato','2016-02-05','9788854165511','eric.cantona@gmail.com');


insert into mipiace value (current_timestamp(), '9788854165069', 'alex.delpiero@gmail.com');
insert into mipiace value (current_timestamp(), '9788854165069', 'francesco.totti@gmail.com');
insert into mipiace value (current_timestamp(), '9788854165069', 'joey.tribbiani@gmail.com');
insert into mipiace value (current_timestamp(), '9788854165069', 'daniele.fossemo@gmail.com');
insert into mipiace value (current_timestamp(), '9788854187177', 'francesco.totti@gmail.com');
insert into mipiace value (current_timestamp(), '9788854187177', 'joey.tribbiani@gmail.com');
insert into mipiace value (current_timestamp(), '9788854186231', 'daniele.fossemo@gmail.com');
insert into mipiace value (current_timestamp(), '9788854186231', 'francesco.totti@gmail.com');
insert into mipiace value (current_timestamp(), '9788854186231', 'davide.ricci@gmail.com');
insert into mipiace value (current_timestamp(), '9788854186231', 'gianluca.rea@gmail.com');


insert into moderatorer value (1, 'accettata', 'daniele.fossemo@gmail.com', 'inserimento');
insert into moderatorer value (2, 'accettata', 'davide.ricci@gmail.com', 'inserimento');
insert into moderatorer value (4, 'non accettata', 'gianluca.rea@gmail.com', 'inserimento');

call delOfLikeOperation('9788854186231', 'gianluca.rea@gmail.com');
call delOfLikeOperation('9788854186231', 'daniele.fossemo@gmail.com');
call delOfLikeOperation('9788854165069', 'joey.tribbiani@gmail.com');

call modOfRecOperation(1, 'GRANDISSIMO GIOVE, un libro più che fantastico', 'alex.delpiero@gmail.com');

call delOfRecOperation(4, 'eric.cantona@gmail.com');
