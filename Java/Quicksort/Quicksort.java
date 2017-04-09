package quicksort;

import java.util.Random;

/**
 * User: Lei Su
 * Date: 4/2/17
 * Time: 11:40 AM
 *
 * implement randomized quicksort in CLRS
 */
class Quicksort {

	public void quickSort(int[] A) {
		if (A == null || A.length == 0) {
			return;
		}

		randomizedQuicksort(A, 0, A.length - 1);
	}

     /**
     * @param A an integer array
     * @param start the first index of the subarray to be sorted
     * @param end the last index of the subarray to be sorted
     * @return void
     */
	private void randomizedQuicksort(int[] A, int start, int end) {
		if (start >= end) {
			return;
		}

		int q = randomizedPartition(A, start, end);
		randomizedQuicksort(A, start, q - 1);
		randomizedQuicksort(A, q + 1, end);
	}

	private int randomizedPartition(int[] A, int start, int end) {
		Random rand = new Random();
		int i = start + rand.nextInt(end - start + 1);
		int temp = A[end];
		A[end] = A[i];
		A[i] = temp;

		return partition(A, start, end);
	}

	private int partition(int[] A, int start, int end) {
		int pivot = A[end];
		int i = start - 1;
		for (int j = start; j < end; j++) {
			if (A[j] <= pivot) {
				i++;
				int temp = A[j];
				A[j] = A[i];
				A[i] = temp;
			}
		}
		int temp = A[end];
		A[end] = A[i + 1];
		A[i + 1] = temp;

		return i + 1;
	}
}
