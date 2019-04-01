Class {
	#name : #CIMQuery,
	#superclass : #Object,
	#instVars : [
		'tickets',
		'countBibliothequeOccurrence'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'initailize-release' }
CIMQuery class >> create [
	^ self new
		tickets:
			(CIMPBAnalyser uniqueInstance  tickets
				select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #'initailize-release' }
CIMQuery class >> create: tickets [
	^ self new
		tickets: (tickets select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #accessing }
CIMQuery class >> displayName [
	^ self subclassResponsibility
]

{ #category : #queries }
CIMQuery >> biblioOccurenceUpperTo: aNumber [
	^ self countBibliothequeOccurrence
		select: [ :each | each >= aNumber ]
]

{ #category : #queries }
CIMQuery >> bibliotheques [
	^ (tickets collect: [ :ticket | ticket biblioNom ]) asSet
]

{ #category : #queries }
CIMQuery >> countBibliothequeOccurrence [
	countBibliothequeOccurrence
		ifNotNil: [ ^ countBibliothequeOccurrence associations ].
	countBibliothequeOccurrence := Dictionary new.
	self bibliotheques
		do: [ :bib | 
			countBibliothequeOccurrence
				at: bib
				put: (tickets count: [ :ticket | ticket biblioNom = bib ]) ].
	^ countBibliothequeOccurrence
]

{ #category : #accessing }
CIMQuery >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMQuery >> tickets: anObject [
	tickets := anObject
]
