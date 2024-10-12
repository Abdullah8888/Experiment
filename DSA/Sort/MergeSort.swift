//
//  Sort.swift
//  Experiment
//
//  Created by Abdullah on 29/11/2022.
//

import Foundation


func mergeSortt(_ nums: inout [Int])  {
    if nums.count > 1 {
        
        let mid = nums.count/2
        var leftSubArr = Array(nums[..<mid])
        var rightSubArr = Array(nums[mid..<nums.count])

        //recursively splitting the nums
        mergeSort(&leftSubArr)
        mergeSortt(&rightSubArr)

        var i = 0 // left sub array index
        var j = 0 // right sub array index
        var k = 0 // merged array index

        while (i < leftSubArr.count && j < rightSubArr.count) {
            if (leftSubArr[i] < rightSubArr[j]) {
                nums[k] =  leftSubArr[i]
                i = i + 1
            }
            else {
                nums[k] =  rightSubArr[j]
                j = j + 1
            }
            k = k + 1
        }

        // For the left over or remaining elements in left sub array
        while (i < leftSubArr.count) {
            nums[k] =  leftSubArr[i]
            i = i + 1
            k = k + 1
        }
        
        // For the left over or remining elements in right sub array
        while (j < rightSubArr.count) {
            nums[k] =  rightSubArr[j]
            j = j + 1
            k = k + 1
        }
        
//        return sortedNumsInt

        print("sorted nums is \(nums)")
    }
    //return nums;
    print("nums is \(nums)")
}

func mergeSort3(_ nums: [Int])  -> [Int]{
    guard nums.count > 1 else {
        return nums
    }
    
    let mid = nums.count/2
    var leftSubArr = Array(nums[..<mid])
    var rightSubArr = Array(nums[mid..<nums.count])

    //recursively splitting the nums
    leftSubArr = mergeSort3(leftSubArr)
    rightSubArr = mergeSort3(rightSubArr)

    var i = 0 // left sub array index
    var j = 0 // right sub array index
    var result: [Int] = []
    while (i < leftSubArr.count && j < rightSubArr.count) {
        if (leftSubArr[i] < rightSubArr[j]) {
            result.append(leftSubArr[i])
            i = i + 1
        }
        else {
            result.append(rightSubArr[j])
            j = j + 1
        }
    }

    // For the left over or remaining elements in both left and right sub array
    result.append(contentsOf: leftSubArr[i...])
    result.append(contentsOf: rightSubArr[j...])
    print("sorted nums is \(result)")
    return result
}
func genericMergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }

    let middle = array.count / 2
    let left = genericMergeSort(Array(array[0..<middle]))
    let right = genericMergeSort(Array(array[middle...]))

    return merge(left, right)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var result = [T]()
    var i = 0, j = 0

    while i < left.count && j < right.count {
        if left[i] <= right[j] {
            result.append(left[i])
            i += 1
        } else {
            result.append(right[j])
            j += 1
        }
    }

    result.append(contentsOf: left[i...])
    result.append(contentsOf: right[j...])

    return result
}
func runSortAlgo() {
//    var arr: [Int] = [1,7,5,6,3]
//    let res = mergeSortt(&arr)
//    print("res is \(res)")
    
//    let arr2: [Int] = [1,7,5,6,3]
//    let res2 = genericMergeSort(arr2)
//    print("res is \(res2)")
    
    let arr3: [Int] = [1,7,5,6,3]
    let res3 = mergeSort3(arr3)
    print("res is \(res3)")
}

