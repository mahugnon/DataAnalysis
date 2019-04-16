Class {
	#name : #CIMQuerySetMinus,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQuerySetMinus >> runOn: aCollection [
	ShouldNotImplement signal: 'Use #runOn:minus: instead'
]

{ #category : #running }
CIMQuerySetMinus >> runOn: collection1 minus: collection2 [
	| tmp |
	tmp := collection1 copyFrom: 1 to: collection1 size.
	collection2 do: [ :each | (tmp includes: each) ifTrue: [ tmp remove: each ] ].
	^ tmp
]
