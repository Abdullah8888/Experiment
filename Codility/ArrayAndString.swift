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
// https://www.geeksforgeeks.org/find-the-missing-number/
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
//    let res = missingElement(nums: [2,3,4,5])
//    print(res)
//    //let res2 = mimasdf(arr: [2,3,5,6,7])
//    //let res2 = mimasdf(arr: [1,2,2,3,4,5])
//    let res2 = minimalHeaviestSeta(arr: [13,7,5,6,2])
//    print(res2)
    let procesRess = processLogs(logs: ["9 7 50", "22 7 20", "33 7 50", "22 7 20"], threshold: 3)
    print(procesRess)
}
/**
 Optimizing Box Weights (example question) An Amazon Fulfillment Associate has a set of items that need to be packed into two boxes. Given an integer array of the item weights larr) to be packed, divide the item weights into two subsets, A and B. for packing into the associated boxes, while respecting the following conditions: The intersection of A and B is null The union A and B is equal to the original array. The number of elements in subset A is minimal. The sum of A's weights is greater than the sum of B's weights. Return the subset A in increasing order where the sum of A's weights is greater than the sum of B's weights. If more than one subset A exists, return the one with the maximal total weight. Example n=5 arr = 13,7,5,6, 2) The 2 subsets in arr that satisfy the conditions for Aare (5, 7) and (6, 7]: • Ais minimal (size 2) • Surn(A) = (5 + 7) = 12 > Sum(B) = (2+ 3+6) = 11 • Sum(A) + (6 + 7) = 13 > Sum(B) = (2 + 3 + 5) - 10 • The intersection of A and B is null and their union is equal to arr. . The subset A where the sum of its weight is maximal is [6.7). Function Description Complete the minimal HeaviestSeta function in the editor below.
 */
func minimalHeaviestSeta(arr: [Int]) -> [Int]{
    var newArr = arr.sorted()
    var subSetA: [Int] = []

    for (index, _) in arr.enumerated() {
        if index > 0  {
            if subSetA.reduce(0,+) > newArr.reduce(0,+) {
                let element = newArr.removeLast()
            
                if !(newArr.contains(element)) {
                    subSetA.append(element)
                }
                break
            }
        }
        let element = newArr.removeLast()
    
        if !(newArr.contains(element)) {
            subSetA.append(element)
        }
    }
    return subSetA.sorted()
}


func smallestPositiveNumber(A: [Int]) -> Int {
    var newSet: Set<Int> = []
    for el in A {
        if el > 0 {
            newSet.insert(el)
        }
    }
    
    for i in 1...A.count {
        if !newSet.contains(i) {
            return i
        }
    }
    return newSet.count + 1
}


func runCodility() {
        
    let res = countAsterisksInCompartments(input: "|**|*|*", startIndices: [1,1], endIndices: [5,6])
    print(res)
}

// Test cases
// countAsterisksInCompartments(input: "|**|*|*", startIndices: [1,1], endIndices: [5,6])
// countAsterisksInCompartments(input: "*|*|", startIndices: [1], endIndices: [3])
// countAsterisksInCompartments(input: "*****|*****", startIndices: [1,4,1,7], endIndices: [5,8,11,9])
// countAsterisksInCompartments(input: "*|**|*|**|****|*", startIndices: [4,1,4], endIndices: [8,16,11])
// countAsterisksInCompartments(input: "*****|*****", startIndices: [1,4,1,7], endIndices: [5,8,11,9])
 
func countAsterisksInCompartments(input: String, startIndices: [Int], endIndices: [Int]) -> [Int] {
    var result: [Int] = []
    var stack: [Character] = []
    for i in 0..<startIndices.count {
        let startIndex = startIndices[i]
        let endIndex = endIndices[i]

        var asteriskCount = 0
        stack = []

        for j in startIndex-1..<endIndex {
            let currentChar = input[input.index(input.startIndex, offsetBy: j)]
            
            if stack.isEmpty {
                if currentChar == "|" {
                    stack.append(currentChar)
                }
            }
            else {
                if !(stack.last == "|" && currentChar == "|") {
                    stack.append(currentChar)
                    
                    if stack.last == "|" {
                        stack.removeFirst()
                        stack.removeLast()
                        asteriskCount  = asteriskCount + stack.count
                        stack = []
                        stack.append(currentChar)
                    }
                }
            }
        }
        result.append(asteriskCount)
    }

    return result
}

//print(cntitems2("|**|*|*",[1,1,2],[5,7,7]))  # [2, 3, 1]
//    print(cntitems2("*|**|*|**|****|*",[4,1,4],[8,16,11]))  # [1, 9, 3]
//    print(cntitems2("*****|*****",[1,4,1,7],[5,8,11,9]))  # [0, 0, 0, 0]
