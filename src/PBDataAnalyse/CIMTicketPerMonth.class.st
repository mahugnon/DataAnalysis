Class {
	#name : #CIMTicketPerMonth,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMTicketPerMonth >> runOn: aCollection [
	| tmp |
	tmp := aCollection groupedBy: [ :ticket | ticket month ].
	^ tmp associations sorted: [ :a :b | a key <= b key ]
]

{ #category : #'as yet unclassified' }
CIMTicketPerMonth >> runOn: aCollection print: aFile [
	| file |
	file := aFile asFileReference.
	file
		writeStreamDo: [ :aStream | 
			aStream
				nextPutAll: 'Month';
				nextPut: $,;
				nextPutAll: 'value';
				nextPut: Character cr ].
	(self runOn: aCollection)
		do: [ :each | 
			file
				writeStreamDo: [ :aStream | 
					aStream setToEnd.
					each key printOn: aStream.
					aStream
						nextPut: $,.
						 each value size printOn: aStream.
						aStream nextPut: Character cr ] ]
]
