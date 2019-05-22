Class {
	#name : #CIMQueryEvolution,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryEvolution >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isEvolution ]
]
