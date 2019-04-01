Class {
	#name : #PBPie,
	#superclass : #Object,
	#category : #'PBDataAnalyse-Presenters'
}

{ #category : #drawing }
PBPie >> drawPie: associations [
	| b |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: associations.
	b slice: #value.
	b normalizer distinctColor.
	^ b
]
