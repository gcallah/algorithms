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


def heapify(h, i):
    """
        Args:
            h: the list containing the heap.
            i: the node that might violate max-heap.

        Returns:
            None
    """
    l = left(i)
    r = right(i)
    largest = i
    if l <= len(h) && h[l] > h[i]:
        largest = l
    if r <= len(h) && h[r] > h[largest]:
        largest = r
    if largest != i:
        srt.swap(h[i], h[largest])
        heapify(h, largest)


def build__heap(l):
    pass


def heapsort(l):
    pass
