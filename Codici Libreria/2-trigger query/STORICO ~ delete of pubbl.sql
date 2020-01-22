#Trigger che non permette ad una pubblcazione di essere eliminata se "accettata" o "in attesa", in caso possa essere eliminata si aggiorna lo storico.

use catalogo;
delimiter $$

create trigger delOfPubbl before delete on Pubblicazione for each row
begin
	if old.approvazione = 'accettata' or old.approvazione='in attesa' 
    then
		signal sqlstate '45000'
        set message_text = 'an accepted/waiting publication cannot be delete';
    else
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('Cancellazione della pubblicazione NON ACCETTATA ', old.ISBN, ' inserita da ', old.commitUser), old.ISBN, old.commitUser);
    end if;
end$$