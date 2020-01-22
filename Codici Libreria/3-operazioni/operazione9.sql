#Operazione9 : Inserimento di una recensione relativa a una pubblicazione.

use catalogo;

delimiter $$ 

create procedure inserimento_recensione(in newtesto varchar(511), newISBN char(13), newUtente varchar(63))
insert into recensione (testo,dataRecensione,refPubblicazione,refUtente) value (newtesto,current_timestamp(),newISBN,newUtente);$$
