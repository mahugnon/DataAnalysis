"
To be improve . Just temporarie
"
Class {
	#name : #CyclomaticComplextiyBar,
	#superclass : #PBBar,
	#category : #'PBDataAnalyse-RoassalPresenters'
}

{ #category : #'drawing-general' }
CyclomaticComplextiyBar >> draw: aDictionary [
	| ds b |
	b := RTGrapher new.
	ds := RTData new.
	ds barShape
		width: 8;
		color: (Color green alpha: 0.5);
		if: [ :value | (aDictionary at: value) >= 100 ]
			fillColor: Color red;
		if:
				[ :value | (aDictionary at: value) < 100 & ((aDictionary at: value) >= 30) ]
			fillColor: (Color gray alpha: 0.9).
	"ds connectColor: Color blue."
	ds points: aDictionary keys.
	ds y: [ :cp | aDictionary at: cp ].
	b
		add: ds;
		configureForBarCharts.
	^ b
]
