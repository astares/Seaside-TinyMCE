"
An example on how to use the TinyMCE editor in Seaside
"
Class {
	#name : #TMCEExample,
	#superclass : #WAComponent,
	#instVars : [
		'text'
	],
	#category : #'TinyMCE-Examples'
}

{ #category : #initialization }
TMCEExample class >> initialize [
	
	self register
]

{ #category : #registration }
TMCEExample class >> register [

	|app|
	app := WAAdmin register: self asApplicationAt: 'tinymce'.
	app addLibrary: TMCEFileLibrary 
]

{ #category : #defaults }
TMCEExample >> defaultText [

	^'Edit the text and click on "Send to server and display"<br/><h1>Using TinyHTML from Seaside</h1>
<p>Just add <em>TMCEFileLibrary&nbsp;</em>to your Seaside application. Have a look at the class&nbsp;<em>TMCEExample </em>for an example.</p>'
]

{ #category : #initialization }
TMCEExample >> initialize [

	super initialize.
	text := self defaultText
]

{ #category : #rendering }
TMCEExample >> renderContentOn: html [

	html heading: 'TinyMCE Demo'.
	html anchor 
		url: 'http://smalltalkhub.com/#!/~TorstenBergmann/TinyMCE';
		with: 'Read the documentation for more.'.
	html break;break.	
	html form: [ 
		html textArea 
			callback: [ :value | text := value];
			with: text.
		html break.	
		html submitButton: 'Send to server and display'.	
	].
	html break; horizontalRule.	
	html html: text.

	"Add the script to run TinyMCE"	
	html script: ' tinymce.init({selector:''textarea''});'
]
