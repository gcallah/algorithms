package greedyalgorithms;

import java.util.List;
import java.util.ArrayList;
import java.util.stream.Stream;

public class ActivitySelection {

    public static void main(String[] args) {
        int[] start =  {0, 1, 3, 0, 5, 3, 5,  6,  8,  8,  2, 12};
        int[] finish = {0, 4, 5, 6, 7, 9, 9, 10, 11, 12, 14, 16};
        
        List<Integer> selectedActivities = ActivitySelection.greedyActivitySelector(start, finish);
        selectedActivities.stream().forEach(System.out::println);
        
        selectedActivities = ActivitySelection.recursiveActivitySelector(start, finish, 0, start.length - 1);
        selectedActivities.stream().forEach(System.out::println);

        List<Integer> activities = new ArrayList<>();
        ActivitySelection.recursiveActivitySelectorModified(start, finish, 0, start.length - 1, activities);
        activities.stream().forEach(System.out::println);
    }

    public static List<Integer> recursiveActivitySelector(int[] start, int[] finish, int k, int n) {
        int m = k + 1;
        while (m <= n && start[m] < finish[k]) {
            m++;
        }
        if (m <= n) {
            List<Integer> activities = new ArrayList<>();
            activities.add(m);
            List<Integer> remains = recursiveActivitySelector(start, finish, m, n);
            if (remains != null) {
                activities.addAll(remains);
            }
            return activities;
        } else {
            return null;
        }
    }

    /**
     * In the textbook, this method returns a list which is not efficient in Java as we have to create a List in every recursion.
     * So I implement it by passing a List parameter while I preserve the original version above that strictly follows what the book does.
     */
    public static void recursiveActivitySelectorModified(int[] start, int[] finish, int k, int n, List<Integer> activities) {
        if (activities == null) {
            throw new IllegalArgumentException("List activities should not be null!");
        }
        int m = k + 1;
        while (m <= n && start[m] < finish[k]) {
            m++;
        }
        if (m <= n) {
            activities.add(m);
            recursiveActivitySelectorModified(start, finish, m, n, activities);
        }
    }

    public static List<Integer> greedyActivitySelector(int[] start, int[] finish) {
        int n = start.length - 1;
        List<Integer> activities = new ArrayList<>();
        activities.add(1);
        int k = 1;
        for (int m = 2; m <= n; m++) {
            if (start[m] >= finish[k]) {
                activities.add(m);
                k = m;
            }
        }
        return activities;
    }
}