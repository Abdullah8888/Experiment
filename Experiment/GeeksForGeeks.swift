//
//  GeekFOrGeeks.swift
//  Experiment
//
//  Created by Abdullah on 29/05/2022.
//

import Foundation

/** Minimum operations required to make all the elements distinct in an array */
/** Difficulty Level : Easy
 Last Updated : 23 May, 2022
 Given an array of N integers. If a number occurs more than once, choose any number y from the array and replace the x in the array to x+y such that x+y is not in the array. The task is to find the minimum number of operations to make the array a distinct one.
 Examples:
  

 Input: a[] = {2, 1, 2}
 Output: 1
 Let x = 2, y = 1 then replace 2 by 3.
 Performing the above step makes all the elements in the array distinct.
 Input: a[] = {1, 2, 3}
 Output: 0 */
//Input: [2, 1, 2, 3, 3, 4, 3], 2:2, 3:3, 1:1, 4:1

func minimumOperations(_ arr: [Int]) -> Int{
    let dictFreq =  arr.reduce(into: [Int: Int]()){ curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }
    var resCount = 0
    for (key, value) in dictFreq {
        print("the value is \(value)")
        if value > 1 {
            resCount = resCount + (value - 1)
        }
    }
    return resCount
}

/** Find maximum sum pair with same digit sum
 
 Difficulty Level : Medium
 Last Updated : 15 Dec, 2021
 Given an array arr having N integers, the task is to find a pair with maximum sum and having the same sum of digits. Print the sum of that pair, if it exists. Otherwise, print -1.

 Examples:

 Input:  arr[]={55, 23, 32, 46, 88}
 Output:  46 55 101
 Explanation: Pair {55, 46} will give the sum of 55 + 46 = 101

 Input: arr[]={18, 19, 23, 15}
 Output: -1
 https://www.geeksforgeeks.org/find-maximum-sum-pair-with-same-digit-sum/ */


