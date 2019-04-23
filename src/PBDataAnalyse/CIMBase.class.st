Class {
	#name : #CIMBase,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Core'
}

{ #category : #'as yet unclassified' }
CIMBase >> evolutionCorrectionPerYearForTickets: aTicketCollection title: aString [
	| graph roassal |
	graph := PB2GraphsBlueRed new.
	graph maxY: 400.
	graph
		data1:
			((CIMTicketPerYear new
				runOn: (CIMQueryEvolution new runOn: aTicketCollection))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	graph
		data2:
			((CIMTicketPerYear new
				runOn: (CIMQueryCorrectiveMaintenance new runOn: aTicketCollection))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	graph exportData.
	roassal := graph draw.
	roassal axisY noDecimal.
	roassal title: aString.
	roassal open.
	^ roassal
]

{ #category : #'as yet unclassified' }
CIMBase >> loadCSV: aFileName [
	^ CSVParser parseFileWithHeader: aFileName
]
