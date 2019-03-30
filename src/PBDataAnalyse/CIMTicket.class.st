Class {
	#name : #CIMTicket,
	#superclass : #Object,
	#instVars : [
		'dateCrea',
		'libelleCorr',
		'fTNumOrdre',
		'typCorrLibelle',
		'priorite',
		'ftDateCrea',
		'ftObjet',
		'biblioNom',
		'versionLibelle',
		'ftConstat',
		'biblioNew'
	],
	#classVars : [
		'Tickets'
	],
	#category : #'PBDataAnalyse-model'
}

{ #category : #operations }
CIMTicket class >> createWith: aDictionnary [
	^ self new
		fTNumOrdre: (aDictionnary at: 'FT_NUMORDRE');
		typCorrLibelle: (aDictionnary at: 'TYPCORR_LIBELLE');
		priorite: (aDictionnary at: 'PRIORITE');
		ftDateCrea: (aDictionnary at: 'FT_DATECREA') asDate;
		ftObjet: (aDictionnary at: 'FT_OBJET');
		biblioNom: (aDictionnary at: 'BIBLIO_NOM');
		versionLibelle: (aDictionnary at: 'VERSION_LIBELLE');
		ftConstat: (aDictionnary at: 'FT_CONSTAT');
		biblioNew: (aDictionnary at: 'BIBLIO_NEW');
		yourself
]

{ #category : #accessing }
CIMTicket >> biblioNew [
	^ biblioNew
]

{ #category : #accessing }
CIMTicket >> biblioNew: anObject [
	biblioNew := anObject
]

{ #category : #accessing }
CIMTicket >> biblioNom [
	^ biblioNom
]

{ #category : #accessing }
CIMTicket >> biblioNom: anObject [
	biblioNom := anObject
]

{ #category : #accessing }
CIMTicket >> dateCrea [
	^ dateCrea
]

{ #category : #accessing }
CIMTicket >> dateCrea: anObject [
	dateCrea := anObject
]

{ #category : #accessing }
CIMTicket >> fTNumOrdre [
	^ fTNumOrdre
]

{ #category : #accessing }
CIMTicket >> fTNumOrdre: aNumber [
	fTNumOrdre := aNumber
]

{ #category : #accessing }
CIMTicket >> ftConstat [
	^ ftConstat
]

{ #category : #accessing }
CIMTicket >> ftConstat: anObject [
	ftConstat := anObject
]

{ #category : #accessing }
CIMTicket >> ftDateCrea [
	^ ftDateCrea
]

{ #category : #accessing }
CIMTicket >> ftDateCrea: anObject [
	ftDateCrea := anObject
]

{ #category : #accessing }
CIMTicket >> ftObjet [
	^ ftObjet
]

{ #category : #accessing }
CIMTicket >> ftObjet: anObject [
	ftObjet := anObject
]

{ #category : #accessing }
CIMTicket >> isCorrectiveMaintenace [
	^self libelleForCorrective anySatisfy: [ :lib | self libelleCorr beginsWith: lib]
]

{ #category : #accessing }
CIMTicket >> libelleCorr [ 
	^libelleCorr
]

{ #category : #accessing }
CIMTicket >> libelleCorr: anObject [
	libelleCorr := anObject
]

{ #category : #accessing }
CIMTicket >> libelleForCorrective [
	^{'CORRECTION' . 'REGRESSION' . 'RUN/Anomalie' . 'ANOMALIE'}
]

{ #category : #accessing }
CIMTicket >> priorite [
	^ priorite
]

{ #category : #accessing }
CIMTicket >> priorite: aString [
	priorite := aString
]

{ #category : #accessing }
CIMTicket >> typCorrLibelle [
	^ typCorrLibelle
]

{ #category : #accessing }
CIMTicket >> typCorrLibelle: aString [
	typCorrLibelle := aString
]

{ #category : #accessing }
CIMTicket >> versionLibelle [
	^ versionLibelle
]

{ #category : #accessing }
CIMTicket >> versionLibelle: anObject [
	versionLibelle := anObject
]

{ #category : #accessing }
CIMTicket >> year [
	^ dateCrea  year
]
