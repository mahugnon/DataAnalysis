Class {
	#name : #CIMPBAnalyser,
	#superclass : #Object,
	#instVars : [
		'tickets'
	],
	#classVars : [
		'Tickets'
	],
	#classInstVars : [
		'UniqueInstance'
	],
	#category : #'PBDataAnalyse-Core'
}

{ #category : #accessing }
CIMPBAnalyser class >> default [
	^ self uniqueInstance
]

{ #category : #'instance creation' }
CIMPBAnalyser class >> new [
	self error: 'CIMPBAnalyser is a singleton -- send uniqueInstance instead'
]

{ #category : #'instance creation' }
CIMPBAnalyser class >> uniqueInstance [
	"  UniqueInstance ifNil: [UniqueInstance := self basicNew initialize].
       ^UniqueInstance"

	^ UniqueInstance := self basicNew initialize
]

{ #category : #utility }
CIMPBAnalyser class >> utility [
| data years dataSet b ds |
data:=CSVParser parseFileWithHeader: 'ticketsCIM.csv'.
years:= (data collect: [ :each| (each at:'FT_DATECREA') asDate  year  ]) asSet.
dataSet:=Dictionary new.
years do: [ :each| |tickets|
	tickets:=data select: [ :d| (d at:'FT_DATECREA') asDate  year=each].
	dataSet at: each put:tickets size.
	  ].
dataSet := dataSet select: [ :each|each>2002 ] .
b:=RTGrapher new.
ds:= RTData new.
ds barShape  color: Color blue.
ds points: dataSet .
ds barChartWithBarTitle: [:value| (dataSet keyAtValue: value) asString ].
b add: ds.
b axisX noLabel; noTick.
b 
]

{ #category : #adding }
CIMPBAnalyser >> addTicketsWith:aDictionnary [
tickets add: (CIMTicket createWith:aDictionnary).
]

{ #category : #initialization }
CIMPBAnalyser >> initialize [
	super initialize.
	tickets := OrderedCollection new.
	(CSVParser parseFileWithHeader: 'ticketsCIM.csv')
		do: [ :each | self addTicketsWith: each ]
]

{ #category : #acessing }
CIMPBAnalyser >> tickets [
	^ tickets
]

{ #category : #accessing }
CIMPBAnalyser >> tickets: anObject [
	tickets := anObject
]
