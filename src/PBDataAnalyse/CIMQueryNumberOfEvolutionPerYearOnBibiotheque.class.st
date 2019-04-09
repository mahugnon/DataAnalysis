Class {
	#name : #CIMQueryNumberOfEvolutionPerYearOnBibiotheque,
	#superclass : #CIMQueryNumberOfEventPerYearOnBibliotheque,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'hook - private' }
CIMQueryNumberOfEvolutionPerYearOnBibiotheque >> eventQuery [
	^ CIMQueryEvolution
]
