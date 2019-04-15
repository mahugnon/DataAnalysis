Class {
	#name : #CIMQueryBibliothequeNameContainKeyword,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryBibliothequeNameContainKeyword >> runOn: aCollection keyword: aString [
	^ ((aCollection
		select: [ :ticket | ticket biblioNom matchesRegex: '.*' , aString , '.*' ])
		collect: [ :ticket | ticket biblioNom ]) asSet
]
