#Estrazione dati completi di una pubblicazione specifica dato il suo ID.
# problema lista 
use catalogo;
delimiter $$

create procedure estrazione_byISBN (in eISBN char(13))
select titolo , group_concat(distinct autore) as ListaAutori,editore,lingua,dataPubblicazione,n°pagine,group_concat(distinct chiave) as Chiavi ,disponibilitàDownload,n°mipiace,approvazione , max(Nristampa) as NumeroTotaleRistampe ,group_concat(distinct data_ristampa) as DataVarieRistampe from pubblicazione join chiavi join ristampa join Autori  where eISBN = ISBN && eISBN = ristampa.refPubblicazione && eISBN = Autori.refPubblicazione && eISBN = chiavi.refPubblicazione group by ISBN $$


#select titolo , group_concat(distinct autore) as ListaAutori,editore,lingua,dataPubblicazione,n°pagine,group_concat(chiave) as Chiavi ,disponibilitàDownload,n°mipiace,approvazione from pubblicazione join chiavi join Autori  where eISBN = ISBN && eISBN = Autori.refPubblicazione && eISBN = chiavi.refPubblicazione group by ISBN $$