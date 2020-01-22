use catalogo;
delimiter $$

create trigger triggerNoDupAuthor before insert on autori for each row
begin
	if (select refPubblicazione from Autori where refPubblicazione = new.refPubblicazione and autore = new.autore) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical author for the same publication";
    end if;
end$$