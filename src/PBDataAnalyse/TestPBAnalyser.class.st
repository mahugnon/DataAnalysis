Class {
	#name : #TestPBAnalyser,
	#superclass : #TestCase,
	#instVars : [
		'analyser'
	],
	#category : #'PBDataAnalyse-Tests'
}

{ #category : #running }
TestPBAnalyser >> setUp [
	super setUp.
	analyser := CIMPBAnalyser new.
	analyser
		tickets:
			(OrderedCollection new
				add:
					(CIMTicket new
						ftDateCrea: '2004-02-15' asDate;
						priorite: 'IMPORTANT');
				add:
					(CIMTicket new
						ftDateCrea: '2001-05-1' asDate;
						priorite: 'TRES IMPORTANT');
				add:
					(CIMTicket new
						ftDateCrea: '2008-12-07' asDate;
						priorite: 'URGENT');
				add:
					(CIMTicket new
						ftDateCrea: '2014-02-14' asDate;
						priorite: 'CONFORT');
				yourself)
]

{ #category : #tests }
TestPBAnalyser >> testTheFirstElementShouldBeImportantTicket [
	| cIMimportant |
	cIMimportant := CIMImportant create: analyser tickets.
	self assert: cIMimportant tickets size equals: 1.
	self
		assert: cIMimportant tickets
		equals: analyser tickets first asOrderedCollection
]

{ #category : #tests }
TestPBAnalyser >> testTheyShouldBe3ticketFrom2004 [
	self assert: (analyser ticketsFrom: 2004) size equals: 3
]
