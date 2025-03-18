Class {
	#name : 'RFCell',
	#superclass : 'CMSpatialEntityElement',
	#category : 'Robot-Model',
	#package : 'Robot-Model'
}

{ #category : 'as yet unclassified' }
RFCell >> getMineral [

	self hasMineral ifFalse: [ self error: 'This cell has no minerals' ].
	^ (self occupantsOfClass: RFMineral) first
]

{ #category : 'testing' }
RFCell >> hasMineral [

	^ self hasOccupantsOfClass: RFMineral
]

{ #category : 'accessing' }
RFCell >> pov [
    <pov>
    ^ CMPointOfView color: Color lightGray
]
