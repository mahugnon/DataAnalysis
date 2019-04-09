Class {
	#name : #CIMEvolutionRankStrategy,
	#superclass : #CIMAbstractRankStrategy,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #api }
CIMEvolutionRankStrategy >> rankWith: evolutions and: bugs [
	^ evolutions keys
		collect: [ :key | 
			| ev bg |
			bg := bugs at: key ifAbsent: [ 0 ].
			ev := evolutions at: key.
			ev = bg
				ifTrue: [ key
						->
							('Neutre bugs: ' , (bugs at: key) asString , ' ev:'
								, (evolutions at: key)) ]
				ifFalse: [ ev > bg
						ifTrue: [ key
								->
									('Evolution bugs: ' , (bugs at: key) asString , ' ev: '
										, (evolutions at: key)) ]
						ifFalse: [ key
								->
									('Bug bugs:' , (bugs at: key) asString , ' ev: '
										, (evolutions at: key)) ] ] ]
]
