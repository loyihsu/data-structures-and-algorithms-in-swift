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
myStackName.push(/*Your data*/)
```

To delete the Top element in the Stack, you have to pop it. It would also return the removed element.

```swift
myStackName.pop()
```

### Get the top element

```swift
myStackName.top
```

### Get the size and whether the Stack is empty

To get the size of the Stack, get the variable 'size' with the following command:
```swift
myStackName.count
```

To get whether the Stack is empty, get the variable 'isEmpty' with the following command:
```swift
myStackName.isEmpty
```
