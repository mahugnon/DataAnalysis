Class {
	#name : #CIMQueryCorrelationBugCorrectiveMisc,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryCorrelationBugCorrectiveMisc >> runOn: aCollection [
	^ {('bugs'
		-> (CIMQueryCorrectiveMaintenance new runOn: aCollection) size).
	('correction' -> (CIMQueryEvolution new runOn: aCollection) size).
	('misc' -> (CIMQueryMisc new runOn: aCollection) size)}
]
