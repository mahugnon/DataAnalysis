Class {
	#name : #CIMBugRankStrategy,
	#superclass : #CIMAbstractRankStrategy,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #api }
CIMBugRankStrategy >> rankWith: aCollection1 and: aCollection2 [
	^ aCollection1 keys
		collect: [ :key | 
			| ev bg |
			ev := aCollection2 at: key ifAbsent: [ 0 ].
			bg := aCollection1 at: key.
			ev = bg
				ifTrue: [ key -> 'Neutre' ]
				ifFalse: [ ev > bg
						ifTrue: [ key -> 'Evolution' ]
						ifFalse: [ key -> 'Bug' ] ] ]
]
