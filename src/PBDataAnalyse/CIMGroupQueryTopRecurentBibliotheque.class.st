"
-I get bugs
- sort them per year
- I group them  per biblioNom for each year
- I compute the occurence of each biblio
- I select the treshold  first 
- I miss them and remove repetition 
"
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
	^ ((((CIMTicketPerYear new
		runOn: (CIMQueryCorrectiveMaintenance new runOn: aCollection))
		collect: [ :each | 
			CIMBibiothequeOccurenceQuery new
				runOn: (CIMGroupTicketsByBiblioName new runOn: each value) ])
		collect: [ :each | 
			each size > treshold
				ifTrue: [ each copyFrom: 1 to: treshold ]
				ifFalse: [ each ] ]) flatten collect: [ :each | each key ]) asSet
]

{ #category : #accessing }
CIMGroupQueryTopRecurentBibliotheque >> treshold [
	^ treshold
]

{ #category : #accessing }
CIMGroupQueryTopRecurentBibliotheque >> treshold: anObject [
	treshold := anObject
]
