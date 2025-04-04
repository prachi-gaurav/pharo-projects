Class {
	#name : 'MyQueue',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'frontIndex',
		'rearIndex',
		'size'
	],
	#category : 'DS-Stack-Queue',
	#package : 'DS-Stack-Queue'
}

{ #category : 'removing' }
MyQueue >> dequeue [
    "Remove & return the front element of circular queue."
	 | dequeuedValue |
    self isEmpty ifTrue: [ self error: 'Queue underflow' ].
    dequeuedValue := elements at: frontIndex.
    elements at: frontIndex put: nil. 
    frontIndex := (frontIndex \\ elements size) + 1.
    size := size - 1.
    ^dequeuedValue.
]

{ #category : 'adding' }
MyQueue >> enqueue: anElement [
    "Add to the rear of circular queue."
    self isFull ifTrue: [ self resize ].
    rearIndex := (rearIndex \\ elements size) + 1. "increment logic for circular queue"
    elements at: rearIndex put: anElement.
    size := size + 1.
]

{ #category : 'initialization' }
MyQueue >> initialize [
    "Queue size is of 10 elements"
    elements := Array new: 10.
    frontIndex := 1. 
    rearIndex := 0.
    size := 0.
]

{ #category : 'testing' }
MyQueue >> isEmpty [
    "Return true if queue is empty"
    ^size = 0.
]

{ #category : 'testing' }
MyQueue >> isFull [
    "Return true if queue is full"
    ^size = elements size.
]

{ #category : 'accessing' }
MyQueue >> peek [
    "Return front element of queue"
    self isEmpty ifTrue: [ self error: 'Queue is empty' ].
    ^elements at: frontIndex.
]
