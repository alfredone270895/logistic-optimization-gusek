/*
Questo esercizio è la massimizzazione dello spazio espresso in metri lineari di un container 40' Open Top espresso in Metri
*/

param n;				#Numero di righe
set N :=1..n;			#Insieme dei colli 
param LDM{N};			#Metri lineari occupati dal collo
param LDMTotal;			#Metri linerai totali di un container 40' Open top 

#VARIABILI
#var x {N} >=0;			#Quantita continua di colli
#var x {N} >=0,integer;		#Quantita discreta di colli indivisibili
var x {N} binary;

#VINCOLI
#Vincolo di capacità
subject to LinearMeters:
sum {i in N} LDM[i] * x[i]<=LDMTotal;

#OBBIETTIVO
#Massimizzare metri lineari occupati complessivamente
maximize z: sum {i in N} LDM[i] * x[i];


data;

#Numero totale di colli
param n:=10;

#Inizializzazione dei valori dei metri lineari di ogni collo 
param: 		LDM :=
		1	0.4
		2	1.2
		3	0.4 
		4	0.8
		5	0.7
		6	0.8
		7	1.6
		8	2.4
		9	6.2
		10	5.6;

param LDMTotal := 12.02; #Metri lineari totali di un container open top 40'


end;
