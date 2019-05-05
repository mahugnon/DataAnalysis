Class {
	#name : #RunAllStrategy,
	#superclass : #AbstractRunStrategy,
	#category : #'PBDataAnalyseGui-utils'
}

{ #category : #'as yet unclassified' }
RunAllStrategy >> runWithLag: anInteger [
	^ CIMResultGenerator new
		lag: anInteger;
		buildEverything
]
