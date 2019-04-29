Class {
	#name : #RunGrangerStrategy,
	#superclass : #AbstractRunStrategy,
	#category : #'PBDataAnalyseGui-utils'
}

{ #category : #'as yet unclassified' }
RunGrangerStrategy >> runWithLag: anInteger [
	^ CIMResultGenerator new
		lags: anInteger;
		ensureDirectoriesCreation;
		runGrangerTests
]
