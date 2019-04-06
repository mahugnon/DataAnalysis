Class {
	#name : #CIMTicketPerYear,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMTicketPerYear >> runOn: aCollection [
	| tmp |
	tmp := (aCollection groupedBy: [ :ticket | ticket year ]).
	^tmp associations sorted: [ :a :b | a key <= b key ]
]

{ #category : #'queries - methods' }
CIMTicketPerYear >> ticketsCountPerYear [
	| ticketsGroup |
	ticketsGroup := self ticketsGroupByYear.
	^ ticketsGroup
		keysDo: [ :year | ticketsGroup at: year put: (ticketsGroup at: year)size ]
]

{ #category : #'queries - methods' }
CIMTicketPerYear >> ticketsForYear: aYear [
	^ tickets select: [ :ticket | ticket ftDateCrea year = aYear ]
]

{ #category : #'queries - methods' }
CIMTicketPerYear >> ticketsGroupByYear [
	| ticketsGroup |
	ticketsGroup := Dictionary new.
	self years
		do: [ :year | ticketsGroup at: year put: (self ticketsForYear: year) ].
	^ ticketsGroup
]

{ #category : #'queries - methods' }
CIMTicketPerYear >> years [
	^ (tickets collect: [ :ticket | ticket ftDateCrea year ]) asSet
]
