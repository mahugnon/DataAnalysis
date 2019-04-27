Class {
	#name : #CIMAbstractGenerator,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMAbstractGenerator >> repoPath [
	^ CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse'
]
