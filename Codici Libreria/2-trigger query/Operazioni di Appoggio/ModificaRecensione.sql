#procedura che permette l'update di una recensione, nella fattispece permette che una recensione possa essere modificata se e solo se chi modifica è lo stesso creatore della recensione.

use catalogo;
delimiter $$

create procedure modOfRecOperation (in IDRecToMod int, newTesto varchar(511), modifier varchar(63))
begin
	if (select IDRecensione from recensione where IDRecensione = IDRecToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a review with the ID passed";
    else
		if (select IDRecensione from recensione where IDRecensione = IDRecToMod and refUtente = modifier)
			then
			update recensione set testo = newTesto where IDRecensione = IDRecToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to modify the review is not the same who insert him";
		end if;
	end if;
end$$