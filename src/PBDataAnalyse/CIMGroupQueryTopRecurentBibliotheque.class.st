Class {
	#name : #CIMGroupQueryTopRecurentBibliotheque,
	#superclass : #CIMGroupTickets,
	#instVars : [
		'treshold'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMGroupQueryTopRecurentBibliotheque >> runOn: aCollection [
	^ (((CIMTicketPerYear new runOn: aCollection)
		collect: [ :each | 
			CIMBibiothequeOccurenceQuery new
				runOn: (CIMGroupTicketsByBiblioName new runOn: each) ])
		collect: [ :each | 
			each size > treshold
				ifTrue: [ each copyFrom: 1 to: treshold ]
				ifFalse: [ each ] ]) flatten keys asSet
]

{ #category : #accessing }
CIMGroupQueryTopRecurentBibliotheque >> treshold [
	^ treshold
]

{ #category : #accessing }
CIMGroupQueryTopRecurentBibliotheque >> treshold: anObject [
	treshold := anObject
]
