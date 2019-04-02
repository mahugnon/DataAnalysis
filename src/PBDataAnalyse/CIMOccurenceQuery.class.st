Class {
	#name : #CIMOccurenceQuery,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMOccurenceQuery >> runOn: aTicketCollection bibliotheques: aCollection [
	| result |
	result := Dictionary new.
	aCollection
		do: [ :bib | 
			result
				at: bib
				put: (aTicketCollection count: [ :ticket | ticket biblioNom = bib ]) ].
	^ result
]
