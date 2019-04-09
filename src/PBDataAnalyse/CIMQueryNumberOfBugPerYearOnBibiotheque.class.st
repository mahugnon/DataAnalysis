Class {
	#name : #CIMQueryNumberOfBugPerYearOnBibiotheque,
	#superclass : #CIMQueryNumberOfEventPerYearOnBibliotheque,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'hook - private' }
CIMQueryNumberOfBugPerYearOnBibiotheque >> eventQuery [
	^ CIMQueryCorrectiveMaintenance
]
