Class {
	#name : #CIMQueryFindBibliothequeFromBase,
	#superclass : #Object,
	#instVars : [
		'bibliothequeName'
	],
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #accessing }
CIMQueryFindBibliothequeFromBase >> bibliothequeName: anObject [
	bibliothequeName := anObject
]

{ #category : #running }
CIMQueryFindBibliothequeFromBase >> runOn: aBibliothequeBase [
	^ (aBibliothequeBase bibliotheques
		select: [ :abib | abib nom = bibliothequeName ]) anyOne
]
