#Estrazione elenco delle pubblicazioni per le quali è disponibile un
#download

use catalogo;
delimiter $$

create procedure pubblizazione_bydownload() 
select titolo from pubblicazione where disponibilitàDownload = true;
