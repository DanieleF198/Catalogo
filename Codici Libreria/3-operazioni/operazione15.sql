#Operazione 15: Estrazione log delle modifiche effettuare su una pubblicazione
use catalogo;

delimiter $$

create procedure estrazione_log_pubblicazione(in newISBN char(13))
select IDStorico , time_stamp , descrizione, refUtente from Storico where refPubblicazione = newISBN; $$