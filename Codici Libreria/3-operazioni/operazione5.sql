#Estrazione elenco delle pubblicazioni inserite da un utente.

use catalogo; 
delimiter $$

create procedure estrazionePU (in mailEPU varchar(63))
select titolo from utente join pubblicazione where (mailEPU = mail) && utente.mail = pubblicazione.commituser order by titolo $$
