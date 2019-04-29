Class {
	#name : #RunAllStrategy,
	#superclass : #AbstractRunStrategy,
	#category : #'PBDataAnalyseGui-utils'
}

{ #category : #'as yet unclassified' }
RunAllStrategy >> runWithLag: anInteger [
	^ CIMResultGenerator new
		lags: anInteger;
		buildEverything
]
