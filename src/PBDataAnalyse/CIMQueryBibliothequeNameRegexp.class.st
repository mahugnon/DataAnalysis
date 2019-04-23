Class {
	#name : #CIMQueryBibliothequeNameRegexp,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #removing }
CIMQueryBibliothequeNameRegexp >> rejectFrom: aCollection metchesRegex: aString [
	^ aCollection
		reject:
			[ :ticket | ticket biblioNom asLowercase matchesRegex: aString ]
]

{ #category : #running }
CIMQueryBibliothequeNameRegexp >> runOn: aCollection [
	ShouldNotImplement signal: 'Use #runOn:keyword: instead'
]

{ #category : #running }
CIMQueryBibliothequeNameRegexp >> runOn: aCollection keyword: aString [
"I take regex string"
	^ aCollection
		select: [ :ticket | ticket biblioNom asLowercase matchesRegex: aString ]
]

{ #category : #running }
CIMQueryBibliothequeNameRegexp >> runOn: aCollection keyword: aString reject: keywordCollection [
"I take regex String"
	| tickets |
	tickets := self runOn: aCollection keyword: aString.
	keywordCollection
		do:
			[ :keyword | tickets := self rejectFrom: tickets metchesRegex: keyword ].
	^ tickets
]
