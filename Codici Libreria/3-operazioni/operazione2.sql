#Operazione 2. Estrazione elenco delle ultime dieci pubblicazioni inserite.
use catalogo;

delimiter $$

create procedure estrazione_ultime10_pubblicazioni_inserite()
select titolo, ISBN from Storico join Pubblicazione where ISBN = refPubblicazione && descrizione like '%inserimento della pubblicazione%' &&  time_stamp order by time_stamp desc limit 10;$$

