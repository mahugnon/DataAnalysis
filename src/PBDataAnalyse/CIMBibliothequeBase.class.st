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

{ #category : #utilities }
CIMBibliothequeBase >> bestGranger [
	^ bibliotheques collect: [ :bib | bib nom -> bib bestGranger ]
]

{ #category : #acccessing }
CIMBibliothequeBase >> bibliotheques [
	^ bibliotheques
]

{ #category : #utilities }
CIMBibliothequeBase >> bugSEvolutionsProportion [
	^ bibliotheques
		collect: [ :bib | 
			bib nom
				->
					{('bugsProportion' -> (bib bugProportion: self totalBugs)).
					('EvolutionProportion'
						-> (bib evolutionProportion: self totalEvolution))} ]
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

{ #category : #exporting }
CIMBibliothequeBase >> exportAprioriDataSetOn: aFile with: anAssociation [
	| file |
	file := aFile asFileReference.
	file
		writeStreamDo: [ :aStream | 
			'ID' printOn: aStream.
			aStream nextPut: $,.
			'BibGroup' printOn: aStream.
			aStream nextPut: Character cr ].
	anAssociation
		do: [ :each | 
			| group |
			group := $, join: (each value collect: [ :v | v biblioNom ]).
			^ file
				writeStreamDo: [ :aStream | 
					aStream
						setToEnd;
						nextPutAll: each key;
						nextPut: $,;
						nextPut: $';
						nextPutAll: group;
						nextPut: $';
						nextPut: Character cr ] ]
]

{ #category : #exporting }
CIMBibliothequeBase >> exportGrangerResultOn: aFile [
	aFile asFileReference
		writeStreamDo: [ :aStream | 
			aStream
				nextPutAll: 'Biblio name';
				nextPut: $,;
				nextPutAll: 'Lag1';
				nextPut: $,;
				nextPutAll: 'Lag2';
				nextPut: $,;
				nextPutAll: 'Lag3';
				nextPut: $,;
				nextPutAll: 'Lag4';
				nextPut: $,;
				nextPutAll: 'Lag5';
				nextPut: $,;
				nextPutAll: 'Lag6';
				nextPut: $,;
				nextPutAll: 'Lag7';
				nextPut: $,;
				nextPutAll: 'Lag8';
				nextPut: $,;
				nextPutAll: 'Lag9';
				nextPut: $,;
				nextPutAll: 'Lag10';
				nextPut: $,;
				nextPutAll: 'Lag11';
				nextPut: $,;
				nextPutAll: 'Lag12';
				nextPut: Character cr.
			bibliotheques
				do: [ :bib | 
					bib exportGrangerResultOn: aStream.
					aStream nextPut: Character cr ] ]
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

{ #category : #exporting }
CIMBibliothequeBase >> printOnFile: aFileReference [
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
		ifNotEmpty: [ bibliotheques do: [ :each | each printOnFile: aStream ] ]
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
					each printOnFile: aStream.
					aStream nextPut: Character cr ] ]
]

{ #category : #utilities }
CIMBibliothequeBase >> saveGrangerResultsFrom: grangerResultsFolder [
	| abib |
	grangerResultsFolder asFileReference directories
		do: [ :lagDir | 
			lagDir visibleFiles
				do: [ :aFile | 
					abib := self
						searchBiblioNamed: (aFile basename copyReplaceAll: '..txt' with: '').
					abib
						saveGrangerResultWith: aFile
						forLag: lagDir basename asInteger ] ]
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

{ #category : #accessing }
CIMBibliothequeBase >> totalBugs [
	^ (CIMQueryCorrectiveMaintenance new
		runOn: (bibliotheques collect: [ :each | each tickets ]) flatten asSet)
		size
]

{ #category : #accessing }
CIMBibliothequeBase >> totalEvolution [
	^ (CIMQueryEvolution new
		runOn: (bibliotheques collect: [ :each | each tickets ]) flatten asSet)
		size
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
