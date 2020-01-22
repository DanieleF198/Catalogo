#trigger che aggiorna lo storico quando viene inserita una pubblicazione

use catalogo;
delimiter $$

create trigger insOfPubbl after insert on Pubblicazione for each row
begin
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('inserimento della pubblicazione ', new.ISBN, ' inserita da ', new.commitUser), new.ISBN, new.commitUser);
end$$