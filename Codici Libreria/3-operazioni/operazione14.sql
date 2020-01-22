#Estrazione elenco delle recensioni approvate per una pubblicazione.

use catalogo;

delimiter $$

create procedure estrazione_recensioni_inattesa ()
begin
   select IDRecensione , testo from recensione where approvazione = 'in attesa';
end$$