Class {
	#name : #AbstractRunStrategy,
	#superclass : #Object,
	#category : #'PBDataAnalyseGui-utils'
}

{ #category : #'as yet unclassified' }
AbstractRunStrategy >> runWithLag: anInteger [
	^ self subclassResponsibility
]
