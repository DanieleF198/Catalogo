#Estrazione catalogo, cioè elenco di tutte le pubblicazioni con titolo, autori,
#editore e anno di pubblicazione, ordinato per titolo.

use catalogo;

delimiter $$

create procedure estrazione_catalogo ()
begin
select titolo,group_concat(autore) as ListaAutori,editore,dataPubblicazione from pubblicazione join Autori where ISBN = refPubblicazione group by ISBN order by titolo;
end$$
            