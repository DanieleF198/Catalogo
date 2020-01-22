#Operazione 17 Estrazione della lista delle pubblicazioni in catalogo, ognuna con la data
#dell’ultima ristampa

use catalogo;

delimiter $$ 

create procedure estrazione_pubblicazione_ultimaristampa()
select ISBN , titolo , max(data_ristampa) as UltimaRistampa from pubblicazione join ristampa where ISBN = refPubblicazione group by refPubblicazione; $$ 




