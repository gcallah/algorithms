"""
Because Introduction to Algorithms (Cormen et al.) include priority queues in
their discussion of heap sort, I have made a separate heap.py file,
as I do not want to clutter the sorting.py file too much.
so here we have routines to establish and maintain the heap, as well as
heapsort itself and a priority queue function.
As in sorting.pY, the intention is to closely duplicate the pseudocode from
the book, and again, print statements will be interleaved into the code to help
students understand how the algorithms work.
We will allow max or min heaps based on a passed comparison operator.
This file contains:
    get_sentinel()
    get_opt()
    parent()
    left()
    right()
    heapify()
    build_heap()
    heapsort()
    heap_insert()
    heap_extract_next()
    heap_find_place()
"""

import operator as op

import getting_started as srt   # so we don't have to duplicate swap!


# do we have a max heap or min heap?
MIN = 0
MAX = 1


def get_sentinel(min_or_max=MAX):
    """
        Args:
            min_or_max: max heap or min heap?

        Returns:
            Which sentinel we need to use.

    """
    if min_or_max == MAX:
        return srt.MIN_SENTINEL
    else:
        return srt.MAX_SENTINEL

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


def get_opt(min_or_max):
    """
        Args:
            min_or_max: Are we dealing with a min or max heap?

        Returns:
            The proper operator to deal with our heap type.
    """
    if min_or_max == MAX:
        return op.gt
    else:
        return op.lt


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

    comp = get_opt(min_or_max)

    l = left(i)
    r = right(i)
    largest = i
    print("\n*********\nheap in progress = " + str(h))
    print("heapifying with i = " + str(i) + " and " +
            "left = " + str(l) + "; right = " + str(r)
            + "; heapsize = " + str(heapsize))
    if l < heapsize and comp(h[l], h[i]):
        print("Largest was: " + str(h[largest])
                + " setting largest to: " + str(h[l]))
        largest = l
    if r < heapsize and comp(h[r], h[largest]):
        print("Largest was: " + str(h[largest])
                + " setting largest to: " + str(h[r]))
        largest = r
    if largest != i:
        print("Swapping elements " + str(i) + " and " +
                str(largest))
        srt.swap(h, i, largest)
        heapify(h, largest, heapsize, min_or_max)


def build_heap(h, min_or_max=MAX):
    """
        Args:
            h: the list to heapify.
            min_or_max: are we creating a max heap or a min heap?

        Returns:
            None
            The heap is built in place.
    """
    heapsize = len(h)
    for i in range((heapsize // 2), -1, -1):
        heapify(h, i, heapsize, min_or_max)


def heapsort(h, min_or_max=MAX):
    """
        Args:
            h: the list to heap sort
            min_or_max: are we sorting a max heap or a min heap?

        Returns:
            None

        Performance: O(n lg n)
    """
    build_heap(h, min_or_max)
    heapsize = len(h)
    for i in range(len(h) - 1, 0, -1):
        print("heapsort heap: " + str(h))
        print("heapsize = " + str(heapsize)
              + "; i = " + str(i))
        srt.swap(h, 0, i)
        heapsize -= 1
        heapify(h, 0, heapsize, min_or_max)


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


def heap_find_place(h, i, key, min_or_max=MAX):
    """
        Args:
            h: the heap.
            i: the starting index for the key we are inserting.
            key: the new value we are inserting.
            min_or_max: are we dealing with a min or max heap?

        Returns:
            None (re-arranges the existing list).
    """
    # we have to reverse the ordinary comparison here,
    # since we are working bottom up!
    comp = get_opt(not min_or_max)

    if key < h[i]:
        print("New key is smaller than current key.")
        return None

    h[i] = key
    while i > 0 and comp(h[parent(i)], h[i]):
        print("Swapping " + str(h[i]) +
            " and " + str(h[parent(i)]))
        srt.swap(h, i, parent(i))
        i = parent(i)


def heap_insert(h, key, min_or_max=MAX):
    """
        Inserts a new value in its proper place in the heap.

        Args:
            h: the heap.
            key: the new value we are inserting.
            min_or_max: are we dealing with a min or max heap?

        Returns:
            None (inserts in the existing heap).
    """
    h.append(get_sentinel(min_or_max))
    heap_find_place(h, len(h) - 1, key, min_or_max)
