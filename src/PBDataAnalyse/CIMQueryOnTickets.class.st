"
Abstract class for queries that run on a collection of tickets and return a collection of tickets 

It has only one method: 
  runOn: aCollectionOfTickets
"
Class {
	#name : #CIMQueryOnTickets,
	#superclass : #Object,
	#instVars : [
		'tickets',
		'countBibliothequeOccurrence'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'initailize-release' }
CIMQueryOnTickets class >> create [
	^ self new
		tickets:
			(CIMTicketBase uniqueInstance  tickets
				select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #'initailize-release' }
CIMQueryOnTickets class >> create: tickets [
	^ self new
		tickets: (tickets select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #accessing }
CIMQueryOnTickets class >> displayName [
	^ self subclassResponsibility
]

{ #category : #queries }
CIMQueryOnTickets >> biblioOccurenceUpperTo: aNumber [
	^ self countBibliothequeOccurrence
		select: [ :each | each >= aNumber ]
]

{ #category : #queries }
CIMQueryOnTickets >> bibliotheques [
	^ (tickets collect: [ :ticket | ticket biblioNom ]) asSet
]

{ #category : #queries }
CIMQueryOnTickets >> countBibliothequeOccurrence [
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

{ #category : #running }
CIMQueryOnTickets >> runOn: aCollection [
	self subclassResponsibility
]

{ #category : #accessing }
CIMQueryOnTickets >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMQueryOnTickets >> tickets: anObject [
	tickets := anObject
]
