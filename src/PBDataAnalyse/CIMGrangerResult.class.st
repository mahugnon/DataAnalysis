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
CIMGrangerResult >> bestGranger [
	^ (results associations sort: [ :a :b | a value < b value ]) first
]

{ #category : #'as yet unclassified' }
CIMGrangerResult >> extactGrangerResultFromFile: aFile [
	| contents |
	contents := aFile asFileReference contents.
	contents ifEmpty: [ ^ 0 ].
	^ ((((Character space split: ((Character lf split: contents) at: 7))
		reject: [ :ch | ch = '' ]) reject: [ :each| each = '<' ] )at: 5) asNumber
]

{ #category : #initialization }
CIMGrangerResult >> initialize [
	super initialize.
	results := Dictionary new
]

{ #category : #printing }
CIMGrangerResult >> printResultOn: aStream [
	results
		keysDo: [ :key | 
			aStream setToEnd.
			(results at: key) printOnFile: aStream.
			key = 12
				ifFalse: [ aStream nextPut: $, ] ]
]

{ #category : #'as yet unclassified' }
CIMGrangerResult >> saveGrangerResultWith: grangerResultFile forLag: anInteger [
	^ results
		at: anInteger
		put: (self extactGrangerResultFromFile: grangerResultFile)
]
