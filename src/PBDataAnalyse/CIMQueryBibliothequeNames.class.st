Class {
	#name : #CIMQueryBibliothequeNames,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryBibliothequeNames >> runOn: aCollection [
	ShouldNotImplement signal: 'Use #runOn:names: instead'
]

{ #category : #running }
CIMQueryBibliothequeNames >> runOn: aTicketCollection names: aStringCollection [
	^ (aStringCollection
		collectAsSet:
			[ :bibNom | aTicketCollection select: [ :ticket | ticket biblioNom = bibNom ] ])
		flatten asSet
]
