Class {
	#name : #CIMOccurenceQuery,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #queries }
CIMOccurenceQuery >> biblioOccurenceUpperTo: aNumber [
	^ self countBibliothequeOccurrence
		select: [ :each | each >= aNumber ]
]

{ #category : #'as yet unclassified' }
CIMOccurenceQuery >> runOn: aTicketCollection bibliotheques: aCollection [
	^ aCollection
		inject: Dictionary new
		into: [ :bib :dic | 
			dic
				at: bib
				put: (aTicketCollection count: [ :ticket | ticket biblioNom = bib ]) ]
]
