Class {
	#name : #CIMTicketBase,
	#superclass : #CIMBase,
	#instVars : [
		'tickets'
	],
	#classVars : [
		'Tickets'
	],
	#classInstVars : [
		'UniqueInstance'
	],
	#category : #'PBDataAnalyse-Core'
}

{ #category : #adding }
CIMTicketBase >> addTicketsWith:aDictionnary [
tickets add: (CIMTicket createWith:aDictionnary).
]

{ #category : #'as yet unclassified' }
CIMTicketBase >> bibliothequesWithManyTickets [
	^ ((self tickets collect: #biblioNom) asBag sortedCounts select: [ :a | a key > 1000 ])
		collect: #value
]

{ #category : #'as yet unclassified' }
CIMTicketBase >> evolutionCorrectionPerYearForBibliotheque: aBiblioName [
	^self
		evolutionCorrectionPerYearForTickets:
			(CIMQueryBibliotheque new
				queryName: aBiblioName;
				runOn: self tickets)
				title: aBiblioName.
]

{ #category : #initialization }
CIMTicketBase >> loadTickets [
	^ self
		loadTicketsFromFilename:
			(CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles/ticketsCIM.csv'
]

{ #category : #initialization }
CIMTicketBase >> loadTicketsFromFilename: aFileName [
	tickets := OrderedCollection new.
	(self loadCSV: aFileName)
		do: [ :each | self addTicketsWith: each ].
	^ tickets
]

{ #category : #acessing }
CIMTicketBase >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMTicketBase >> tickets: anObject [
	tickets := anObject
]

{ #category : #'as yet unclassified' }
CIMTicketBase >> ticketsFrom: aYear [
	^ tickets select: [ :ticket | ticket year >= aYear ]
]
