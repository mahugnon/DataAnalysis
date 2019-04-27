Class {
	#name : #CIMResultGenerator,
	#superclass : #CIMAbstractGenerator,
	#instVars : [
		'allTickets',
		'bibliothequeBase',
		'order'
	],
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMResultGenerator >> buildEverything [
	self loadData.
	self ensureDirectoriesCreation.
	bibliothequeBase printOn: self repoPath / 'bib_loc_ev_bug.csv'.
	self generateMonthTimeSerie.
	bibliothequeBase drawEvolutionBugGraph.
	self runGrangerTestsWithOrder: 2
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> ensureDirectoriesCreation [
	(self repoPath / 'Graphs') ensureCreateDirectory.
	(self repoPath / 'Logs') ensureCreateDirectory.
	(self repoPath / 'GrangerTestResult') ensureCreateDirectory.
	(self repoPath / 'CSVFiles/timeSeries') ensureCreateDirectory
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> generateMonthTimeSerie [
	bibliothequeBase bibliotheques
		do: [ :each | 
			EvolutionCorrection new
				evolution:
					(CIMTicketPerMonth new
						runOn: (CIMQueryEvolution new runOn: each tickets));
				correction:
					(CIMTicketPerMonth new
						runOn: (CIMQueryCorrectiveMaintenance new runOn: each tickets));
				printOn: self repoPath / 'CSVFiles/timeSeries' / each nom , '.csv' ]
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
CIMResultGenerator >> runGrangerTestsWithOrder: anInteger [
	^ (self repoPath / 'CSVFiles/timeSeries') asFileReference
		visibleFiles
		do: [ :aFile | 
			CIMRAnalyser new
				input: aFile fullName;
				output: (aFile basename copyReplaceAll: 'csv' with: 'txt');
				order: anInteger;
				runGranger ]
]
