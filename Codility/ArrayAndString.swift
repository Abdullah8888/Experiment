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



// binary gap
public func binaryGap(_ N : Int) -> Int {
    // Implement your solution here
    var num = N
    var binaryNumber = ""
    while num != 0 {
        let remainder = num % 2
        binaryNumber = String(remainder) + binaryNumber
        num = num / 2
    }

    let binaryNumberArray = Array(binaryNumber)
    
    let checkOnes = binaryNumberArray.allSatisfy{$0 == "1"}
    if checkOnes {
        return 0
    }
    let checkZeros = binaryNumberArray.allSatisfy{$0 == "0"}
    if checkZeros {
        return 0
    }
    var indexStack: [Int] = []
    for (index, el) in binaryNumberArray.enumerated() {
        if el == "1" {
            indexStack.append(index)
        }
    }

    var longestBinaryGaps: [Int] = []
    for (index, _) in indexStack.enumerated() {
        if (index + 1 < indexStack.count) {
            let bNStartIndex = indexStack[index]
            let bNEndIndex = indexStack[index+1]
            let zeros = binaryNumberArray[bNStartIndex+1..<bNEndIndex]
            if (zeros.contains("0")) {
                longestBinaryGaps.append(zeros.count)
            }
            
        }
    }
    return longestBinaryGaps.isEmpty ? 0 : longestBinaryGaps.max()!
}

public func binaryGapV2(_ N : Int) -> Int {
    // Implement your solution here
    var longestBinaryGaps: [Int] = []
    var oneArray: [String] = []
    var countZero = 0

    var num = N
    var binary = ""
    while num != 0 {
        let remainder = num % 2
        binary = String(remainder) + binary
        num = num / 2
    }

    var binaries = Array(binary)
    if binaries.first == "1" {
        oneArray.append("1")
        binaries.remove(at: 0)
    }

    for el in binaries {
        if oneArray.last == "1" && el == "0"{
            countZero = countZero + 1
        }
        else {
            if el == "1" {
                oneArray.append("1")
                longestBinaryGaps.append(countZero)
                countZero = 0
            }
            
        }
    }
    return longestBinaryGaps.isEmpty ? 0 : longestBinaryGaps.max()!
}

//An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
//
//The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
public func cyclicRotation(_ A : inout [Int], _ K : Int) -> [Int] {
    // Implement your solution here
    if (A.isEmpty) {
        return A
    }
    var numberOfRotation = K
    while(numberOfRotation > 0) {
        let lastElement = A.removeLast()
        
        A = [lastElement] + A
        numberOfRotation = numberOfRotation - 1
    }
    return A
}

//OddOccurencesInArray
public func oddOccurencesInArray(_ A : inout [Int]) -> Int {
    // Implement your solution here
    if(A.count == 1){
        return A.first!
    }
    var unpairedElement = 0
    let dict = A.reduce(into: [Int:Int]()) {
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }
    for (key, value) in dict {
        if value % 2 != 0 {
            unpairedElement = key
            break
        }
    }
    return unpairedElement
}

//OddOccurencesInArray V2, but it has not been tested
func singleElement(arr: [Int]) -> Int {
    var low = 0
    var high = arr.count - 2
    var mid = 0
    while low <= high {
        mid = (low + high) / 2
        if arr[mid] == arr[mid ^ 1] {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return arr[low]
}

func runCodility() {
        
//    let res = countAsterisksInCompartments(input: "|**|*|*", startIndices: [1,1], endIndices: [5,6])
//    print(res)
    
//    let res = binaryGapV2(15)
//    print(res)
    
}

func frongJmp(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    // Implement your solution here
    if(X==Y) {
        return 0
    }
    let diff = Y - X
    if diff % D == 0 {
        return diff / D
    }
    else {
        return (diff / D ) + 1
    }
}

/**
 Task Description
 An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

 Your goal is to find that missing element.

 Write a function:

 def solution(A)

 that, given an array A, returns the value of the missing element.

 For example, given array A such that:

 A[0] = 2

 A[1] = 3

 A[2] = 1

 A[3] = 5

 the function should return 4, as it is the missing element.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 the elements of A are all distinct;
 each element of array A is an integer within the range [1..(N + 1)].
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 */
public func permMissingEl(_ A : inout [Int]) -> Int {
    // Implement your solution here
    if A.isEmpty {
        return 1
    }
    let maxEl = A.max()!
    let setA: Set<Int> = Set(Array(1...maxEl))
    let setB: Set<Int> = Set(A)
    let res = setA.symmetricDifference(setB)
    if (res.isEmpty) {
        return maxEl + 1
    }
    else {
        return res.first!
    }
    
}

//https://yeonghyeon.medium.com/codility-lesson-03-3-tapeequilibrium-8c8d8fb6e5c0
//Tapeequlibrium
public func tapeEquilibrium(_ A : inout [Int]) -> Int {
    // Implement your solution here
    var sumPartA = 0
    var sumPartB = A.reduce(0,+)
    var result: [Int] = []
    for el in A {
        sumPartA = sumPartA + el
        sumPartB = sumPartB - el
        result.append(abs(sumPartA-sumPartB))
    }
    result.removeLast()
    return result.min()!
}


public func isPermutation(_ A : inout [Int]) -> Int {
    // Implement your solution here
    if A.isEmpty {
            return 0
        }
        if A.count == 1 {
            if A.first != 1 {
                return 0
            }
            else {
                return 1
            }
        }

        let newA = Array(Set(A)).sorted()
        if newA.count != A.count {
            return 0
        }
        for (i, _) in newA.enumerated() {
            if i+1 < newA.count {
                let diff = abs(newA[i] - newA[i+1])
                if !newA.contains(diff) {
                    return 0
                }
            }
        }
        return 1
}


public func maxCounters(_ N : Int, _ A : inout [Int]) -> [Int] {
    var counters: [Int] = Array(repeating: 0, count:N)
        var tempMaxValue = 0
        var maxValue = 0
        for el in A {
            if el == N+1 {
                
                maxValue = tempMaxValue
            }
            else {
                let counterIndex = el - 1
                
                counters[counterIndex] = max(counters[counterIndex] + 1, maxValue+1)
                tempMaxValue = max(counters[counterIndex], tempMaxValue)
                
            }
        }
        for (i, el) in counters.enumerated() {
            counters[i] = max(el, maxValue)
        }
        return counters
}
