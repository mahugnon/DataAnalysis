Class {
	#name : #CIMQueryMisc,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryMisc >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isMisc ]
]
