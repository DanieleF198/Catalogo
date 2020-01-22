#Calcolo numero dei like per una pubblicazione.
use catalogo;

delimiter $$

create procedure calcolo_numerolike(in nwpISBN char(13))
begin
select n°miPiace from pubblicazione where ISBN = nwpISBN;
end$$