"
I hold Granger results for all computed lags.
	I extract the result from file myself
"
Class {
	#name : #CIMGrangerResult,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #'as yet unclassified' }
CIMGrangerResult >> extactGrangerResultFromFile: aFile [
	| contents |
	contents := aFile asFileReference contents.
	contents ifEmpty: [ ^ 0 ].
	^ (((Character space split: ((Character lf split: contents) at: 7))
		reject: [ :ch | ch = '' ]) at: 5) asNumber
]

{ #category : #initialization }
CIMGrangerResult >> initialize [
	super initialize.
	results := Dictionary new
]

{ #category : #'as yet unclassified' }
CIMGrangerResult >> saveGrangerResultWith: grangerResultFile forLag: anInteger [
	^ results
		at: anInteger
		put: (self extactGrangerResultFromFile: grangerResultFile)
]
