Class {
	#name : #CIMTestResourcesExistance,
	#superclass : #TestCase,
	#category : #'PBDataAnalyse-Tests'
}

{ #category : #tests }
CIMTestResourcesExistance >> testFindCIMTicketsRessourceExists [
	self
		assert:
			((CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles/ticketsCIM.csv' ) exists
		equals: true
]

{ #category : #tests }
CIMTestResourcesExistance >> testFindCSVRessourceExists [
	self
		assert:
			((CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles') exists
		equals: true
]

{ #category : #tests }
CIMTestResourcesExistance >> testFindRRessourceExists [
	self assert:  ((CIMIceBergProjectLocator new locationOfProjectRepo:'PBDataAnalyse')/'R')exists equals: true. 
]

{ #category : #tests }
CIMTestResourcesExistance >> testFindSizeCountRessourceExists [
	self
		assert:
			((CIMIceBergProjectLocator new locationOfProjectRepo: 'PBDataAnalyse')
				/ 'CSVFiles/sizeCount.csv') exists
		equals: true
]

{ #category : #tests }
CIMTestResourcesExistance >> testGrangerScriptExists [
	self assert: CIMRAnalyser new grangerScriptPath exists equals: true
]

{ #category : #'as yet unclassified' }
CIMTestResourcesExistance >> testRInPath [
self assert: CIMRAnalyser new isRInPath equals: true
]
