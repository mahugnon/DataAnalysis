Class {
	#name : #CIMRAnalyser,
	#superclass : #CIMAbstractGenerator,
	#instVars : [
		'input',
		'output',
		'lags'
	],
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #accessing }
CIMRAnalyser >> grangerResultPath [
	^ self resultPath / 'GrangerTestResult'
]

{ #category : #accessing }
CIMRAnalyser >> grangerScriptPath [
	^ self repoPath / 'R/grangerTest.R'
]

{ #category : #accessing }
CIMRAnalyser >> input [
	^ input
]

{ #category : #accessing }
CIMRAnalyser >> input: anObject [
	input := anObject
]

{ #category : #testing }
CIMRAnalyser >> isRInPath [
	| result rCommand |
	rCommand := self localRCommand.
	result := LibC uniqueInstance system: rCommand , ' --version'.
	^ result = 0
]

{ #category : #accessing }
CIMRAnalyser >> lags [
	^ lags
]

{ #category : #accessing }
CIMRAnalyser >> lags: anInteger [
	lags := anInteger
]

{ #category : #accessing }
CIMRAnalyser >> localRCommand [
^'Rscript'
]

{ #category : #accessing }
CIMRAnalyser >> output [
	^ self grangerResultPath / output
]

{ #category : #accessing }
CIMRAnalyser >> output: anObject [
	output := anObject
]

{ #category : #running }
CIMRAnalyser >> runGranger [
	| command outputFileName errorFileName |
	self isRInPath
		ifFalse: [ UIManager default
				abort:
					'Rscript could not be found in the path. R must be installed and Rscript''s directory must be added to the system path'.
			"Return non-zero means something bad happened"
			^ 1 ].
	outputFileName := self resultPath  / 'Logs/output.txt'.
	errorFileName := self resultPath  / 'Logs/errors.txt'.
	command := self localRCommand , ' ' , self grangerScriptPath fullName
		, ' ' , self input , ' ' , self lags asString , ' '
		, self output fullName.
	LibC
		runCommand:
			command , ' >' , outputFileName fullName , ' 2>'
				, errorFileName fullName.
	^ errorFileName asFileReference contents lines
]
