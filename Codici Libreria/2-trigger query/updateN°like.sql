# Trigger che, in caso viene messo un like ad una pubblicazione, aggiorna opportunamente il contatore

use catalogo;
delimiter $$

create trigger triggerLike before insert on mipiace for each row
begin
	if (select refUtente from mipiace where refUtente= new.RefUtente and refPubblicazione = new.refPubblicazione) is null	#controllo se il like è stato già messo dall'utente
    then
		if (select ISBN from pubblicazione where ISBN = new.refPubblicazione and approvazione = "accettata") is not null	#controllo se si sta mettendo like ad una pubblicazione accettata
		then
			update pubblicazione
			set n°miPiace = n°miPiace + 1
			where pubblicazione.isbn = new.refPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('Mi piace alla pubblicazione ', new.refPubblicazione, ' inserito da ', new.refUtente), new.refPubblicazione, new.refUtente);
		else
			signal sqlstate '45000'
			set message_text = "Cannot add a like to a not accepted (or in waiting) publication";
		end if;
	else
		signal sqlstate '45000'
		set message_text = "the user has already put like";
	end if;
end$$