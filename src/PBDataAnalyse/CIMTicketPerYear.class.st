Class {
	#name : #CIMTicketPerYear,
	#superclass : #CIMQuery,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'initailize-release' }
CIMTicketPerYear class >> create [
	^ self new tickets: CIMPBAnalyser Tickets tickets
]

{ #category : #'initailize-release' }
CIMTicketPerYear class >> create: tickets [
	^ self new tickets: tickets
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
CIMTicketPerYear >> ticketsGroupByYearFor: aBiblioNameString [
	self ticketsGroupByYear
		do: [ :each | each biblioNom = aBiblioNameString ]
]

{ #category : #'queries - methods' }
CIMTicketPerYear >> years [
	^ (tickets collect: [ :ticket | ticket ftDateCrea year ]) asSet
]
