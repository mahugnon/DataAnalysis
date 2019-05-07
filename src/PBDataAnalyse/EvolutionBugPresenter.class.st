Class {
	#name : #EvolutionBugPresenter,
	#superclass : #Object,
	#category : #'PBDataAnalyse-RoassalPresenters'
}

{ #category : #drawing }
EvolutionBugPresenter >> drawEvolutionCorrectionForTickets: aTicketCollection timeQuery: aCIMQuery title: aString [
	| graph roassal |
	graph := PB2GraphsBlueRed new.
	graph maxY: 400.
	graph
		data1:
			((aCIMQuery new
				runOn: (CIMQueryEvolution new runOn: aTicketCollection))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	graph
		data2:
			((aCIMQuery new
				runOn: (CIMQueryCorrectiveMaintenance new runOn: aTicketCollection))
				collect: [ :ass | ass key -> ass value size ]) asOrderedDictionary.
	"graph exportData: aString , '.csv'."
	roassal := graph draw.
	roassal axisY noDecimal.
	roassal title: aString.
	^ roassal
]

{ #category : #drawing }
EvolutionBugPresenter >> exportEvolutionCorrectionPerMonthForTickets: aTicketCollection title: aString [
	^ RTPNGExporter new
		builder:
			(self
				drawEvolutionCorrectionForTickets: aTicketCollection
				timeQuery: CIMTicketPerMonth
				title: aString) build;
		fileName: (self perMonthGraphLocation / aString , '.png') fullName;
		exportToFile
]

{ #category : #drawing }
EvolutionBugPresenter >> exportEvolutionCorrectionPerYearForTickets: aTicketCollection title: aString [
	^ RTPNGExporter new
		builder:
			(self
				drawEvolutionCorrectionForTickets: aTicketCollection
				timeQuery: CIMTicketPerYear
				title: aString) build;
		fileName: (self perYearGraphLocation / aString , '.png') fullName;
		exportToFile
]

{ #category : #'as yet unclassified' }
EvolutionBugPresenter >> perMonthGraphLocation [
	^ CIMResultGenerator new resultPath / 'Graphs' / 'PerMonth'
]

{ #category : #'as yet unclassified' }
EvolutionBugPresenter >> perYearGraphLocation [
	^ CIMResultGenerator new resultPath / 'Graphs' / 'PerYear'
]
