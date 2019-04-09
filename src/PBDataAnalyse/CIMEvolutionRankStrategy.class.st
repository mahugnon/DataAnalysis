Class {
	#name : #CIMEvolutionRankStrategy,
	#superclass : #CIMAbstractRankStrategy,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #api }
CIMEvolutionRankStrategy >> rankWith: aCollection1 and: aCollection2 [
	^ aCollection1 keys
		collect: [ :key | 
			| ev bg |
			bg := aCollection2 at: key ifAbsent: [ 0 ].
			ev := aCollection1 at: key.
			ev = bg
				ifTrue: [ key -> 'Neutre' ]
				ifFalse: [ ev > bg
						ifTrue: [ key -> 'Evolution' ]
						ifFalse: [ key -> 'Bug' ] ] ]
]
