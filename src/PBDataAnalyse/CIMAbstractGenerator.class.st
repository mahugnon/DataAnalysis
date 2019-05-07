Class {
	#name : #CIMAbstractGenerator,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> ensureDirectoriesCreation [
	(self repoPath / 'Generated') ensureCreateDirectory.
	(self resultPath / 'Graphs') ensureCreateDirectory.
	(self resultPath / 'Graphs' / 'PerMonth') ensureCreateDirectory.
	(self resultPath / 'Graphs' / 'PerYear') ensureCreateDirectory.
	(self resultPath / 'Logs') ensureCreateDirectory.
	self grangerFolder.
	(self resultPath / 'timeSeries') ensureCreateDirectory
]

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> grangerFolder [
	^ (self resultPath / 'GrangerTestResult') ensureCreateDirectory
]

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> repoPath [
	^ CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse'
]

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> resultPath [
^self repoPath /'Generated'
]
