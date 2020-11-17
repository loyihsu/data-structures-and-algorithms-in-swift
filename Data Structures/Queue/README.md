# Queue

A queue is a specialized collection that elements are enqueued to the rear end and dequeued from the front end (First In First Out).

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialize

```swift
let myQueueName = Queue</*Type*/>.init()
```

`Type` can be filled in with any data type such as `Int`.

### Enqueue & Dequeue

To add an element to the rear end of the Queue, you have to enqueue it to the Queue.

```swift
myQueueName.enqueue(/*Your data*/)
```

To delete the Front element of the Queue, you have to dequeue it. It would also return the removed element.

```swift
myQueueName.dequeue()
```

### Get the Front and Rear element

To get the element at the front end, call the front variable.

```swift
myQueueName.front
```

To get the element at the rear end, call the rear variable.

```swift
myQueueName.rear
```

### Get the size and whether the Queue is empty

To get the size of the Queue, get the variable 'count' with the following command:
```swift
myQueueName.count
```

To get whether the Queue is empty, get the variable 'isEmpty' with the following command:
```swift
myQueueName.isEmpty
```
