//
//  Hackerrank.swift
//  Experiment
//
//  Created by Abdullah on 16/04/2023.
//

import Foundation

func maximumDistinct(a: [Int], b: [Int], k: Int) -> Int {
    return 0
}

func processLogs(logs: [String], threshold: Int) -> [String] {
    // Write your code here
    var newArr: [Set<String.SubSequence>] = []
    for el in logs {
        var element = el.split(separator: " ")
        element.removeLast()
        newArr.append(Set(element))
    }
    print(newArr)
    let newArrr = newArr.flatMap{$0}
    print(newArrr)
    let elWithFreq = newArrr.reduce(into: [String.SubSequence: Int]()) {
        curr, next in
        curr[next] = curr[next] != nil ? curr[next]! + 1 : 1
    }
    print(elWithFreq)
    var res: [String] = []
    for (key, value) in elWithFreq {
        if value >= threshold {
            res.append(String(key))
        }
    }
    return res.sorted()
}

//Gifting groups from me but not working
func countrGroups(related: [String]) {
    var arr: [[Character]] = []
    for el in related {
        var asd: [Character] = []
        for el in el {
            asd.append(el)
        }
        arr.append(asd)
    }
    print(arr)
    var verticesDict: [Int: Int] = [:]

    for (i, _) in arr.enumerated() {
        for (j, _) in arr[i].enumerated() {

            if arr[i][j] == "1" && i != j {
        
                if !verticesDict.keys.contains(i) {
                    var value = verticesDict[j]
                    if value != nil {
                        if (!verticesDict.keys.contains(value!)) {
                            verticesDict[i] = j
                        }
                    }
                    else {
                        verticesDict[i] = j
                    }
                }
                else {
                    verticesDict[i] = j
                }
            }
        }
    }
    print(verticesDict.count)
}

func testHackerrank() {
    //countrGroups(related: ["10000", "01000", "00100", "00010", "00001"])
    //countrGroups(related: ["110", "110", "001"])
    //let count = countGroups(["110", "110", "001"])
    //let count = countGroups(["1100", "1101", "1010", "0001"])
    
    //print(count)
    
    
//    let res = minimalHeaviestSetA2(arr: [4,2,5,1,6,2,3])
    let res = minimalHeaviestSetA(arr: [2, 3, 4, 4, 5, 9, 7, 8, 6, 10, 4, 5, 10, 10, 8, 4, 6, 4, 10, 1])
    print(res)
}

//Gifting groups from me but not working
func countGroups(_ related: [String]) -> Int {
    var count = 0
    var length = related.count
    var relatedMatrix = convertToArray(related)

    for idx in 0..<length {
        if relatedMatrix[idx][idx] == 1 {
            count += 1
        
            dfs(idx, length, &relatedMatrix)
        }
    }

    return count
}

func dfs(_ idx: Int, _ length: Int, _ matrix: inout [[Int]]) {
  
    if matrix[idx][idx] == 0 {
        return
    }
  
    for i in 0..<length {
     
        if matrix[idx][i] == 1 {
            matrix[idx][i] = 0
            dfs(i, length, &matrix)
        }
    }
}

func convertToArray(_ s: [String]) -> [[Int]] {
    var result = [[Int]]()
    for char in s {
        result.append(char.map { Int(String($0))! })
    }
    return result
}


/*
 * Complete the 'minimalHeaviestSetA' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func minimalHeaviestSetA(arr: [Int]) -> [Int] {
    // Write your code here
    let sortedArr = arr.sorted()
    let target = sortedArr.reduce(0,+)/2
    var i = sortedArr.count - 2
    var sumA = sortedArr[i...].reduce(0,+)
    print(sortedArr)
    
    while sumA <= target {
        let minSteps = max(1, (target - sumA)/max(1,sortedArr[i]))
        print("la is \(sortedArr[i-minSteps..<i])")
        sumA = sumA + sortedArr[i-minSteps..<i].reduce(0,+)
        i -= minSteps
    }
    return Array(sortedArr[i...]).sorted()

}

func minimalHeaviestSetA2(arr: [Int]) -> [Int] {
    // Write your code here
    var sortedArr = arr.sorted()
    let target = sortedArr.reduce(0,+)/2
    var i = sortedArr.count - 2
    var rightArr = sortedArr[i...]
    var sumA = rightArr.reduce(0,+)
    print(sortedArr)
    print("target is \(target)")
    var leftArr = sortedArr[..<i]
    print(leftArr)
    while sumA <= target {
    
        var newElements = leftArr.removeLast()
        rightArr = rightArr + [newElements]
        print("rightArr is \(rightArr)")
        sumA = sumA + newElements
        print("sumA is \(sumA)")

    }
    return Array(rightArr).sorted()

}


