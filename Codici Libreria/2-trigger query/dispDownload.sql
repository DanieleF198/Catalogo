#Trigger che, quando viene inserita una sorgente download ad una data pubblicazione, allora aggiorna l'attribbuto "disponibilitàDownload" in pubblicazione a true

use catalogo;
delimiter $$

create trigger triggerDownload after insert on sorgente for each row
begin
declare disp boolean;
	if new.tipo = 'download'
    then
		select disponibilitàDownload into @disp from pubblicazione, sorgente where pubblicazione.ISBN = new.refPubblicazione limit 1;
        if @disp = false
        then
			update pubblicazione
            set disponibilitàDownload = true
            where pubblicazione.ISBN = new.refPubblicazione;
		end if;
	end if;
end$$
