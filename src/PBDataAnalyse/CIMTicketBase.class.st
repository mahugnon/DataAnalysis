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
