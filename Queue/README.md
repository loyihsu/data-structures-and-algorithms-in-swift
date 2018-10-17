# Queue

A queue is a specialized array that elements are pushed to the rear end and pop from the front end (First In First Out).

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialize

```swift
let myQueueName = Queue()
```

### Push & Pop

To add an element to the rear end of the Queue, you have to push it to the Queue.

```swift
myQueueName.Push(element: /*Your data*/)
```

To delete the Front element of the Queue, you have to pop it.

```swift
myQueueName.Pop()
```

### Get the Front and Rear element

To get the element at the front end, call the Front() function.

```swift
myQueueName.Front()
```

To get the element at the rear end, call the Rear() function.

```swift
myQueueName.Rear()
```

### Get the size and whether the Queue is empty

To get the size of the Queue, get the variable 'size' with the following command:
```swift
myQueueName.size
```

To get whether the Queue is empty, get the variable 'isEmpty' with the following command:
```swift
myQueueName.isEmpty
```
