Class {
	#name : #CIMQueryPriority,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #accessing }
CIMQueryPriority >> displayName [
	self subclassResponsibility 
]

{ #category : #running }
CIMQueryPriority >> runOn: aTicketCollection [
	^aTicketCollection
		select: [ :ticket | ticket priorite = self displayName ]
]
