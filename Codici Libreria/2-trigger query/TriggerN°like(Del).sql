# Trigger che, in caso viene tolto un like ad una pubblicazione, aggiorna opportunamente il contatore

use catalogo;
delimiter $$

create trigger triggerDelLike before delete on mipiace for each row
begin
update pubblicazione
set n°miPiace = n°miPiace -1
where pubblicazione.isbn = old.refPubblicazione;
insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
values (current_timestamp, concat('Rimozione mi piace alla pubblicazione ', old.refPubblicazione, ' inserito da ', old.refUtente), old.refPubblicazione, old.refUtente);
end$$