//
//  algorithms.swift
//  Experiment
//
//  Created by Abdullah on 29/02/2024.
//

import Foundation

func runAlgorithms() {
//    let arr = [-2, -3, 4, -1, -2, 1, 5, -3]
//    let result = maxSubArraySum(arr)
//    print(result)
    
    let res =  solutionss([2, 2, 2, 2, 2, 2], [7, 4, 2, 5, 1, 2])
    print(res)
    let A = [3,5,7,3]
    var subArr = A.suffix(2)
    print(subArr)
}

public func solutionss(_ A :  [Int], _ B :  [Int]) -> Int {
    // Implement your solution here
    var goldenCoins = A.count/2
    var silverCoins = B.count/2
    let newA = Array(Set(A))
    let newB = Array(Set(B))
    var result: Set<Int> = []
    
    var resultr: [Int: Set<Int>] = [:]
    var resultrr: [Int: Int] = [:]
    var vadd = resultr[0] as? Set<Int>
    var asdf = resultr.first?.value.count
    
    
    
    for i in newA {
        if goldenCoins == 0 {
            break
        }
        if !result.contains(i) {
            result.insert(i)
            goldenCoins = goldenCoins - 1
        }
        
    }
    for i in newB {
        if silverCoins == 0 {
            break
        }
        if !result.contains(i) {
            result.insert(i)
            silverCoins = silverCoins - 1
        }
        
    }
    
    return result.count
}


