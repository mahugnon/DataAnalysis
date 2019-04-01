Class {
	#name : #CIMPBAnalyser,
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

{ #category : #accessing }
CIMPBAnalyser class >> default [
	^ self uniqueInstance
]

{ #category : #'instance creation' }
CIMPBAnalyser class >> uniqueInstance [
	UniqueInstance ifNil: [ UniqueInstance := self basicNew loadTickets ].
	^ UniqueInstance
]

{ #category : #adding }
CIMPBAnalyser >> addTicketsWith:aDictionnary [
tickets add: (CIMTicket createWith:aDictionnary).
]

{ #category : #initialization }
CIMPBAnalyser >> loadTickets [
	tickets := OrderedCollection new.
	(CSVParser parseFileWithHeader: 'ticketsCIM.csv')
		do: [ :each | self addTicketsWith: each ]
]

{ #category : #acessing }
CIMPBAnalyser >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMPBAnalyser >> tickets: anObject [
	tickets := anObject
]

{ #category : #'as yet unclassified' }
CIMPBAnalyser >> ticketsFrom: aYear [
	^ tickets select: [ :ticket | ticket year >= aYear ]
]
