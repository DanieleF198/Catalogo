#Data una pubblicazione, restituire tutte le pubblicazioni del catalogo
#aventi gli stessi autori

use catalogo;
delimiter $$

create procedure estrazione_byautore (in aISBN char(13))
select titolo, autore from pubblicazione , autori where ISBN = (select refPubblicazione where autore = (select autore from Autori  where aISBN = refPubblicazione)) group by refPubblicazione$$
