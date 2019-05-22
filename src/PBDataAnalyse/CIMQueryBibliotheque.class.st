Class {
	#name : #CIMQueryBibliotheque,
	#superclass : #Object,
	#instVars : [
		'queryName'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #accessing }
CIMQueryBibliotheque >> queryName [
	^ queryName
]

{ #category : #accessing }
CIMQueryBibliotheque >> queryName: anObject [
	queryName := anObject
]

{ #category : #'as yet unclassified' }
CIMQueryBibliotheque >> runOn: aTicketCollection [
	^ aTicketCollection select: [ :ticket | ticket biblioNom asLowercase = queryName asLowercase ]
]
