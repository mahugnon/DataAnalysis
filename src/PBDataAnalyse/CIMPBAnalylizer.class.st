Class {
	#name : #CIMPBAnalylizer,
	#superclass : #Object,
	#category : #PBDataAnalyse
}

{ #category : #utility }
CIMPBAnalylizer class >> utility [
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
