Class {
	#name : #CIMResultGui,
	#superclass : #ComposablePresenter,
	#instVars : [
		'runAllButton',
		'runGrangerTestButton',
		'grangerLag',
		'runButton',
		'guiContext'
	],
	#category : #'PBDataAnalyseGui-presenter'
}

{ #category : #specs }
CIMResultGui class >> defaultSpec [
	^ SpecTableLayout column
		newRow: [ :row | 
			row
				add: #runAllButton;
				add: #runGrangerTestButton ];
		add: #grangerLag;
		add: #runButton;
		yourself
]

{ #category : #specs }
CIMResultGui class >> run [
	<example>
	self new openWithSpec
]

{ #category : #api }
CIMResultGui >> extent [
	^ 350 @ 200
]

{ #category : #accessing }
CIMResultGui >> grangerLag [
	^ grangerLag
]

{ #category : #accessing }
CIMResultGui >> guiContext [
	^ guiContext
]

{ #category : #initialization }
CIMResultGui >> initializePresenter [
	runAllButton
		whenActivatedDo: [ self guiContext runStrategy: RunAllStrategy ].
	runGrangerTestButton
		whenActivatedDo: [ self guiContext runStrategy: RunGrangerStrategy ].
	runButton
		action: [ self guiContext
				lags: grangerLag text;
				run ]
]

{ #category : #initialization }
CIMResultGui >> initializeWidgets [
	guiContext := CIMGuiContext new.
	runAllButton := self newRadioButton label: 'Run All'.
	runGrangerTestButton := self newRadioButton
		label: 'Run only GrangerTest'.
	RadioButtonGroup new
		addRadioButton: runAllButton;
		addRadioButton: runGrangerTestButton.
	grangerLag := self newTextInput ghostText: 'GrangerTest lag'.
	runButton := self newButton label: 'RUN'
]

{ #category : #accessing }
CIMResultGui >> runAllButton [
	^ runAllButton
]

{ #category : #accessing }
CIMResultGui >> runButton [
	^ runButton
]

{ #category : #accessing }
CIMResultGui >> runButton: anObject [
	runButton := anObject
]

{ #category : #accessing }
CIMResultGui >> runGrangerTestButton [
	^ runGrangerTestButton
]

{ #category : #api }
CIMResultGui >> title [
	^ 'CIM Tickets Analyse'
]
