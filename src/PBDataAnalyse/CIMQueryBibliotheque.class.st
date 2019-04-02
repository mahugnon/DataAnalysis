Class {
	#name : #CIMQueryBibliotheque,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMQueryBibliotheque >> runOn: aTicketCollection bibliotheque: aString [
	^ aTicketCollection
		select: [ :ticket | ticket biblioNom = aString ]
]
