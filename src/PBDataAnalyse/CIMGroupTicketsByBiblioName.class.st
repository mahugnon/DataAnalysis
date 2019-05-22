Class {
	#name : #CIMGroupTicketsByBiblioName,
	#superclass : #CIMGroupTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMGroupTicketsByBiblioName >> runOn: aCollection [
	^ aCollection groupedBy: [ :ticket | ticket biblioNom ]
]
