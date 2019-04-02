Class {
	#name : #PBBar,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #'drawing-general' }
PBBar >> draw: associations [
	| b ds |
	b := RTGrapher new.
	ds := RTData new.
	ds barShape color: Color blue.
	ds points: associations.
	ds
		barChartWithBarTitle: [ :value | (associations keyAtValue: value) asString ].
	b add: ds.
	b axisX
		noLabel;
		noTick.
	^ b
]
