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
						biblioNom: 'B1');
				add:
					(CIMTicket new
						ftDateCrea: '2001-05-1' asDate;
						priorite: 'TRES IMPORTANT';
						biblioNom: 'B2');
				add:
					(CIMTicket new
						ftDateCrea: '2008-12-07' asDate;
						priorite: 'URGENT';
						biblioNom: 'B3');
				add:
					(CIMTicket new
						ftDateCrea: '2009-12-07' asDate;
						priorite: 'URGENT';
						biblioNom: 'B1');
				add:
					(CIMTicket new
						ftDateCrea: '2014-02-14' asDate;
						priorite: 'CONFORT';
						biblioNom: 'B1');
				yourself)
]

{ #category : #tests }
TestPBQueries >> testGetBibliotheques [
	self
		assertCollection: (CIMQueryBibliotheque new runOn: analyser tickets)
		hasSameElements: #('B1' 'B2' 'B3')
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
	self assert: (group values flatten includes: analyser tickets third)
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

{ #category : #running }
TestPBQueries >> testTicketsForBibNamedB1ShouldBe3 [
	self
		assert:
			(CIMQueryBibliotheque new runOn: analyser tickets bibliotheque: 'B1')
				size
		equals: 3
]
