"
Baseline for https://github.com/astares/Seaside-TinyMCE project
"
Class {
	#name : #BaselineOfTinyMCE,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyMCE
}

{ #category : #baseline }
BaselineOfTinyMCE >> baseline: spec [ 
	<baseline>
	
	spec for: #'common' do: [ 
		self seaside: spec.
		
		spec 
			package: 'TinyMCE-Core' with: [ spec requires: #('Seaside3') ];
			package: 'TinyMCE-Examples' with: [ spec requires: #('TinyMCE-Core') ].

		spec 
			group: 'Core' with: #('TinyMCE-Core');
			group: 'Examples' with: #('TinyMCE-Examples');
			group: 'all' with: #('Core' 'Examples');
			group: 'default' with: #('all').
	]

]

{ #category : #baseline }
BaselineOfTinyMCE >> seaside: spec [

	spec
			baseline: 'Seaside3'
        	with: [ 
				spec
					loads: #('default');
					repository: 'github://SeasideSt/Seaside:master/repository' ]
]
