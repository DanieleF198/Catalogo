#Operazione 19: Estrazione pubblicazioni approvate
use catalogo;

delimiter $$

create procedure estrazione_pubblicazioni_approvate ()
select titolo,ISBN from pubblicazione where approvazione = 'accettata';$$