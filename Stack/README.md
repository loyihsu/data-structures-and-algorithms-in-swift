# Stack

A stack is a specialized array that elements are pushed and popped from the same end (Last In First Out).

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialize

```swift
let myStackName = Stack()
```

### Push & Pop

To add an element to the Stack, you have to push it to the Stack.

```swift
myStackName.Push(element: /*Your data*/)
```

To delete the Top element in the Stack, you have to pop it.

```swift
myStackName.Pop()
```

### Get the top element

```swift
myStackName.Top()
```

### Get the size and whether the Stack is empty

To get the size of the Stack, you will call the Size() function.
```swift
myStackName.Size()
```

To get whether the Stack is empty, call the isEmpty() function.
```swift
myStackName.isEmpty()
```
