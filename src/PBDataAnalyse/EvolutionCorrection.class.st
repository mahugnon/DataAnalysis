Class {
	#name : #EvolutionCorrection,
	#superclass : #Object,
	#instVars : [
		'evolution',
		'correction'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #accessing }
EvolutionCorrection >> correction [
	^ correction
]

{ #category : #accessing }
EvolutionCorrection >> correction: anObject [
	correction := anObject
]

{ #category : #accessing }
EvolutionCorrection >> evolution: anObject [
	evolution := anObject
]

{ #category : #printing }
EvolutionCorrection >> printOn: aFile [
	| timeSerie file |
	timeSerie := evolution size >= correction size
		ifTrue: [ evolution keys ]
		ifFalse: [ correction keys ].
	file := aFile asFileReference.
	file
		writeStreamDo: [ :aStream | 
			aStream
				nextPutAll: 'Time';
				nextPut: $,;
				nextPutAll: 'evolution';
				nextPut: $,;
				nextPutAll: 'corretion';
				nextPut: Character cr ].
	timeSerie
		do: [ :time | 
			file
				writeStreamDo: [ :aStream | 
					aStream setToEnd.
					time printOn: aStream.
					aStream nextPut: $,.
					(evolution at: time ifAbsent: [ {} ]) size printOn: aStream.
					aStream nextPut: $,.
					(correction at: time ifAbsent: [ {} ]) size printOn: aStream.
					aStream nextPut: Character cr ] ]
]
