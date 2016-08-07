"""
Because Introduction to Algorithms (Cormen et al.) include priority queues in
their discussion of heap sort, I have made a separate heap.py file,
as I do not want to clutter the sorting.py file too much.
so here we have routines to establish and maintain the heap, as well as
heapsort itself and a priority queue function.
As in sorting.pY, the intention is to closely duplicate the pseudocode from
the book, and again, print statements will be interleaved into the code to help
students understand how the algorithms works.
We will allow max or min heaps based on a passed comparison operator.
This file contains:
    parent()
    left()
    right()
    heapify()
    build_heap()
    heapsort()
    heap_insert()
    heap_extract_max()
    heap_increase_key()
    heap_maximum()
"""

import sorting as srt   # so we don't have to duplicate swap!


"""
Next come three functions to navigate the heap:
"""
def parent(i):
    """
        Args:
            i: the index of the child

        Returns:
            The index of the parent.

    """
    return i // 2

def left(i):
    """
        Args:
            i: the index of the parent

        Returns:
            The index of the left child.

    """
    return 2 * i

def right(i):
    """
        Args:
            i: the index of the parent

        Returns:
            The index of the right child.

    """
    return 2 * i + 1


def heapify(h, i, heapsize):
    """
        In the text book, there is a max-heapify function.
        and a separate function would be needed for min-heapify.
        But we can easily combine them into one function, and
        just pass in the operator we need to differentiate 
        a max heap from a min heap.
        for my first crack, I am just assuming max, but I will return
        to these functions, and rewrite them with a passed
        in operator.

        Args:
            h: the list containing the heap.
            i: the node that might violate the heap property.
            heapsize: the size of the heap

        Returns:
            None
    """
    l = left(i)
    r = right(i)
    largest = i
    print("heapifying with i = " + str(i) + " and " +
            "left = " + str(l) + " and right = " + str(r))
    if l < heapsize and h[l] > h[i]:
        largest = l
    if r < heapsize and h[r] > h[largest]:
        largest = r
    if largest != i:
        print("Swapping elements " + str(i) + " and " +
                str(largest))
        srt.swap(h, i, largest)
        heapify(h, largest, heapsize)


def build_heap(h, heapsize=None):
    """
        Args:
            h: the list to heapify.

        Returns:
            None
            The heap is built in place.
    """
    if heapsize is None:
        heapsize = len(h)
    for i in range((heapsize // 2) - 1, 0, -1):
        print("heapifying with i = " + str(i))
        heapify(h, i, heapsize)


def heapsort(h):
    """
        Args:
            h: the list to heap sort

        Returns:
            None
            Sorts in place.
    """
    heapsize = len(h)
    build_heap(h, heapsize)
    for i in range(len(h) - 1, 1, -1):
        print("Swapping " + str(h[0]) + " and " + str(h[i]))
        srt.swap(h, 0, i)
        heapsize -= 1
        heapify(h, 0, heapsize)
