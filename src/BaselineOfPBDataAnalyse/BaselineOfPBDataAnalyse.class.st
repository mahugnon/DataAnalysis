Class {
	#name : #BaselineOfPBDataAnalyse,
	#superclass : #BaselineOf,
	#category : #BaseLineOfPBDataAnalyse
}

{ #category : #baselines }
BaselineOfPBDataAnalyse >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		"Packages" 
		spec package: 'PBDataAnalyseGui';
		 package: 'PBDataAnalyse' ]
]
