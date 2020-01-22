#Trigger che scrive nello storico che una recensione è stata modificata ( e la pone in attesa di accettazione)
#OSS: L'if serve poiché nel caso in cui viene posta da "in attesa" ad "accettata" (tramite un update), allora senza if tornerebbe subito a "in attesa" per via della riga 11.

use catalogo;
delimiter $$

create trigger modOfRec before update on Recensione for each row
begin
	if (select IDRecensione from recensione where IDRecensione = new.IDRecensione and approvazione = 'non accettata') is null
    then
		if (select IDRecensione from recensione where IDRecensione = new.IDRecensione and approvazione = 'in attesa') is null
		then
			set new.approvazione = 'in attesa';
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('modifica della recensione ', new.IDRecensione, ' inserito da ', new.refUtente, ' sulla pubblicazione ', new.refPubblicazione), new.refPubblicazione, new.refUtente);
		end if;
	else
		signal sqlstate '45000'
        set message_text = "A review not accepted cannot be modified";
    end if;
end$$
