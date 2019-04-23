Class {
	#name : #PB2GraphsBlueRed,
	#superclass : #Object,
	#instVars : [
		'data1',
		'data2',
		'maxY'
	],
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #accessing }
PB2GraphsBlueRed >> data1 [
	^ data1
]

{ #category : #accessing }
PB2GraphsBlueRed >> data1: anObject [
	data1 := anObject
]

{ #category : #accessing }
PB2GraphsBlueRed >> data2 [
	^ data2
]

{ #category : #accessing }
PB2GraphsBlueRed >> data2: anObject [
	data2 := anObject
]

{ #category : #'drawing-general' }
PB2GraphsBlueRed >> draw [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	"ds barShape color: Color blue."
	ds connectColor: Color blue.
	ds points: data1 keys.
	ds y: [ :year | data1 at: year ].
	b add: ds.
	b minX: 2003.
	b maxX: 2019.
	maxY ifNotNil: [ b maxY: maxY ].
	ds := RTData new.
	"ds barShape color: Color red."
	ds connectColor: Color red.
	ds points: data2 keys.
	ds y: [ :year | data2 at: year ].
	b add: ds.
	maxY ifNotNil: [ b maxY: maxY ].
	b maxX: (data1 size max: data2 size).
	b axisX
		numberOfLabels: (data1 size max: data2 size);
		labelRotation: -45;
		labelConversion: [ :v | 
			(v < 1 or: [ v > data1 keys size ])
				ifTrue: [ ''	"for 0" ]
				ifFalse: [ (data1 keys at: v) asString ] ].
	^ b
]

{ #category : #'as yet unclassified' }
PB2GraphsBlueRed >> exportData [
	| stream years |
	years := data1 size >= data2 size
		ifTrue: [ data1 keys ]
		ifFalse: [ data2 keys ].
	stream := FileStream forceNewFileNamed: 'data.csv'.
	stream
		nextPutAll: 'years';
		nextPut: $,;
		nextPutAll: 'evolution';
		nextPut: $,;
		nextPutAll: 'corretion';
		nextPut: Character cr.
	years
		do: [ :year | 
			stream
				nextPutAll: year asString;
				nextPut: $,;
				nextPutAll: (data1 at: year ifAbsent: [ 0 ]) asString;
				nextPut: $,;
				nextPutAll: (data2 at: year ifAbsent: [ 0 ]) asString;
				nextPut: Character cr ]
]

{ #category : #accessing }
PB2GraphsBlueRed >> maxY: aNumber [
	maxY := aNumber
]
