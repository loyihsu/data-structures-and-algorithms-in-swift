# Heap

Heap is a special Priority Queue that is often implemented with an array and visualised as a nearly complete Binary Tree. A max heap is a heap with each parent >= its children; a min heap is a heap with each parent <= its children.

## How to use this?

Add the Swift file to your project and you can use the functions.

### Initialise

```swift=
let heap = Heap.init() // This would generate a max heap.
let minHeap = Heap.init(mode: "min") // This would generate a min heap.
```

You can also create a heap from an existing array.

```swift=
let array = [2, 5, 1, 4, 3]
let heap = Heap.init(array, mode: "min")    // This would create a min heap from the array
let maxHeap = Heap.init(array)  // This would create a max heap from the array.
```

### Insert an item into the heap

You can use the insert function to insert an item into the heap.

```swift=
heap.insert(/* Your item goes here. */)
```

### The Root Item

You can access the root item with `root` without extracting it.

```swift=
heap.root
```

If you want to extract the item, use `extractRoot()`.

```swift=
heap.extractRoot()
```

### Get the size and whether the Heap is empty

To get the size of the Heap, get the variable 'count' with the following command:

```swift=
heap.count
```

To get whether the Heap is empty, get the variable 'isEmpty' with the following command:

```swift=
heap.isEmpty
```
