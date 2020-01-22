#Operazione 8: Ricerca di pubblicazioni per ISBN, titolo, autore, e parole chiave.
use catalogo;
delimiter $$ 

create procedure ricerca_pubblicazione(in Parola varchar(63))
begin 
select ISBN,titolo,autore from pubblicazione join Autori join Chiavi where ISBN = Autori.refPubblicazione && ISBN = Chiavi.refPubblicazione && ( Parola = autore || Parola = chiave || Parola = titolo || Parola = ISBN ) group by ISBN;
end$$