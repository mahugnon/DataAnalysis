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
			(CIMPBAnalylizer Tickets tickets
				select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #'initailize-release' }
CIMQuery class >> create: tickets [
	^ self new
		tickets:
			(tickets select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #accessing }
CIMQuery class >> displayName [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CIMQuery >> bibliotheques [
	^ (tickets collect: [ :ticket | ticket biblioNom ]) asSet
]

{ #category : #'as yet unclassified' }
CIMQuery >> countBibliothequeOccurrence [
	^ countBibliothequeOccurrence
		ifNil: [ countBibliothequeOccurrence := Dictionary new.
			self bibliotheques
				do: [ :bib | 
					countBibliothequeOccurrence
						at: bib
						put: (tickets count: [ :ticket | ticket biblioNom = bib ]) ] ]
]

{ #category : #accessing }
CIMQuery >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMQuery >> tickets: anObject [
	tickets := anObject
]
