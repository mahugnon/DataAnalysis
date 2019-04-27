Extension { #name : #AbstractFileReference }

{ #category : #'*PBDataAnalyse' }
AbstractFileReference >> visibleFiles [
	^ self files reject: [ :aFile | aFile basename first = $. ]
]
