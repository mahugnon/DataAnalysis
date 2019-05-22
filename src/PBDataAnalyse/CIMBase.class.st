Class {
	#name : #CIMBase,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Core'
}

{ #category : #'as yet unclassified' }
CIMBase >> loadCSV: aFileName [
	^ CSVParser parseFileWithHeader: aFileName
]

{ #category : #'as yet unclassified' }
CIMBase >> utilScript [
	CIMBibliothequeBase new
		saveGrangerResultsFrom: CIMResultGenerator new grangerFolder.
	CIMBibliothequeBase new exportGrangerResultOn: 'grangerResults.txt'.
	CIMBibliothequeBase new bugSEvolutionsProportion
]
