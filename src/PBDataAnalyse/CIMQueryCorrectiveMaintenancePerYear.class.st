Class {
	#name : #CIMQueryCorrectiveMaintenancePerYear,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryCorrectiveMaintenancePerYear >> runOn: aCollection [
	^ CIMTicketPerYear new
		runOn: (CIMQueryCorrectiveMaintenance new runOn: aCollection)
]
