Class {
	#name : #CIMRAnalyser,
	#superclass : #Object,
	#category : #'PBDataAnalyse-RScript'
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
