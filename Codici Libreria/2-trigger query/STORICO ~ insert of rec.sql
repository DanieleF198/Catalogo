#trigger che aggiorna lo storico quando viene inserita una recensione

use catalogo;
delimiter $$

create trigger InsOfRec after insert on Recensione for each row
begin
	if (select ISBN from pubblicazione where ISBN = new.refPubblicazione and pubblicazione.approvazione = 'accettata') is not null
    then
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('inserimento della recensione ', new.IDRecensione, ' inserito da ', new.refUtente, ' sulla pubblicazione ', new.refPubblicazione), new.refPubblicazione, new.refUtente);
	else
    signal sqlstate '45000'
	set message_text = "Cannot add a review to a not accepted (or in waiting) publication";
    end if;
end$$