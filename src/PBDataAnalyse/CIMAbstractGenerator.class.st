Class {
	#name : #CIMAbstractGenerator,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> ensureDirectoriesCreation [
	(self repoPath / 'Generated') ensureCreateDirectory.
	(self resultPath / 'Graphs') ensureCreateDirectory.
	(self resultPath / 'Logs') ensureCreateDirectory.
	(self resultPath / 'GrangerTestResult') ensureCreateDirectory.
	(self resultPath / 'timeSeries') ensureCreateDirectory
]

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> repoPath [
	^ CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse'
]

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> resultPath [
^self repoPath /'Generated'
]
