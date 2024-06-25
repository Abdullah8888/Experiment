//
//  SlidingWindow.swift
//  Experiment
//
//  Created by Abdullah on 25/06/2024.
//

import Foundation
func runSlidingWindow() {
    let ans = maximumSumOfSubArraysWithTheSubArray(arr: [ 1, 4, 2, 10, 2, 3, 1, 0, 20 ], k: 4)
    print(ans)
}
//Sliding window technique
// User case => To find the maximum sum of all subarrays of size K:
//arr = [ 1, 4, 2, 10, 2, 3, 1, 0, 20 ] k = 4;
// output: 24
func maximumSumOfSubArrays(arr: [Int], k: Int) -> Int {
    var currentSum = 0
    var maxSum = 0
    var endIndex = k - 1
    var startIndex = 0
    while endIndex < arr.count {
        
        currentSum = arr[startIndex...endIndex].reduce(0,+)
        if currentSum > maxSum {
            maxSum = currentSum
        }
        endIndex = endIndex + 1
        startIndex = startIndex + 1
    }
    return maxSum
}

// Return the maxsum with the subarray
func maximumSumOfSubArraysWithTheSubArray(arr: [Int], k: Int) -> (Int, [Int]){
    var currentSum = 0
    var maxSum = 0
    var endIndex = k - 1
    var startIndex = 0
    while endIndex < arr.count {
        
        currentSum = arr[startIndex...endIndex].reduce(0,+)
        if currentSum > maxSum {
            maxSum = currentSum
        }
        endIndex = endIndex + 1
        startIndex = startIndex + 1
    }
    return (maxSum, Array(arr[startIndex-1...endIndex-1]))
}
