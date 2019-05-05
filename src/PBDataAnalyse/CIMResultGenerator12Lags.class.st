Class {
	#name : #CIMResultGenerator12Lags,
	#superclass : #CIMResultGenerator,
	#category : #'PBDataAnalyse-Utils'
}

{ #category : #'as yet unclassified' }
CIMResultGenerator12Lags >> grangerFolder [
	 1 to: 12 do: [ :i | 
		(self resultPath / ('GrangerTestResult' , i asString , 'Lag'))
			ensureCreateDirectory ]
]
