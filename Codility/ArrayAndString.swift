//
//  Array_String.swift
//  Experiment
//
//  Created by Abdullah on 18/02/2024.
//
//https://app.codility.com/programmers/lessons/9-maximum_slice_problem/

import Foundation
//We have an array, A, with N different integers in it. The integers in the arrary have a range of (1, (N+1)). Since there are only N integers, that extra one is missing. Return that missing element using a function.
//
//For example: array A = 2, 3, 4, 5
//
//We want to return 1, the missing element.
//Note: There are no duplicates in the list.
func missingElement(nums: [Int]) -> Int {
    //Let's use the sum of an Arithmetic progress (Ap) S = n(2a + (n-1)d)/2
    let firstEl = nums.first!
    var missingEl = 0
    for (index, _) in nums.enumerated() {
        let nextIndex = index + 1
        if nextIndex < nums.count {
            missingEl = nums[nextIndex] - firstEl
            if !(nums.contains(missingEl)) {
                break
            }
        }
    }
    return missingEl
}

func testMissingElement() {
    let res = missingElement(nums: [2,3,4,5])
    print(res)
}
