#Trigger che, quando una pubblicazione viene accettata o rifiutata da un moderatore, allora aggiorna lo storico.

use catalogo;
delimiter $$

create trigger triggerModeratorePubblicazione before insert on moderatorep for each row 
begin
	if(select mail from utente where mail = new.mailModeratore and tipo = "moderatore") is null
    then
				signal sqlstate '45000' 
				set message_text = 'a users who want accept/not accept is not a moderator' ;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione inserimento della pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore ), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The pubblication is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "non accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "non accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto inserimento della pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore ), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The pubblication is already not accepted' ;
		end if;
   end if;
    
    if new.tipoOperazione = "modifica" and new.approvato = "accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione della modifica sulla pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of pubblication is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "modifica" and new.approvato = "non accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "non accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "non accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto della modifica sulla pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of pubblication is already not accepted' ;
		end if;
    end if;
end$$