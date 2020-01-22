use catalogo;

delimiter $$

create procedure utenti_collaborativi ()
select mail from utente where collaborazione = true ; $$
