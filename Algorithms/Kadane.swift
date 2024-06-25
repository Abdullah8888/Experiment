//
//  Kandane.swift
//  Experiment
//
//  Created by Abdullah on 25/06/2024.
//

import Foundation
/**
 Explanation of Kadane's Algorithm
 Kadane's Algorithm iterates through the array and at each position, it calculates the maximum sum of the subarray ending at that position by either:

 Including the current element to the previous maximum subarray sum.
 Starting a new subarray from the current element.
 
 Steps of Kadane's Algorithm
 Initialize two variables:
 current_sum: the sum of the current subarray.
 max_sum: the maximum sum found so far.
 Iterate through each element of the array.
 Update current_sum to be the maximum of the current element alone or the current element plus the current_sum.
 Update max_sum to be the maximum of max_sum and current_sum.
 Return max_sum.
 
 It is an optimized sliding window technique for finding the maximum sum subarray, when conditions are not given
 */


func runKadaneAlgorithm() {
    let output = maxSubArraySumWithTheSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
    print(output)
}

//Kadane's Algorithm is a well-known algorithm for finding the maximum subarray sum in an array
// Note: in the image maxSofar is represented by Max_Sum
// and maxEndingHere by Curr_Sum
func maxSubArraySum(_ arr: [Int]) -> Int {
    var maxEndingHere = arr[0]
    var maxSoFar = arr[0]

    for i in 1..<arr.count {
        maxEndingHere = max(arr[i], maxEndingHere + arr[i])
        maxSoFar = max(maxSoFar, maxEndingHere)
    }
    
    return maxSoFar
}

// Return the subarray that gives the max sum
func maxSubArraySumWithTheSubArray(_ arr: [Int]) -> (Int, [Int]) {
    var currentSum = arr[0]
    var maxSum = arr[0]
    var tempStartIndex = 0
    var startIndex = 0
    var endIndex = 0

    for i in 1..<arr.count {
        if (arr[i] > currentSum + arr[i]) {
            currentSum = arr[i]
            tempStartIndex = i
        }
        else {
            currentSum = currentSum + arr[i]
        }
        
        if currentSum > maxSum {
            maxSum = currentSum
            startIndex = tempStartIndex
            endIndex = i
        }
    }
    
    return (maxSum, Array(arr[startIndex...endIndex]))
}
