#Operazione 3: Estrazione elenco delle pubblicazioni aggiornate di recente (ultimi 30 giorni).
use catalogo;

delimiter $$

create procedure estrazione_pubblicazioni_aggiornate_30giorni()
begin
select titolo , ISBN from Storico join Pubblicazione where ISBN = refPubblicazione && time_stamp > date_sub(now(),interval 30 day);

end$$