Class {
	#name : #CIMBase,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Core'
}

{ #category : #'as yet unclassified' }
CIMBase >> loadCSV: aFileName [
	^ CSVParser parseFileWithHeader: aFileName
]
