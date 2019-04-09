Class {
	#name : #CIMQueryMostOccurentEventPerYearForBibliotheque,
	#superclass : #CIMQueryOnTickets,
	#instVars : [
		'queryName'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMQueryMostOccurentEventPerYearForBibliotheque >> queryName [
	^ queryName
]

{ #category : #accesing }
CIMQueryMostOccurentEventPerYearForBibliotheque >> queryName: aString [ 
	queryName := aString
]

{ #category : #running }
CIMQueryMostOccurentEventPerYearForBibliotheque >> runOn: aCollection with: aBibliothequeName [
	| bugsPerYear evolutionPerYear |
	bugsPerYear := CIMQueryNumberOfBugPerYearOnBibiotheque new
		runOn: aCollection
		with: aBibliothequeName.
	evolutionPerYear := CIMQueryNumberOfEvolutionPerYearOnBibiotheque new
		runOn: aCollection
		with: aBibliothequeName.
	^ bugsPerYear size >= evolutionPerYear size
		ifTrue: [ CIMBugRankStrategy new rankWith: bugsPerYear and: evolutionPerYear ]
		ifFalse: [ CIMEvolutionRankStrategy new
				rankWith: evolutionPerYear
				and: bugsPerYear ]
]
