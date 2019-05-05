Class {
	#name : #CIMBibliothequeBase,
	#superclass : #CIMBase,
	#instVars : [
		'bibliotheques'
	],
	#category : #'PBDataAnalyse-Core'
}

{ #category : #utilities }
CIMBibliothequeBase >> addBibiothequeWith: aDictionary [
	bibliotheques add: (CIMBibliotheque new updateWith: aDictionary)
]

{ #category : #acccessing }
CIMBibliothequeBase >> bibliotheques [
	^ bibliotheques
]

{ #category : #utilities }
CIMBibliothequeBase >> createBibliothequesIn: aFolder from: aTicketCollection [
	bibliotheques := ((self loadBiothequesFromNamesFolder: aFolder)
		collect: [ :each | 
			CIMBibliotheque new
				nom: ('cwm_' , each key copyReplaceAll: '.csv' with: '');
				tickets:
					(CIMQueryBibliothequeNames new
						runOn: aTicketCollection 
						names: each value);
				yourself ]) asOrderedCollection
]

{ #category : #utilities }
CIMBibliothequeBase >> drawEvolutionBugGraph [
bibliotheques ifEmpty: [ ^self ].
bibliotheques do: [ :each| each drawEvolutionBugGraph ]
]

{ #category : #initialization }
CIMBibliothequeBase >> initialize [
	super initialize.
	bibliotheques := OrderedCollection new.
	
]

{ #category : #utilities }
CIMBibliothequeBase >> loadBiothequesFromFilename: aFileName [
	(self loadCSV: aFileName)
		do: [ :each | self addBibiothequeWith: each ]
]

{ #category : #utilities }
CIMBibliothequeBase >> loadBiothequesFromNamesFolder: aFolder [
	^ aFolder asFileReference visibleFiles
		collect: [ :aFile | 
			aFile basename
				->
					((CSVParser parseFileWithHeader: aFile)
						collectAsSet: [ :each | each at: 'bib' ]) ]
]

{ #category : #'API-accessing' }
CIMBibliothequeBase >> mergeBaseWith: aBibBase1 [
	"This method is very specific."

	bibliotheques ifEmpty: [ ^ self ].
	bibliotheques
		do: [ :aBib | 
			| aBibBase1Bib |
			aBibBase1Bib := aBibBase1 searchBiblioNamed: aBib nom.
			aBib loc: aBibBase1Bib loc.
			aBib
				numberOfBug: (CIMQueryCorrectiveMaintenance new runOn: aBib tickets) size;
				numberOfEvolution: (CIMQueryEvolution new runOn: aBib tickets) size ].
	self sort
]

{ #category : #printing }
CIMBibliothequeBase >> printOn: aFileReference [
	| aStream file |
	file := aFileReference asFileReference.
	file
		writeStreamDo: [ :stream | 
			stream
				nextPutAll: 'NomBib';
				nextPut: $,;
				nextPutAll: 'word count';
				nextPut: $,;
				nextPutAll: 'Bugs';
				nextPut: $,;
				nextPutAll: 'Evolution';
				nextPut: Character cr ].
	aStream := file writeStream.
	bibliotheques
		ifNotEmpty: [ bibliotheques do: [ :each | each printOn: aStream ] ]
]

{ #category : #utilities }
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
CIMBibliothequeBase >> saveGrangerResultsFrom: grangerResultsFolder [
	grangerResultsFolder asFileReference
]

{ #category : #utilities }
CIMBibliothequeBase >> searchBiblioNamed: aString [
	^ (bibliotheques
		select: [ :bibotheque | bibotheque nom asLowercase = aString asLowercase ])
		anyOne
]

{ #category : #sorting }
CIMBibliothequeBase >> sort [
	self bibliotheques sort: [ :a :b | a nom < b nom ]
]

{ #category : #utilities }
CIMBibliothequeBase >> updateBiblioNamed: aString bug: aNumber1 evolution: aNumber2 [
	| biblio |
	biblio := self searchBiblioNamed: aString.
	biblio ifNil: [ ^ self ].
	biblio
		numberOfBug: aNumber1;
		numberOfEvolution: aNumber2.
]
