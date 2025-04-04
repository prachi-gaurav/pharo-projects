Class {
	#name : 'MyStack',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'topIndex'
	],
	#category : 'DS-Stack-Queue',
	#package : 'DS-Stack-Queue'
}

{ #category : 'accessing' }
MyStack >> capacity [
    "Return the current capacity of stack."
    ^elements size.
]

{ #category : 'initialization' }
MyStack >> initialize [
    "Stack size is of 10 elements"
    elements := Array new: 10.
    topIndex := 0. "empty stack"
]

{ #category : 'testing' }
MyStack >> isEmpty [
    "Return true if stack has no elements"
    ^topIndex = 0.
]

{ #category : 'testing' }
MyStack >> isFull [
    "Return true if stack is full at max capacity"
    ^topIndex = elements size.
]

{ #category : 'accessing' }
MyStack >> peek [
    "Display element at top of stack"
    self isEmpty ifTrue: [ self error: 'Stack is empty' ].
    ^elements at: topIndex.
]

{ #category : 'operations' }
MyStack >> pop [
    | poppedValue |
    self isEmpty ifTrue: [ self error: 'Stack underflow' ]. "Remove and return the top element. Error if empty."
    poppedValue := elements at: topIndex.
    elements at: topIndex put: nil. 
    topIndex := topIndex - 1.
    ^poppedValue.
]

{ #category : 'operations' }
MyStack >> push: anElement [
    "Add element to top of stack"
    self isFull ifTrue: [ self resize ]. "Resize stack if full"
    topIndex := topIndex + 1.
    elements at: topIndex put: anElement.
]

{ #category : 'private' }
MyStack >> resize [
    "Double stack's capacity if full."
    | newElements |
    newElements := Array new: elements size * 2.
    1 to: elements size do: [ :i | newElements at: i put: (elements at: i) ].
    elements := newElements.
]
