Class {
	#name : #CIMQueryCorrectiveMaintenance,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryCorrectiveMaintenance >> runOn: aCollection [
	^ aCollection select: [ :ticket | ticket isCorrectiveMaintenace ]
]
