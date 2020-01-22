#Trigger che non permette di inserire due capitoli con lo stesso numero in una stessa pubblicazione (ma sì con lo stesso titolo... anche se assurdo potrebbe esistere).

use catalogo;
delimiter $$


create trigger triggerIndice before insert on indice for each row
begin
	if (select refPubblicazione from indice where n°capitolo = new.n°capitolo and refPubblicazione = new.refPubblicazione) is not null
    then
		signal sqlstate '45000'
        set message_text = "chapter already exists";
    end if;
end$$