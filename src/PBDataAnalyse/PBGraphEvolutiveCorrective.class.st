Class {
	#name : #PBGraphEvolutiveCorrective,
	#superclass : #Object,
	#instVars : [
		'data1',
		'data2',
		'maxY'
	],
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #accessing }
PBGraphEvolutiveCorrective >> data1 [
	^ data1
]

{ #category : #accessing }
PBGraphEvolutiveCorrective >> data1: anObject [
	data1 := anObject
]

{ #category : #accessing }
PBGraphEvolutiveCorrective >> data2 [
	^ data2
]

{ #category : #accessing }
PBGraphEvolutiveCorrective >> data2: anObject [
	data2 := anObject
]

{ #category : #'drawing-general' }
PBGraphEvolutiveCorrective >> draw [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: data1 keys.
	ds y: [ :year | data1 at: year ].
	b add: ds.
	maxY ifNotNil: [b maxY: maxY].
	ds := RTData new.
	"ds barShape color: Color red."
	ds connectColor: Color red.
	ds points: data2 keys.
	ds y: [ :year | data2 at: year ].
	b add: ds.
	maxY ifNotNil: [b maxY: maxY].
	b axisX
		numberOfLabels: (data1 size max: data2 size);
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > data1 keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (data1 keys at: v) asString ] ].
	^ b
]

{ #category : #accessing }
PBGraphEvolutiveCorrective >> maxY: aNumber [
	maxY := aNumber
]
