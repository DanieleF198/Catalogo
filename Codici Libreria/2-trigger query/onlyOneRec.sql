#Trigger che permette ad un utente di inserire solo una recensione su una data pubblicazione

use catalogo;
delimiter $$


create trigger onlyOneRec before insert on recensione for each row
begin
	if(select IDRecensione from recensione where refPubblicazione = new.refPubblicazione and refUtente=new.refUtente) is not null
    then
		signal sqlstate '45000'
        set message_text = "review already exists";
    end if;
end$$