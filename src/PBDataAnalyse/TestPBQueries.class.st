Class {
	#name : #TestPBQueries,
	#superclass : #TestCase,
	#instVars : [
		'analyser'
	],
	#category : #'PBDataAnalyse-Tests'
}

{ #category : #running }
TestPBQueries >> setUp [
	super setUp.
	analyser := CIMTicketBase new.
	analyser
		tickets:
			(OrderedCollection new
				add:
					(CIMTicket new
						ftDateCrea: '2004-02-15' asDate;
						priorite: 'IMPORTANT';
						typCorrLibelle: 'EVOLUTION';
						biblioNom: 'B1');
				add:
					(CIMTicket new
						ftDateCrea: '2001-05-1' asDate;
						priorite: 'TRES IMPORTANT';
						typCorrLibelle: 'RUN/Evolution';
						biblioNom: 'B2');
				add:
					(CIMTicket new
						ftDateCrea: '2008-12-07' asDate;
						priorite: 'URGENT';
						typCorrLibelle: 'RUN/Anomalie';
						biblioNom: 'B3');
				add:
					(CIMTicket new
						ftDateCrea: '2009-12-07' asDate;
						priorite: 'URGENT';
						typCorrLibelle: 'Roadmap Editeur';
						biblioNom: 'B1');
				add:
					(CIMTicket new
						ftDateCrea: '2014-02-14' asDate;
						priorite: 'CONFORT';
						typCorrLibelle: 'Roadmap Projets Clients';
						biblioNom: 'B1');
				add:
					(CIMTicket new
						ftDateCrea: '2015-09-07' asDate;
						priorite: 'CONFORT';
						typCorrLibelle: 'DIVERS';
						biblioNom: 'B2');
				add:
					(CIMTicket new
						ftDateCrea: '2010-09-07' asDate;
						priorite: 'CONFORT';
						typCorrLibelle: 'Aucune';
						biblioNom: 'B2') ;yourself)
]

{ #category : #tests }
TestPBQueries >> testCIMGroupQueryTopRecurentBibliotheque [
	self
		assert:
			((CIMGroupQueryTopRecurentBibliotheque new treshold: 2)
				runOn: analyser tickets) anyOne
		equals: 'B3'
]

{ #category : #running }
TestPBQueries >> testCIMQueryCorrectiveMaintenance [
	self
		assert: (CIMQueryCorrectiveMaintenance new runOn: analyser tickets) size
		equals: 1
]

{ #category : #running }
TestPBQueries >> testCIMQueryCorrectiveMaintenancePerYear [
	self
		assert:
			(CIMQueryCorrectiveMaintenancePerYear new runOn: analyser tickets)anyOne  key
				 
		equals: 2008 . 
]

{ #category : #tests }
TestPBQueries >> testCIMQueryCorrelationBugCorrectiveMisc [
	self
		assertCollection: (CIMQueryCorrelationBugCorrectiveMisc new runOn: analyser tickets)
		hasSameElements: {'misc' -> 2. 'correction' -> 4 .'bugs' -> 1}
]

{ #category : #running }
TestPBQueries >> testCIMQueryEvolution [
	self
		assert:
			(CIMQueryEvolution  new runOn: analyser tickets )
				size
		equals: 4
]

{ #category : #running }
TestPBQueries >> testCIMQueryMisc [
	self deny: (CIMQueryMisc new runOn: analyser tickets) isEmpty.
	self
		assert: (CIMQueryMisc new runOn: analyser tickets) size
		equals: 2
]

{ #category : #tests }
TestPBQueries >> testGetBibliothequesMostOccurentBetweenBugAndEvolutionPerYear [
	self
		assertCollection:
			(CIMQueryMostOccurentEventPerYearForBibliotheque new
				runOn: analyser tickets
				with: 'B1')
		hasSameElements: {2004 -> 'Evolution'. 2009 -> 'Evolution'. 2014 -> 'Evolution'}
]

{ #category : #running }
TestPBQueries >> testGroupBibliothequeByOccurence [
	self
		assert:
			((CIMOccurenceQuery new
				runOn: analyser tickets
				bibliotheques: #('B1' 'B2' 'B3')) at: 'B1')
		equals: 3
]

{ #category : #tests }
TestPBQueries >> testNumberOfUrgentPerYear [
	| group |
	group := CIMTicketPerYear new
		runOn: (CIMQueryUrgent new runOn: analyser tickets).
	self assert: group size equals: 2.
	self assert: ((group collect:[:each| each value]) flatten includes: analyser tickets third)
]

{ #category : #tests }
TestPBQueries >> testQueryImportant [
	self
		assert: (CIMQueryImportant new runOn: analyser tickets) size
		equals: 1.
	self
		assert: (CIMQueryImportant new runOn: analyser tickets) anyOne ftDateCrea
		equals: '2004-02-15' asDate
]
