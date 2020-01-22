#Trigger che quando viene inserita una pubblicazione nel database allora aggiorna la tabella degli inserimenti con la relativa pubblicazione, chi l'ha inserita e la data dell'inserimento.

use catalogo;
delimiter $$

create trigger insertTableTrigger after insert on pubblicazione for each row
begin
	if new.commitUser is null
    then
		signal sqlstate '45000'
        set message_text = "A publication need a commit user to be insert into the database";
	else
    insert into inserisce (ISBNInserisce,mailInserente, dataInserimento) values
    (new.ISBN, new.commitUser, current_timestamp);
    end if;
end$$