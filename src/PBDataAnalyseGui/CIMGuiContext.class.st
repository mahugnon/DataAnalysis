Class {
	#name : #CIMGuiContext,
	#superclass : #Object,
	#instVars : [
		'lags',
		'runStrategy'
	],
	#category : #'PBDataAnalyseGui-context'
}

{ #category : #accessing }
CIMGuiContext >> lags [
	^ lags
]

{ #category : #accessing }
CIMGuiContext >> lags: anObject [
	lags := anObject
]

{ #category : #running }
CIMGuiContext >> run [
	^ self runStrategy new runWithLag: lags
]

{ #category : #accessing }
CIMGuiContext >> runStrategy [
	^ runStrategy
]

{ #category : #accessing }
CIMGuiContext >> runStrategy: anObject [
	runStrategy := anObject
]
