#Operazione 10: Approvazione o di una recensione (da parte del moderatore)
use catalogo;

delimiter $$

create procedure accettazione_recensione(in IDRec integer, mailMod varchar(63))
begin
if(select tipo = 'moderatore' from utente where mailMod = mail)
then
insert into moderatorer (IDRecensioneDaAccettare, approvato , mailModeratoreCheAccetta,tipoOperazione)  value (IDRec, 'accettata', mailMod, 'inserimento');
end if;
end$$