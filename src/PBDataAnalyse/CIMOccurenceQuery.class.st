Class {
	#name : #CIMOccurenceQuery,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMOccurenceQuery >> runOn: aTicketCollection [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CIMOccurenceQuery >> runOn: aTicketCollection bibliotheques: aCollection [
	| result |
	result := Dictionary new.
	aCollection
		do: [ :bib | 
			result
				at: bib
				put: (aTicketCollection select: [ :ticket | ticket biblioNom = bib ]) size ].
	^ result
]
