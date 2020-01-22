#Operazione 20: Estrazione catalogo pubblicazioni in attesa di approvazione
use catalogo;

delimiter $$

create procedure estrazione_pubblicazioni_nonapprovate ()
select titolo,ISBN from pubblicazione where approvazione = 'in attesa';$$