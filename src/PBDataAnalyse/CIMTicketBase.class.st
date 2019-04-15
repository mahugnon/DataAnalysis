Class {
	#name : #CIMTicketBase,
	#superclass : #Object,
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
	| graph ticketsBiblio roassal |
	ticketsBiblio := CIMQueryBibliotheque new
		queryName: aBiblioName;
		runOn: self tickets.
	graph := PB2GraphsBlueRed new.
	graph maxY: 400.
	graph
		data1:
			((CIMTicketPerYear new
				runOn: (CIMQueryEvolution new runOn: ticketsBiblio))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	graph
		data2:
			((CIMTicketPerYear new
				runOn: (CIMQueryCorrectiveMaintenance new runOn: ticketsBiblio))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	roassal := graph draw.
	roassal title: aBiblioName.
	roassal axisY noDecimal.
	roassal open.
	^ roassal
]

{ #category : #initialization }
CIMTicketBase >> loadTickets [
	^self loadTicketsFromFilename: 'ticketsCIM.csv'
]

{ #category : #initialization }
CIMTicketBase >> loadTicketsFromFilename: aFileName [
	tickets := OrderedCollection new.
	(CSVParser parseFileWithHeader: aFileName)
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
