#Estrazione elenco delle recensioni approvate per una pubblicazione.

use catalogo;

delimiter $$

create procedure estrazione_recensioni_approvate (in pISBN char(13))
begin
   select IDRecensione , testo from recensione where approvazione = 'accettata' && refPubblicazione = pISBN ;
end$$