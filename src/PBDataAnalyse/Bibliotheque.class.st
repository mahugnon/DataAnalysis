"
I want to know for a specific biblioNom  the number of important, urgent,tres important debugage or evolution per year .
"
Class {
	#name : #Bibliotheque,
	#superclass : #Object,
	#instVars : [
		'biblioNom'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #accessing }
Bibliotheque >> biblioNom [
	^ biblioNom
]

{ #category : #accessing }
Bibliotheque >> biblioNom: aString [
	biblioNom := aString
]

{ #category : #metrics }
Bibliotheque >> numberOfAnomaliePerYear [
]

{ #category : #metrics }
Bibliotheque >> numberOfEvolutionPerYear [
]

{ #category : #metrics }
Bibliotheque >> numberOfImportantPerYear [
]

{ #category : #metrics }
Bibliotheque >> numberOfTresImportantPerYear [
]

{ #category : #metrics }
Bibliotheque >> numberOfUrgentPerYear [
	| tickets cimUrgent bibTickets |
	tickets := CIMTicketBase default ticketsFrom: 2003.
	cimUrgent := CIMQueryUrgent create: tickets.
	bibTickets := cimUrgent tickets
		select: [ :ticket | ticket biblioNom = biblioNom ].
	^ (CIMTicketPerYear create: bibTickets) ticketsCountPerYear
]

{ #category : #metrics }
Bibliotheque >> numberOfUrgentPerYear: aTicketCollection [
	^ (CIMTicketPerYear create: ((CIMQueryUrgent create: aTicketCollection) tickets)) ticketsCountPerYear
]
