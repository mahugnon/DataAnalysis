Class {
	#name : #PBPie,
	#superclass : #Object,
	#category : #'PBDataAnalyse-RoassalPresenters'
}

{ #category : #drawing }
PBPie >> draw: associations [
	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: associations.
	b slice: #value.
	b normalizer distinctColor.
	^ b
]
