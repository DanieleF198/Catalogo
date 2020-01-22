use catalogo;
delimiter $$

create trigger triggerNoDupKey before insert on chiavi for each row
begin
	if (select refPubblicazione from chiavi where refPubblicazione = new.refPubblicazione and chiave = new.chiave) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical keys for the same publication";
    end if;
end$$