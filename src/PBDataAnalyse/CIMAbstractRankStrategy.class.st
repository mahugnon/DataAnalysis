Class {
	#name : #CIMAbstractRankStrategy,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #api }
CIMAbstractRankStrategy >> rankWith: aCollection1 and: aCollection2 [
	^ self subclassResponsibility
]
