Class {
	#name : #CIMTicketPerMonth,
	#superclass : #CIMQueryOnTickets,
	#category : #'PBDataAnalyse-Queries'
}

{ #category : #running }
CIMTicketPerMonth >> fileMonthGap: ticketsPerMonth [
	(ticketsPerMonth keys min to: ticketsPerMonth keys max)
		monthsDo: [ :each | ticketsPerMonth at: each ifAbsentPut: Set new ]
]

{ #category : #running }
CIMTicketPerMonth >> runOn: aCollection [
	| ticketsPerMonth |
	ticketsPerMonth := aCollection groupedBy: [ :ticket | ticket month ].
	ticketsPerMonth ifNotEmpty: [ self fileMonthGap: ticketsPerMonth ].
	^ (ticketsPerMonth associations sorted: [ :a :b | a key <= b key ])
		asOrderedDictionary
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
	(self clean: (self runOn: aCollection))
		do: [ :each | 
			file
				writeStreamDo: [ :aStream | 
					aStream setToEnd.
					each key printOnFile: aStream.
					aStream nextPut: $,.
					each value size printOnFile: aStream.
					aStream nextPut: Character cr ] ]
]
