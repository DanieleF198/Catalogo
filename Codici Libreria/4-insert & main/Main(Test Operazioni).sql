use catalogo;
#Operazione 1 : Modifica del livello di un utente (da attivo a passivo e viceversa).
call cambio_di_stato("rachel.green@gmail.com", "daniele.fossemo@gmail.com") ; #da passivo ad attivo
call cambio_di_stato("maria.defilippi@gmail.com", "daniele.fossemo@gmail.com") ;#da attivo a passivo 

#Operazione 2. Estrazione elenco delle ultime dieci pubblicazioni inserite.
call estrazione_ultime10_pubblicazioni_inserite;

#Operazione 3 :  Estrazione elenco delle pubblicazioni aggiornate di recente (ultimi 30 giorni).
call estrazione_pubblicazioni_aggiornate_30giorni();

#Operazione 4 : Estrazione elenco degli utenti più “collaborativi”.
call utenti_collaborativi();

#Operazione 5 : Estrazione elenco pubblicazioni inserite da un utente
call estrazionePU("francesco.totti@gmail.com");

#Operazione 6 : Estrazione catalogo 
call estrazione_catalogo();

#Operazione 7: Estrazione dati completi di una pubblicazione specifica dato il suo ID
call estrazione_byISBN("9788854187177");

#Operazione 8: Ricerca di pubblicazioni per ISBN, titolo, autore, e parole chiave.
call ricerca_pubblicazione("Divina");  #Ricerca Per Parola CHiave
call ricerca_pubblicazione("9788854165069"); #Ricerca Per ISBN
call ricerca_pubblicazione("Dante"); #Ricerca per Nome Autore
call ricerca_pubblicazione("Divina Commedia"); #Ricerca Per Titolo


#Operazione 9: Inserimento di una recensione relativa a una pubblicazione.
call inserimento_recensione("Bel libro,consigliato a tutti gli amanti del genere!","9788854165075","ross.geller@gmail.com");

#Operazione 10: Approvazione o di una recensione (da parte del moderatore).
call accettazione_recensione("3", "gianluca.rea@gmail.com");

#Operazione 11: Inserimento di un like relativo a una pubblicazione.
 call inserimento_mipiace("9788854165069","frank.sinatra@gmail.com");

#Operazione 12: Calcolo numero dei like per una pubblicazione
call calcolo_numerolike("9788854187177");

#Operazione 13 : Estrazione elenco delle recensioni approvate per una pubblicazione.
call estrazione_recensioni_approvate("9788854165069");

#Operazione 14 : Estrazione elenco delle recensioni in attesa di approvazione.
call estrazione_recensioni_inattesa;

#Operazione 15:  Estrazione log delle modifiche effettuare su una pubblicazione
call estrazione_log_pubblicazione("9788854181434");

#Operazione 16 : Estrazione delle pubblicazioni con la disponibilità di un download
call pubblizazione_bydownload ;

#Operazione 17: Estrazione della lista delle pubblicazioni in catalogo, ognuna con la data dell’ultima ristampa
call estrazione_pubblicazione_ultimaristampa();

#Operazione 18: Estrazione pubblicazioni dal catalogo aventi gli stessi autori
call estrazione_byautore("9788854187177");

#Operazione 19: Estrazione catalogo pubblicazioni approvate
call estrazione_pubblicazioni_approvate;

#Operazione 20: Estrazione catalogo pubblicazioni in attesa di approvazione
call estrazione_pubblicazioni_nonapprovate;

