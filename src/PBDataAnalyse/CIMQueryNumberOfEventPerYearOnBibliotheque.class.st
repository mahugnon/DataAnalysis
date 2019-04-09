Class {
	#name : #CIMQueryNumberOfEventPerYearOnBibliotheque,
	#superclass : #CIMQueryComposedOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #'as yet unclassified' }
CIMQueryNumberOfEventPerYearOnBibliotheque >> eventQuery [
	^ self subclassResponsibility
]

{ #category : #running }
CIMQueryNumberOfEventPerYearOnBibliotheque >> runOn: aCollection with: aBibliothequeName [
	^ ((CIMTicketPerYear new
		runOn:
			(self eventQuery new
				runOn:
					(CIMQueryBibliotheque new
						queryName: aBibliothequeName;
						runOn: aCollection)))
		collect: [ :ass | ass key -> ass value size ]) asDictionary
]
