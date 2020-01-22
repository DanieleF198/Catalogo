#procedura che permette il Delete di una recensione, nella fattispece permette che una recensione possa essere eliminata se e solo se chi elimina è lo stesso creatore della recensione.

use catalogo;
delimiter $$

create procedure delOfPubblOperation (in ISBNPubblToMod varchar(13), deleter varchar(63))
begin
	if (select ISBN from pubblicazione where ISBN = ISBNPubblToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a publication with the ID passed";
    else
		if (select ISBN from pubblicazione, utente where ISBN = ISBNPubblToMod and deleter = mail and tipo = "moderatore" )
			then
			delete from pubblicazione where ISBN = ISBNPubblToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to delete the pubbliation is not a moderator";
		end if;
	end if;
end$$