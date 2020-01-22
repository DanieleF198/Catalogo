#Trigger che in caso viene eliminata una recensione, Tale operazione viene aggiornata nello storico

use catalogo;
delimiter $$


create trigger delOfRec after delete on Recensione for each row
begin
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('Cancellazione della recensione ', old.IDRecensione, ' inserito da ', old.refUtente, ' sulla pubblicazione ', old.refPubblicazione), old.refPubblicazione, old.refUtente);
end$$