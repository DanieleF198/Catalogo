use catalogo;

alter table utente add constraint statOk check (stato in ('attivo', 'passivo'));
alter table utente add constraint tipOk check (tipo in ('finale', 'moderatore'));
alter table recensione add constraint approvOkR check (approvazione in ('in attesa', 'accettata', 'non accettata'));
alter table pubblicazione add constraint approvOkP check (approvazione in ('in attesa', 'accettata', 'non accettata'));
alter table moderatorer add constraint tipoOpOkR check (tipoOperazione in ('inserimento', 'modifica', 'cancellazione'));
alter table moderatorep add constraint tipoOpOkP check (tipoOperazione in ('inserimento', 'modifica', 'cancellazione'));
alter table moderatorep add constraint approvOkMP check (approvato in ('accettata', 'non accettata'));
alter table moderatorer add constraint approvOkMR check (approvato in ('accettata', 'non accettata'));