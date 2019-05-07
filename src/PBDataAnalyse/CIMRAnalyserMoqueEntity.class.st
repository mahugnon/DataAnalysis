Class {
	#name : #CIMRAnalyserMoqueEntity,
	#superclass : #CIMRAnalyser,
	#category : #'PBDataAnalyse-Tests'
}

{ #category : #running }
CIMRAnalyserMoqueEntity >> runGranger [
	| command outputFileName errorFileName generator |
	generator := CIMResultGenerator new.
	self isRInPath
		ifFalse: [ UIManager default
				abort:
					'Rscript could not be found in the path. R must be installed and Rscript''s directory must be added to the system path'.
			"Return non-zero means something bad happened"
			^ 1 ].
	outputFileName := generator repoPath / 'test/output.txt'.
	errorFileName := generator repoPath / 'test/errors.txt'.
	command := self localRCommand , ' ' , self grangerScriptPath fullName
		, ' ' , (generator repoPath / 'test/testTimeSerie.csv') fullName
		, ' ' , '2' , ' '
		, (generator repoPath / 'test/testGrangerResult.txt') fullName.
	LibC
		runCommand:
			command , ' >' , outputFileName fullName , ' 2>'
				, errorFileName fullName.
	errorFileName asFileReference contents lines
]
