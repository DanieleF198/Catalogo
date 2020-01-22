# Trigger che non permette di modificare un like (se un utente ha messo like al più lo toglie, non lo modifica)

use catalogo;
delimiter $$


create trigger triggerLikeUPD before update on mipiace for each row
begin
signal sqlstate '45000'
set message_text = "Cannot modify a like!";
end$$