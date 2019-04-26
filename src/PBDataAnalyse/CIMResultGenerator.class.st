Class {
	#name : #CIMResultGenerator,
	#superclass : #Object,
	#instVars : [
		'allTickets',
		'bibliothequeBase'
	],
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMResultGenerator >> buildEverything [
	self loadData.
	bibliothequeBase
		printOn: self repoPath / 'CSVFiles/bib_loc_ev_bug.csv'.
	self generateMonthTimeSerie.
	bibliothequeBase drawEvolutionBugGraph .
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> ensureTimeSerieDirectoryCreation [
	^ (self repoPath
		/
			(String
				streamContents: [ :aStream | 
					'CSVFiles/timeSeries' printOn: aStream.
					Date today ddmmyyyy printOn: aStream ])) ensureCreateDirectory
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> generateMonthTimeSerie [
	| timeSerielocation |
	timeSerielocation := self ensureTimeSerieDirectoryCreation.
	bibliothequeBase bibliotheques
		do: [ :each | 
			EvolutionCorrection new
				evolution:
					(CIMTicketPerMonth new
						runOn: (CIMQueryEvolution new runOn: each tickets));
				correction:
					(CIMTicketPerMonth new
						runOn: (CIMQueryCorrectiveMaintenance new runOn: each tickets));
				printOn:
					timeSerielocation
						/
							(String
								streamContents: [ :aStream | 
									each nom printOn: aStream.
									'.csv' printOn: aStream ]) ]
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> loadData [
	| bibliothequeLOC |
	allTickets := CIMTicketBase new
		loadTickets;
		yourself.
	bibliothequeLOC := CIMBibliothequeBase new
		loadBiothequesFromFilename:
			(CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles/sizeCount.csv'.
	bibliothequeBase := CIMBibliothequeBase new
		createBibliothequesIn:
			(CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles/bibiothequeNames'
		from: allTickets tickets.
	bibliothequeBase mergeBaseWith: bibliothequeLOC
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> repoPath [
	^ CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse'
]
