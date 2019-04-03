"
Abstract class for queries that run on a collection of tickets and return a collection of tickets 

It has only one method: 
  runOn: aCollectionOfTickets
"
Class {
	#name : #CIMQueryOnTickets,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #accessing }
CIMQueryOnTickets class >> displayName [
	^ self subclassResponsibility
]

{ #category : #running }
CIMQueryOnTickets >> runOn: aCollection [
	self subclassResponsibility
]
