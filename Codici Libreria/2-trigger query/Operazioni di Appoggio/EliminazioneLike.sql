#procedura che permette il Delete di un Like, nella fattispece permette che un like possa essere eliminata se e solo se sono specificati l'utente e l'isbn.

use catalogo;
delimiter $$

create procedure delOfLikeOperation (in PubblReferred varchar(13), deleter varchar(63))
begin
	if (select refPubblicazione from mipiace where refPubblicazione = PubblReferred and refUtente = deleter) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a like to the publication passed by the user passed";
    else
			delete from mipiace where refPubblicazione = PubblReferred and refUtente = deleter;
	end if;
end$$