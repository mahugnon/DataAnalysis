Class {
	#name : #CIMBibiothequeOccurenceQuery,
	#superclass : #CIMOccurenceQuery,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMBibiothequeOccurenceQuery >> runOn: aTicketDictionary [
	^ (aTicketDictionary
		keysDo:
			[ :each | aTicketDictionary at: each put: (aTicketDictionary at: each) size ])
		associations sorted: [ :a :b | a value > b value ]
]
