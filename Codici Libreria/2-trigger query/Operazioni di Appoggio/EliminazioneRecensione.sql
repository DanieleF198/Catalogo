#procedura che permette il Delete di una recensione, nella fattispece permette che una recensione possa essere eliminata se e solo se chi elimina è lo stesso creatore della recensione.

use catalogo;
delimiter $$

create procedure delOfRecOperation (in IDRecToMod int, deleter varchar(63))
begin
	if (select IDRecensione from recensione where IDRecensione = IDRecToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a review with the ID passed";
    else
		if (select IDRecensione from recensione where IDRecensione = IDRecToMod and refUtente = deleter)
			then
			delete from recensione where IDRecensione = IDRecToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to delete the review is not the same who insert him";
		end if;
	end if;
end$$