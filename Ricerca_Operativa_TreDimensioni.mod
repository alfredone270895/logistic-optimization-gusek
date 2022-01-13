/*
Questo esercizio è la massimizzazione dello spazio espresso in tre dimension di un trailer standard che ha le seguenti dimensioni: Height=270 (cm) Length=1360 (cm) Depth=248 (cm) 
*/
#DATI
param n;					#Numero di righe
set Collies :=1..n;			#Insieme dei colli 
param h{Collies};			#Altezza occupata dal collo
param l{Collies};			#Lunghezza occupata dal collo
param d{Collies};			#Larghezza occupata dal collo

param hTotal;				#Altezza disponibile 
param lTotal;				#Lunghezza disponibile 
param dTotal;				#Profondità disponibile 


#VARIABILI
#1 caso uno nel continuo
#var x{N}>=0; 
#var y{N}>=0;
#var z{N}>=0;
#2 caso due nel discreto
#var x{N}>=0 integer;
#var y{N}>=0 integer;
#var z{N}>=0 integer;
#3 caso tre nel discreto con variabile binaria
var x{Collies} binary;		#posizione x del collo (lunghezza)
var y{Collies} binary;		#Posizione y del collo (altezza)
var z{Collies} binary;		#Posizione z del collo (profonditò)

#Distanze tra due colli
var a{Collies,Collies};

#VINCOLI

#Vincolo di massima lunghezza
subject to MaxLength:
sum {i in Collies,j in Collies} l[i] * x[i]<=lTotal;

#Vincolo di massima altezza
subject to MaxHeight:
sum {i in Collies} h[i] * x[i]<=hTotal;

#Vincolo di massima profondità
subject to MaxDepth:
sum {i in Collies} d[i] * x[i]<=dTotal;

#Vincolo sul posizionamento del collo successivo in lunghezza
subject to positioningLength {i in Collies ,j in Collies: i<>j}:
x[j]+l[j] <= x[i]+ (a[i,j]); 

#Vincolo sul posizionamento del collo precendente in lunghezza
subject to positioningLength2 {i in Collies ,j in Collies: i<>j}:
x[i]+l[i] <= x[j]+ (1-a[i,j]);

#Vincolo sul posizionamento del collo successivo in profondità
subject to positioningDepth {i in Collies ,j in Collies: i<>j}:
x[j]+d[j] <= x[i]+ (a[i,j]); 

#Vincolo sul posizionamento del collo precedente in profondità
subject to positioningDepth2 {i in Collies ,j in Collies: i<>j}:
x[i]+d[i] <= x[j]+ (1-a[i,j]);

#Vincolo sul posizionamento del collo successivo in altezza
subject to positioningHeight {i in Collies ,j in Collies: i<>j}:
x[j]+h[j] <= x[i]+ (a[i,j]); 

#Vincolo sul posizionamento del collo precedente in altezza
subject to positioningHeight2 {i in Collies ,j in Collies: i<>j}:
x[i]+h[i] <= x[j]+ (1-a[i,j]);


#OBBIETTIVO
#Minimizzazione dello spazio tra un collo e l'altro
minimize result: sum {i in Collies,j in Collies} a[i,j];


data;

#Numero dei colli
param n:=10;

#Parametro che inizializza valori delle dimensioni dei colli
param: 		h		l	d :=
		1	100		100	100
		2	120		120	80
		3	200		200	120
		4	210		300	100
		5	200		200	180
		6	100		300	246
		7	80		80	80
		8	30		30	30
		9	20		20	20
		10	40		25	25;

#Massima altezza del trailer
param hTotal := 270;
#Massima profondità del trailer
param dTotal := 248;
#Massiva lunghezza del trailer
param lTotal := 1360;


end;

