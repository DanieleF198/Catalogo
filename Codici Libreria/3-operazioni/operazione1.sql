# Modifica del livello di un utente (da attivo a passivo e viceversa).
#Tale operazione è intesa come operazione utilizzabile solo dai moderatori, quindi passiamo oltre la mail di chi passa da passaivo ad attivo (newMail)
#anche la mail di chi sta usando tale operazione, e controlliamo se è moderatore

use catalogo;

delimiter $$
create procedure cambio_di_stato (in newMail varchar(63), mailOperatore varchar(63))
begin 
if(select mail from utente where mail = mailOperatore and tipo = "moderatore") is not null
then
if(select stato = 'passivo' from utente where mail = newMail )
   then 
   update utente
   set stato = "attivo"
   where newMail = mail;
else
   update utente
   set stato = "passivo"
   where newMail = mail; 
end if;
else
signal sqlstate '45000'
set message_text = "the state of user cannot be modify by another final user";
end if;
end$$