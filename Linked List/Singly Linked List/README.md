# Singly Linked List

The singly linked list is a kind of linked list that is composed of nodes that not only store data, but also point to the next node.

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialize

To create a Singly Linked List:

```swift
let myListName = SinglyLinkedList()
```

### Insert to the list

Three methods are implemented to insert to the list:

1. Insert to the head

```swift
myListName.pushHead(data: /*your data*/)
```

2. Insert to the tail

```swift
myListName.pushTail(data: /*your data*/)
```

3. Insert at the selected index

```swift
myListName.insertAt(index: /*Index 0...(length-1)*/, data: /*your data*/)
```

### Remove from the list

1. Remove from the head

```swift
myListName.popHead()
```

2. Remove from the tail

```swift
myListName.popTail()
```

3. Remove at the selected index

```swift
myListName.removeAt(index: /*Index 0...(length-1)*/)
```

### Access the elements

You can access the elements in the following ways:

1. To access an element at index, you can use subscript:

```swift
myListName[/*index*/]
```

You can also change the value of the element at the index in the following way:

```swift
myListName[/*index*/]?.data = /*updated data*/
```

Notice that if you want to access the data with this method, you will have to write:

```swift
myListName[/*index*/]?.data
```

2. You can directedly get the head and tail elements in the following way:

```swift
myListName.head
myListName.tail
```

Each list node is composed of a data field and the next node. Therefore, you can have access to the whole list with the head and the next element of each node.

3. If you want to print out the list, you can call the predefined printList() function:

```swift
myListName.printList()
```

### To clear the list

To clear the list, simply call the clear() function.

```swift
myListName.clear()
```

Notice that this function is different from the isEmpty() function, which returns a Bool indicating whether or not the list is empty.

```swift
myListName.isEmpty()
```

### To get the length of the list

To get the length of the list:

```swift
myListName.length
```
