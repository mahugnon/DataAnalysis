"
Abstract class for queries that run on a collection of tickets and return a collection of tickets 

It has only one method: 
  runOn: aCollectionOfTickets
"
Class {
	#name : #CIMQueryOnTickets,
	#superclass : #Object,
	#instVars : [
		'tickets'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'initailize-release' }
CIMQueryOnTickets class >> create: tickets [
	^ self new
		tickets: (tickets select: [ :ticket | ticket priorite = self displayName ])
]

{ #category : #accessing }
CIMQueryOnTickets class >> displayName [
	^ self subclassResponsibility
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
