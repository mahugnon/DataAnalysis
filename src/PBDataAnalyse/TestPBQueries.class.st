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
						ftDateCrea: '2014-02-14' asDate;
						priorite: 'CONFORT';
						biblioNom: 'B1');
				yourself)
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
