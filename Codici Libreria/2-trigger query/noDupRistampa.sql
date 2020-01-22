use catalogo;
delimiter $$

create trigger triggerNoDupReprint before insert on ristampa for each row
begin
	if (select refPubblicazione from ristampa where refPubblicazione = new.refPubblicazione and Nristampa = new.Nristampa) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical reprint for the same publication (NOTE: even with different dates)";
    end if;
end$$