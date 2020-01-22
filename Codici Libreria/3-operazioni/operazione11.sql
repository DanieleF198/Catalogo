#inserimento di un like relativo ad una pubblicazione

use catalogo;

delimiter $$ 

create procedure inserimento_mipiace(in newISBN char(13) , newmail varchar(63))
insert into mipiace(dataMiPiace,refPubblicazione,refUtente) value (current_timestamp(),newISBN,newmail);$$