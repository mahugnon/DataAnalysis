Class {
	#name : #CIMQueryBibliotheque,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMQueryBibliotheque >> runOn: aTicketCollection [
	^ (aTicketCollection collect: [ :ticket | ticket biblioNom ]) asSet
]
