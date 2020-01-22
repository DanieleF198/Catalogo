#Trigger che quando un recensione viene accettata / rifiutata da un moderatore (o una sua modifica) aggiorna lo storico.

use catalogo;
delimiter $$

create trigger triggerModeratoreRecensione before insert on moderatorer for each row 
begin
	declare x char(13);
	if(select mail from utente where mail = new.mailModeratoreCheAccetta and tipo = "moderatore") is null
    then
				signal sqlstate '45000' 
				set message_text = 'a users who want accept/not accept is not a moderator' ;
    end if;
    
    select refPubblicazione into @x from recensione where new.IDRecensioneDaAccettare = IDRecensione;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update recensione
			set approvazione = "accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione inserimento della recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The review is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "non accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo"
        then
			update recensione
			set approvazione = "non accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto inserimento della recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The review is already not accepted' ;
		end if;
    end if;
    
	if new.tipoOperazione = "modifica" and new.approvato = "accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update recensione
			set approvazione = "accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione della modifica sulla recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of review is already accepted' ;
		end if;
    end if;
    
	if new.tipoOperazione = "modifica" and new.approvato = "non accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo"
        then
			update recensione
			set approvazione = "non accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto della modifica sulla recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of review is already not accepted' ;
		end if;
    end if;
end$$