Class {
	#name : #CIMBibliotheque,
	#superclass : #Object,
	#instVars : [
		'nom',
		'loc',
		'numberOfBug',
		'numberOfEvolution',
		'tickets',
		'grangerResultHolder'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #accessing }
CIMBibliotheque >> bestGranger [
	^ grangerResultHolder bestGranger
]

{ #category : #utilities }
CIMBibliotheque >> bugProportion: totalBugs [
	^(( numberOfBug / totalBugs) * 100) printShowingDecimalPlaces: 3
]

{ #category : #'as yet unclassified' }
CIMBibliotheque >> changeTicketBibloNom [
	tickets do: [ :each | each biblioNom: self nom ]
]

{ #category : #utilities }
CIMBibliotheque >> drawEvolutionBugGraph [
	EvolutionBugPresenter new
		exportEvolutionCorrectionPerYearForTickets: tickets title: nom;
		exportEvolutionCorrectionPerMonthForTickets: tickets title: nom
]

{ #category : #utilities }
CIMBibliotheque >> evolutionProportion: totalEvolution [
	^ ((numberOfBug / totalEvolution) * 100) 	printShowingDecimalPlaces: 3
]

{ #category : #printing }
CIMBibliotheque >> exportGrangerResultOn: aStream [
	nom printOnFile: aStream.
	aStream nextPut: $,.
	grangerResultHolder printResultOn: aStream
]

{ #category : #initialization }
CIMBibliotheque >> initialize [
	super initialize.
	grangerResultHolder := CIMGrangerResult new
]

{ #category : #accessing }
CIMBibliotheque >> loc [
	^ loc
]

{ #category : #accessing }
CIMBibliotheque >> loc: anObject [
	loc := anObject
]

{ #category : #accessing }
CIMBibliotheque >> nom [
	^ nom
]

{ #category : #accessing }
CIMBibliotheque >> nom: anObject [
	nom := anObject
]

{ #category : #accessing }
CIMBibliotheque >> numberOfBug [
	^ numberOfBug
]

{ #category : #accessing }
CIMBibliotheque >> numberOfBug: anObject [
	numberOfBug := anObject
]

{ #category : #accessing }
CIMBibliotheque >> numberOfEvolution [
	^ numberOfEvolution
]

{ #category : #accessing }
CIMBibliotheque >> numberOfEvolution: anObject [
	numberOfEvolution := anObject
]

{ #category : #printing }
CIMBibliotheque >> printOnFile: aStream [
	^ aStream
		setToEnd;
		nextPutAll: nom;
		nextPut: $,;
		nextPutAll: loc asString;
		nextPut: $,;
		nextPutAll: numberOfBug asString;
		nextPut: $,;
		nextPutAll: numberOfEvolution asString;
		nextPut: Character cr
]

{ #category : #utilities }
CIMBibliotheque >> saveGrangerResultWith: grangerResultFile forLag: anInteger [
	^ grangerResultHolder
		saveGrangerResultWith: grangerResultFile
		forLag: anInteger
]

{ #category : #accessing }
CIMBibliotheque >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMBibliotheque >> tickets: aCollection [
	tickets := aCollection
]

{ #category : #api }
CIMBibliotheque >> updateWith: aDictionary [
	nom := aDictionary at: 'bib'.
	loc := aDictionary at: 'loc'
]
