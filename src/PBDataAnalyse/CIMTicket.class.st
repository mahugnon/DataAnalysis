Class {
	#name : #CIMTicket,
	#superclass : #Object,
	#instVars : [
		'dateCrea',
		'libelleCorr'
	],
	#classVars : [
		'Tickets'
	],
	#category : #PBDataAnalyse
}

{ #category : #accessing }
CIMTicket >> isCorrectiveMaintenace [
	^self libelleForCorrective anySatisfy: [ :lib | self libelleCorr beginsWith: lib]
]

{ #category : #accessing }
CIMTicket >> libelleCorr [ 
	^libelleCorr
]

{ #category : #accessing }
CIMTicket >> libelleForCorrective [
	^{'CORRECTION' . 'REGRESSION' . 'RUN/Anomalie' . 'ANOMALIE'}
]

{ #category : #accessing }
CIMTicket >> year [
	^ dateCrea  year
]
