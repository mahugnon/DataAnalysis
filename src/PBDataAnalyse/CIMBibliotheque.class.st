Class {
	#name : #CIMBibliotheque,
	#superclass : #Object,
	#instVars : [
		'nom',
		'loc',
		'numberOfBug',
		'numberOfEvolution',
		'tickets'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #'as yet unclassified' }
CIMBibliotheque >> drawEvolutionBugGraph [
	^ EvolutionBugPresenter new
		drawEvolutionCorrectionPerYearForTickets: tickets
		title: nom
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
CIMBibliotheque >> printOn: aStream [
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
