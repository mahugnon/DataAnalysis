Class {
	#name : #CIMBibliothequeBase,
	#superclass : #CIMBase,
	#instVars : [
		'bibiotheques',
		'printer'
	],
	#category : #'PBDataAnalyse-Core'
}

{ #category : #'as yet unclassified' }
CIMBibliothequeBase >> addBibiothequeWith: aDictionary [
	bibiotheques add: (CIMBibliotheque new updateWith: aDictionary)
]

{ #category : #initialization }
CIMBibliothequeBase >> initialize [
	super initialize.
	bibiotheques := OrderedCollection new.
	
]

{ #category : #'as yet unclassified' }
CIMBibliothequeBase >> loadBiothequesFromFilename: aFileName [
	(self loadCSV: aFileName)
		do: [ :each | self addBibiothequeWith: each ]
]

{ #category : #accessing }
CIMBibliothequeBase >> printer: aStream [
	printer := aStream
]

{ #category : #'as yet unclassified' }
CIMBibliothequeBase >> saveBibliothqueNames: aCollection in: aPath [
	| stream |
	stream := aPath asFileReference.
	aCollection
		do: [ :each | 
			stream
				writeStreamDo: [ :aStream | 
					aStream setToEnd.
					each printOn: aStream.
					aStream nextPut: Character cr ] ]
]

{ #category : #'as yet unclassified' }
CIMBibliothequeBase >> searchBiblioNamed: aString [
	^ (bibiotheques
		select: [ :bibotheque | bibotheque nom asLowercase = aString asLowercase ])
		anyOne
]

{ #category : #'as yet unclassified' }
CIMBibliothequeBase >> updateBiblioNamed: aString bug: aNumber1 evolution: aNumber2 [
	| biblio |
	biblio := self searchBiblioNamed: aString.
	biblio ifNil: [ ^ self ].
	biblio
		numberOfBug: aNumber1;
		numberOfEvolution: aNumber2;
		printOn: printer
]
