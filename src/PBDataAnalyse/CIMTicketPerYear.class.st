Class {
	#name : #CIMTicketPerYear,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMTicketPerYear >> runOn: aCollection [
	| tmp |
	tmp := aCollection groupedBy: [ :ticket | ticket year ].
	^ (tmp associations sorted: [ :a :b | a key <= b key ])
		asOrderedDictionary
]
