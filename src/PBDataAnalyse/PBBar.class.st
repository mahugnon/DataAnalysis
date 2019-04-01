Class {
	#name : #PBBar,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #'drawing-general' }
PBBar >> draw: assications [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds barShape color: Color blue.
	ds points: assications.
	ds
		barChartWithBarTitle: [ :value | (assications keyAtValue: value) asString ].
	b add: ds.
	b axisX
		noLabel;
		noTick.
	^ b
]
