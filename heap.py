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
    heap_extract_next()
    heap_increase_key()
    heap_maximum()
"""

import operator as op

import sorting as srt   # so we don't have to duplicate swap!


# do we have a max heap or min heap?
MIN = 0
MAX = 1

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
    return (i - 1) // 2

def left(i):
    """
        Args:
            i: the index of the parent

        Returns:
            The index of the left child.

    """
    return 2 * i + 1

def right(i):
    """
        Args:
            i: the index of the parent

        Returns:
            The index of the right child.

    """
    return 2 * i + 2


def heapify(h, i, heapsize=None, min_or_max=MAX):
    """
        In the text book, there is a max-heapify function.
        and a separate function would be needed for min-heapify.
        But we can easily combine them into one function, and
        just pass in the operator we need to differentiate 
        a max heap from a min heap.

        Args:
            h: the list containing the heap.
            i: the node that might violate the heap property.
            heapsize: the size of the heap
            min_or_max: are we dealing with a max heap or min heap?

        Returns:
            None
    """
    if heapsize is None:
        heapsize = len(h)

    if min_or_max == MAX:
        print("Max heapifying.")
        comp = op.gt
    else:
        print("Min heapifying.")
        comp = op.lt

    l = left(i)
    r = right(i)
    largest = i
    print("heap = " + str(h))
    print("heapifying with i = " + str(i) + " and " +
            "left = " + str(l) + " and right = " + str(r))
    if l < heapsize and comp(h[l], h[i]):
        print("Largest was: " + str(largest)
                + " setting largest to: " + str(l))
        largest = l
    if r < heapsize and comp(h[r], h[largest]):
        print("Largest was: " + str(largest)
                + " setting largest to: " + str(r))
        largest = r
    if largest != i:
        print("Swapping elements " + str(i) + " and " +
                str(largest))
        srt.swap(h, i, largest)
        heapify(h, largest, heapsize)


def build_heap(h, heapsize=None, min_or_max=MAX):
    """
        Args:
            h: the list to heapify.
            min_or_max: are we creating a max heap or a min heap?

        Returns:
            None
            The heap is built in place.
    """
    if heapsize is None:
        heapsize = len(h)
    for i in range((heapsize // 2), -1, -1):
        heapify(h, i, heapsize, min_or_max)


def heapsort(h, min_or_max=MAX):
    """
        Args:
            h: the list to heap sort
            min_or_max: are we sorting a max heap or a min heap?

        Returns:
            sorted: sorted list

        Performance: O(n log n)
    """
    sorted = []
    while len(h) > 0:
        print("heapsort; heapsize = " + str(len(h)))
        build_heap(h, len(h), min_or_max)
        # put the max item in sorted
        sorted.append(h[0])
        # then trim the max item out of the list
        h = h[1:]
    return sorted

"""
The functions from here down are used for priority queues.
"""

def heap_min_or_max(h):
    """
        Args:
            h: the heap
            
        Returns:
            The minimum or maximum value, depending on whether we
            have a min or max heap.

    """
    return h[0]


def heap_extract_next(h, min_or_max=MAX):
    """
        The book calls heapify in this function. But I found
        calling build_heap() works, while calling heapify()
        does not!

        Args:
            h: the heap
            min_or_max: are we dealing with a max heap or a min heap?
            We need this parameter to pass on to heapify().

        Returns:
            The minimum or maximum value, depending on whether we
            have a min or max heap.
            Since we are here implementing priority queues, we can
            call this the "next" item.
    """
    if len(h) < 1:
        print("Heap empty!")
        return None

    m = h[0]
    h[0] = h[len(h) - 1]
    del h[len(h) - 1]
    build_heap(h, min_or_max=min_or_max)
    return m
