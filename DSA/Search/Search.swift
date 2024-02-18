//
//  Search.swift
//  Experiment
//
//  Created by Abdullah on 04/12/2022.
//

import Foundation

//Binary search
func binarySearch(arr: [Int], target: Int) -> Int {
    var lowIndex = 0
    var highIndex = arr.count - 1
    var midIndex = 0
 
    while lowIndex <= highIndex {
        midIndex = (lowIndex + highIndex)/2
        
        if target == arr[midIndex] {
            return target
        }
        else if target > arr[midIndex] {
            lowIndex = midIndex + 1
        }
        else {
            highIndex = midIndex - 1
        }
    }
    return -1
}
