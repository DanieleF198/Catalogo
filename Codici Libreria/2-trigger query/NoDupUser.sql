#Trigger che non permette di inserire due utenti uguali nel database

use catalogo;
delimiter $$


create trigger insUtente before insert on utente for each row
begin
	if (select mail from utente where CF = new.CF)
    then
		signal sqlstate '45000'
        set message_text = "review already exists";
    end if;
end$$