#Trigger che scrive nello storico che una pubblicazione è stata modificata ( e la pone in attesa di accettazione )
#OSS: L'if serve poiché nel caso in cui viene posta da "in attesa" ad "accettata" (tramite un update), allora senza if tornerebbe subito a "in attesa" per via della riga 11.

use catalogo;
delimiter $$

create trigger modOfPubbl before update on pubblicazione for each row
begin
	if (select ISBN from pubblicazione where ISBN = new.ISBN and approvazione = 'non accettata') is null
    then
		if new.n°miPiace is null then #if per evitare che l'aggiornamento dato dai trigger di aggiunta/eliminazione like rimettano la pubblicazione "in attesa" e scrivano nello storico "modifica...".
			if (select ISBN from pubblicazione where ISBN = new.ISBN and approvazione = 'in attesa')
			then
				set new.approvazione = 'in attesa';
				insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
				values (current_timestamp, concat('modifica della pubblicazione ', new.ISBN, ' inserita da ', new.commitUser), new.ISBN, new.commitUser);
			end if;
		end if;
	else
		signal sqlstate '45000'
        set message_text = "A publication not accepted cannot be modified";
    end if;
end$$