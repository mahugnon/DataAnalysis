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
TestPBAnalyser >> testExtactGrangerResultFromTestFile [
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test1.txt')
		equals: 0.04169.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test2.txt')
		equals: 0.0003314.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test3.txt')
		equals: 0.1782.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test4.txt')
		equals: 0.09286.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test5.txt')
		equals: 0.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/test6.txt')
		equals: 2.2e-16
]

{ #category : #tests }
TestPBAnalyser >> testGrangerTestProvideTheRightOutput [
	CIMRAnalyserMoqueEntity new runGranger.
	self
		assert:
			(CIMResultGenerator new repoPath / 'test/testGrangerResult.txt')
				exists
		equals: true.
	self
		assert: (CIMResultGenerator new repoPath / 'test/output.txt') exists
		equals: true.
	self
		assert: (CIMResultGenerator new repoPath / 'test/errors.txt') exists
		equals: true.
	self
		assert:
			(CIMGrangerResult new
				extactGrangerResultFromFile: CIMResultGenerator new repoPath / 'test/testGrangerResult.txt')
		equals: 0.4015
]

{ #category : #tests }
TestPBAnalyser >> testTheyShouldBe3ticketFrom2004 [
	self assert: (analyser ticketsFrom: 2004) size equals: 3
]
