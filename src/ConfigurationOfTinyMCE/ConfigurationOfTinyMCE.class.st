"
# TinyMCE for Seaside

## Project info

The ""TinyMCE for Seaside"" project provides the [TinyMCE][1] editor libraries for use in Seaside applications.

### Project location
The project is located on STHub at [http://smalltalkhub.com/#!/~TorstenBergmann/TinyMCE][2]

### Demo

You can checkout an online demo on [http://pharo.pharocloud.com/tinymce][3]

### License
The Smalltalk code is under MIT License. Note that TinyMCE has an LGPL license.

## Installation
First install Seaside into your Pharo image by installing it from the Configuration Browser.

Now you can install the packages necessary for TinyMCE by evaluating:

    Gofer new
        url: 'http://smalltalkhub.com/mc/TorstenBergmann/TinyMCE/main';
        package: 'ConfigurationOfTinyMCE';
        load.
    ((Smalltalk at: #ConfigurationOfTinyMCE) project stableVersion) load.

## How to use
### Add the file library

As usual you should create a subclass of WAComponent for an own Seaside web application component. To use the library just register it with your Seaside application.

    register
        |app|
	    app := WAAdmin register: self asApplicationAt: 'tinymce'.
	    app addLibrary: TMCEFileLibrary 

### Render the editor component

To render the editor component you just need a textArea tag in your generated HTML code and modify it to be a TinyMCE Editor using a simple JavaScript. Here is an example Seaside rendering method:

    renderContentOn: html

	    html heading: 'TinyMCE Demo'.
    	html form: [ 
	    	html textArea 
	       		callback: [ :value | text := value];
	    		with: text.
	    	html break.	
	    	html submitButton: 'Send to server and display'.	
    	].
    	html break; horizontalRule.	
	    html html: text.

    	""Add the script to run TinyMCE""	
    	html script: ' tinymce.init({selector:''textarea''});'

Check out the [TinyMCE][4] documentation for more.

## Run locally

After starting the Seaside server you can check out the example at

    http://localhost:8080/tinymce
    


  [1]: http://www.tinymce.com/
  [2]: http://smalltalkhub.com/#!/~TorstenBergmann/TinyMCE
  [3]: http://pharo.pharocloud.com/tinymce
  [4]: http://www.tinymce.com/
"
Class {
	#name : #ConfigurationOfTinyMCE,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfTinyMCE
}

{ #category : #'development support' }
ConfigurationOfTinyMCE class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfTinyMCE class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfTinyMCE class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfTinyMCE class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfTinyMCE class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfTinyMCE class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfTinyMCE class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfTinyMCE class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfTinyMCE class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfTinyMCE class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfTinyMCE >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/TinyMCE/main/'.
		spec 
			package: #'TinyMCE-Core';
			package: #'TinyMCE-Examples' with: [
				spec requires: #(#'TinyMCE-Core' ). ].
		spec 
			group: 'Core' with: #(#'TinyMCE-Core' );
			group: 'Examples' with: #(#'TinyMCE-Examples' ). ].

]

{ #category : #accessing }
ConfigurationOfTinyMCE >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #baselines }
ConfigurationOfTinyMCE >> dev: spec [
	<version: #'dev'>

	spec for: #'common' do: [ 
		spec
			baseline: 'TinyMCE' with: [ 
				spec 
					className: 'BaselineOfTinyMCE';
					repository: 'github://astares/Seaside-TinyMCE:master/src' ]]
]

{ #category : #'symbolic versions' }
ConfigurationOfTinyMCE >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: 'dev'
]

{ #category : #accessing }
ConfigurationOfTinyMCE >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfTinyMCE >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.1.0'
]

{ #category : #versions }
ConfigurationOfTinyMCE >> version010: spec [
	<version: '0.1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1.0'.
		spec author: 'TorstenBergmann'.
		spec timestamp: '8/13/2014 11:03'.
		spec 
			package: #'TinyMCE-Core' with: 'TinyMCE-Core-TorstenBergmann.1';
			package: #'TinyMCE-Examples' with: 'TinyMCE-Examples-TorstenBergmann.2'. ].

]

{ #category : #versions }
ConfigurationOfTinyMCE >> version020: spec [
	<version: '0.2.0'>

	spec for: #'common' do: [ 
		spec
			baseline: 'TinyMCE' with: [ 
				spec 
					className: 'BaselineOfTinyMCE';
					repository: 'github://astares/Seaside-TinyMCE:0.2.0/src' ]]
]
