/**
 * Created by Zebin Xu.
 *
 * Simulate the HIRE-ASSISTANT procedure of the hiring problem in the CLRS book.
 * Compare the origianl hiring algorithm and the randomized algorithm.
 */

package randomizedalgorithms;

import java.util.Arrays;
import java.util.Random;

public class HiringProblem {

    public static void main(String[] args) {
        if (args == null) {
            return;
        }

        HiringProblem hiringProblem = new HiringProblem();
        int[] candidateRanks;
        if (args.length == 0) {
            candidateRanks = new int[] {2, 4, 6, 3, 9, 5, 7, 8};
        } else {
            candidateRanks = new int[args.length];
            for (int i = 0; i < args.length; ++i) {
                candidateRanks[i] = Integer.parseInt(args[i]);
            }
        }

        System.out.printf("Rank order in which candidates come in: %s%n", Arrays.toString(candidateRanks));

        int numberOfHiredCandidates = hiringProblem.hireAssistant(candidateRanks);
        System.out.printf("Number of hired candidates: %d%n", numberOfHiredCandidates);
	
        int numberOfHiredCandidatesRandom = hiringProblem.randomizedHireAssistant(candidateRanks);
        System.out.printf("After randomized algorithms, number of hire candidates: %d%n", numberOfHiredCandidatesRandom);
    }

    public int hireAssistant(int[] candidates) {
        int best = 0;//a least-qualified dummy candidate
        int numberOfHired = 0;
        for (int i = 0; i < candidates.length; ++i) {
            //interview candidate i...
            if (candidates[i] > best) {
                //hire candidate i
                best = candidates[i];
                numberOfHired += 1;
            }
        }
        return numberOfHired;
    }

    public int randomizedHireAssistant(int[] candidates) {
        int[] candidateList = Arrays.copyOf(candidates, candidates.length);
        randomizeInPlace(candidateList);
        return hireAssistant(candidateList);
    }

    private void randomizeInPlace(int[] array) {
        Random random = new Random();
        int n = array.length;
        for (int i = 0; i < n; ++i) {
            swap(array, i, random.nextInt(n - i) + i);
        }
    }

    private void swap(int[] array, int a, int b) {
        int temp = array[a];
        array[a] = array[b];
        array[b] = temp;
    }
}