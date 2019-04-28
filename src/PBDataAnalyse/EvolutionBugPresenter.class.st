Class {
	#name : #EvolutionBugPresenter,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #drawing }
EvolutionBugPresenter >> drawEvolutionCorrectionPerYearForTickets: aTicketCollection title: aString [
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
	"graph exportData: aString , '.csv'."
	roassal := graph draw.
	roassal axisY noDecimal.
	roassal title: aString.
	^ RTPNGExporter new
		builder: roassal build;
		fileName: (self graphLocation / aString , '.png') fullName;
		exportToFile
]

{ #category : #'as yet unclassified' }
EvolutionBugPresenter >> graphLocation [
	^ CIMResultGenerator new resultPath / 'Graphs'
]
