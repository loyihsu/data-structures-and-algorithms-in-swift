# Doubly Linked List

The doubly linked list is a kind of linked list that is composed of nodes that not only store data, but also point to the next and the previous node.

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialize

To create a Singly Linked List:

```swift
let myListName = DoublyLinkedList()
```

### Insert to the list

You can insert from either the `head` or the `tail` of the list.

#### Insert from the head of the list

To insert from the head of the list, you can use the `prepend` function:

```swift=
myListName.prepend(/* Your value */)
```

#### Insert to the tail of the list

To insert to the tail of the list, you can use the `append` function:

```swift=
myListName.append(/* Your value */)
```

### Remove from the list

As in the insertion functions, you can also remove elements from the head or tail of the list. At the same time, if you have the `Node` object, you can also specify the object to be removed directly.

#### Remove from the head of the list

To remove from the head to the lis, you can use the `popHead` function:

```swift=
myListName.popHead()
```

#### Remove from the tail of the list

To remove from the tail of the list, you can use the `popTail` function:

```swift=
myListName.popTail()
```

#### Remove the specified Node

To remove a specified Node, you can use the `remove` function:

```swift=
myListName.remove(/* Specify your node */)
```

### Access data

You can directedly get the `head` and `tail` elements in the following way:

```swift=
myListName.head
myListName.tail
```

Each list node is composed of a `value` field, the `prev` node and the `next` node. Therefore, you can have access to the whole list with the head and the next and previous elements of each node.

If you want to print out the list, you can call the predefined `printList` function:

```swift=
myListName.printList()
```

### To clear the list

To clear the list, simply call the `clear` function.

```swift=
myListName.clear()
```

### To reverse the list

To reverse the list, you can call the `reverse` function.

```swift=
myListName.reverse()
```

### To get whether the list is empty

To check whether the list is empty, you can call the `isEmpty` variable.

```swift=
myListName.isEmpty
```
