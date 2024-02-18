//
//  Algorithms.swift
//  Experiment
//
//  Created by Abdullah on 23/02/2022.
//

import Foundation

/// Pseudocode
/// Tranverse through all array elements ( i )
/// Create an inner loop, then swap elements if  j  > j + 1
/// - Parameter arr: array of integers
/// - Returns: sorted array
func bubbleSort(arr: inout [Int]) -> [Int] {
    var isSwapped = false
    for i in 0..<arr.count {
        for j in 0..<arr.count-i-1 {
            if arr[j] > arr[j+1] {
                (arr[j], arr[j+1]) = (arr[j+1], arr[j])
                isSwapped = true
            }
        }
        if !isSwapped {
            break
        }
    }
    return arr
}

func checkIfAllElementsAreEqual(){
    let s = "aaa"
    let res = s.allSatisfy({ $0 == s.first})
    print(res)
}

func checkIfAllElementsSorted(){
    let arr = [2,4,5,3]
    let check = zip(arr, arr).allSatisfy(<=)
    print(check)
}

func formArrayOfTupplesWithZip(){
    let arr = [2,4,5,3]
    let arr2 = [10,54,35,13]
    print( zip(arr, arr2).map{$0} )
}





//# Python program for implementation of MergeSort
//def mergeSort(arr):
//    if len(arr) > 1:
//
//         # Finding the mid of the array
//        mid = len(arr)//2
//
//        # Dividing the array elements
//        L = arr[:mid]
//
//        # into 2 halves
//        R = arr[mid:]
//
//        # Sorting the first half
//        mergeSort(L)
//
//        # Sorting the second half
//        mergeSort(R)
//
//        i = j = k = 0
//
//        # Copy data to temp arrays L[] and R[]
//        while i < len(L) and j < len(R):
//            if L[i] < R[j]:
//                arr[k] = L[i]
//                i += 1
//            else:
//                arr[k] = R[j]
//                j += 1
//            k += 1
//
//        # Checking if any element was left
//        while i < len(L):
//            arr[k] = L[i]
//            i += 1
//            k += 1
//
//        while j < len(R):
//            arr[k] = R[j]
//            j += 1
//            k += 1
//
//# Code to print the list

func mergeSort(_ arr: inout [Int]) {
    guard arr.count > 1 else {
        return
    }
    let arrLenght = arr.count
    let mid = arrLenght/2
    var leftArr = Array(arr[0..<mid])
    var rightArr = Array(arr[mid..<arrLenght])
    mergeSort(&leftArr)
    mergeSort(&rightArr)
    
    var i = 0, j = 0, k = 0, count = 0
    print("\(leftArr)   \(rightArr)")
    while i < leftArr.count && j < rightArr.count {
        if leftArr[i] < rightArr[i] {
            arr[i] = leftArr[i]
            i+=1
            count+=1
        }
        else {
            arr[j] = rightArr[j]
            j+=1
            count+=1
        }
        k+=1
        
    }
    
    while i < leftArr.count {
        arr[k] = leftArr[i]
        i+=1
        k+=1
        //count+=1
    }
    
    while j < rightArr.count {
        arr[k] = rightArr[j]
        j+=1
        k+=1
        //count+=1
    }
    
    print(arr)
    print(count)
    
}


func strideFunction() {
    var str = "HelloWorld"
    var array: [Int] = []
    
//    for i in stride(from: str.endIndex, through: str.startIndex, by: -1) {
//        array.append(i)
//    }
    print(array)
}
