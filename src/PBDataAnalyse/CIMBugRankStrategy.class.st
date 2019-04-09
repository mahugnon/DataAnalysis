Class {
	#name : #CIMBugRankStrategy,
	#superclass : #CIMAbstractRankStrategy,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #api }
CIMBugRankStrategy >> rankWith: bugs and: evolutions [
	^ bugs keys
		collect: [ :key | 
			| ev bg |
			ev := evolutions at: key ifAbsent: [ 0 ].
			bg := bugs at: key.
			ev = bg
				ifTrue: [ key
						->
							('Neutre bugs: ' , (bugs at: key) asString , ' ev:'
								, (evolutions at: key) asString) ]
				ifFalse: [ ev > bg
						ifTrue: [ key
								->
									('Evolution bugs: ' , (bugs at: key) asString , ' ev: '
										, (evolutions at: key) asString) ]
						ifFalse: [ key
								->
									('Bug bugs:' , (bugs at: key) asString , '  ev: '
										, (evolutions at: key) asString) ] ] ]
]
