Class {
	#name : #CIMResultGenerator,
	#superclass : #CIMAbstractGenerator,
	#instVars : [
		'allTickets',
		'bibliothequeBase',
		'lags'
	],
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #accessing }
CIMResultGenerator >> allTickets [
	^ allTickets
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> buildEverything [
	self ensureDirectoriesCreation.
	self loadData.
	bibliothequeBase printOnFile: self resultPath / 'bib_loc_ev_bug.csv'.
	self generateMonthTimeSerie.
	bibliothequeBase drawEvolutionBugGraph.
	self runGrangerTests
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
				printOnFile: self resultPath / 'timeSeries' / each nom , '.csv' ]
]

{ #category : #initialization }
CIMResultGenerator >> initialize [
	super initialize.
	lags := 2
]

{ #category : #accessing }
CIMResultGenerator >> lag: anObject [
	lags := anObject
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> loadData [
	| bibliothequeLOC |
	allTickets := CIMTicketBase new
		loadTickets;
		yourself.
	bibliothequeLOC := CIMBibliothequeBase new
		loadBiothequesFromFilename: self repoPath / 'CSVFiles/sizeCount.csv'.
	bibliothequeBase := CIMBibliothequeBase new
		createBibliothequesIn: self repoPath / 'CSVFiles/bibiothequeNames'
		from: allTickets tickets.
	bibliothequeBase mergeBaseWith: bibliothequeLOC
]

{ #category : #'as yet unclassified' }
CIMResultGenerator >> runGrangerTests [
	(self resultPath / 'timeSeries') hasFiles
		ifFalse:
			[ self error: 'You should provide time serie data to run Granger test' ].
	^ (self resultPath / 'timeSeries') asFileReference visibleFiles
		do: [ :aFile | 
			CIMRAnalyser new
				input: aFile fullName;
				output: (aFile basename copyReplaceAll: 'csv' with: 'txt');
				lag: lags;
				runGranger ]
]
