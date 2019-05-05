Class {
	#name : #RunGrangerStrategy,
	#superclass : #AbstractRunStrategy,
	#category : #'PBDataAnalyseGui-utils'
}

{ #category : #'as yet unclassified' }
RunGrangerStrategy >> runWithLag: anInteger [
	^ CIMResultGenerator new
		lag: anInteger;
		ensureDirectoriesCreation;
		runGrangerTests
]

{ #category : #'as yet unclassified' }
RunGrangerStrategy >> runWithLags: aCollection [
	aCollection do: [ :each | self runWithLag: each ]
]
