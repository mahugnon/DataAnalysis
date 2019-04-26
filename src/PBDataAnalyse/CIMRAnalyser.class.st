Class {
	#name : #CIMRAnalyser,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #testing }
CIMRAnalyser >> isRInPath [
	| result rCommand |
	rCommand := self localRCommand.
	result := LibC uniqueInstance system: rCommand , ' --version'.
	^ result = 0
]

{ #category : #accessing }
CIMRAnalyser >> localRCommand [
^'Rscript'
]
