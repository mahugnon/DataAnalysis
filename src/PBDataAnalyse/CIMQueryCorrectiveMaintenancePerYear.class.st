Class {
	#name : #CIMQueryCorrectiveMaintenancePerYear,
	#superclass : #CIMQueryBinaryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryCorrectiveMaintenancePerYear >> runOn: aCollection [
	^ CIMTicketPerYear new
		runOn: (CIMQueryCorrectiveMaintenance new runOn: aCollection)
]
