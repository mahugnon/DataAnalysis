Class {
	#name : #PB2Bars,
	#superclass : #Object,
	#instVars : [
		'data1',
		'data2'
	],
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #accessing }
PB2Bars >> data1 [
	^ data1
]

{ #category : #accessing }
PB2Bars >> data1: anObject [
	data1 := anObject
]

{ #category : #accessing }
PB2Bars >> data2 [
	^ data2
]

{ #category : #accessing }
PB2Bars >> data2: anObject [
	data2 := anObject
]

{ #category : #'drawing-general' }
PB2Bars >> draw [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: data1 keys.
	ds y: [ :year | data1 at: year ].
	b add: ds.
	ds := RTData new.
	"ds barShape color: Color red."
	ds connectColor: Color red.
	ds points: data2 keys.
	ds y: [ :year | data2 at: year ].
	b add: ds.
	b axisX
		numberOfLabels: (data1 size max: data2 size);
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > data1 keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (data1 keys at: v) asString ] ].
	^ b
]
