#In utente, l’attributo “collaborazione” diventerà “Sì” quando l’utente avrà svolto
#un numero n di inserimenti di pubblicazioni nel database; una volta assunto
#questo stato non verrà più perso.

use catalogo; 

delimiter $$

create trigger triggerCollaborazione after insert on pubblicazione for each row
begin
       declare numero int;
	   select count(*) into numero from pubblicazione where commitUser = new.commitUser ;
       
       if(numero >= 10)
       then 
       update utente 
       set collaborazione = 1 
       where mail = new.commitUser ;
	end if;
end$$

