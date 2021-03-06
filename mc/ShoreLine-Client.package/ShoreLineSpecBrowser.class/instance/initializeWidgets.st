initialization
initializeWidgets

	filter := self newTextInput ghostText: 'Filter'.
	goButton := self newButton icon: (Smalltalk ui icons iconNamed: #glamorousGo).
	cleanButton := self newButton icon: (Smalltalk ui icons iconNamed: #changeRemove).
	refreshButton := self newButton icon: (Smalltalk ui icons iconNamed: #refresh).
	list := "self newMultiColumnList"self newTree
		multiSelection: false;
		columns: (self class columns pairsCollect: [ :label :block | TreeColumnModel new
			headerLabel: label;
			displayBlock: [ :item | block value: item content ] ]);
		yourself.
		
	details := self newBugStreamViewer.
	
	"list columns: #(uno due tre)."
	list displayBlock: [ :eachReport | {
		eachReport summary.
		(eachReport date) asDateAndTime asLocal asDate asString.
		(eachReport date) asDateAndTime asLocal asTime print24.
		(eachReport status).
		(eachReport author) } ]