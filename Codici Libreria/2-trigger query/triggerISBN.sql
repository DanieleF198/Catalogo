#Trigger che si assicura che lo storico sia una sequenza di 13 cifre.

use catalogo;
delimiter $$


create trigger triggerISBN before insert on pubblicazione for each row
begin
	if new.ISBN like '[a-z]%' or new.ISBN like '%[a-z]'
    then
		signal sqlstate '45000' set message_text = 'invalid ISBN, ISBN can contain only number';
    end if;
    
	if new.ISBN not regexp '[0-9]{13,}'
    then
		signal sqlstate '45000' set message_text = 'invalid ISBN, ISBN can contain only number';
    end if;
end$$