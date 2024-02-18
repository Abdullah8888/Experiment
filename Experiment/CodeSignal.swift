//
//  CodeSignal.swift
//  Experiment
//
//  Created by Abdullah on 18/10/2021.
//

import Foundation

func firstNotRepeatingCharacter(s: String) -> Character {
    var myString = s
    let total = myString.count
    var count = 0
        while count < total {
            if myString.count == 1 {
                return myString.first!
            }
            else {
                let char = myString.prefix(1)
                let filteredEl = myString.filter{String($0) == String(char)}
                if filteredEl.count == 1 {
                    return filteredEl.first!
                }
                else {
                    //remove same chars from the main string
                    myString = myString.filter{String($0) != String(char)}
                }
            }
            count = count + 1
        }

    return "_"
}

func filetedIndice() {
    let items = ["A", "B", "A", "C", "A", "D"]
    let filteredIndices = items.indices.filter {items[$0] == "A"}
    print("df \(filteredIndices)")
}

func solution(a: [Int]) -> Int {
    var array = a
    var result: [Int: Int] = [:]
    if a.count == 1 {
        return -1
    }
    else {
        if a.sorted() == Set(a).sorted() {
            return -1
        }
        else {
            while array.count > 0 {
                let removedEl = array.remove(at: 0)
                if array.contains(removedEl) {
                    let filtereddElIndices = a.indices.filter{a[$0] == removedEl}
                    let duplicatedElIndex = filtereddElIndices.count > 1 ? filtereddElIndices[1] : filtereddElIndices[0]
                    result[Int(duplicatedElIndex)] = removedEl
                }
            }
        }
    }

    return result[result.keys.min()!]!
}

//Rotate Image with 0(1)
func testfunc() {
    //var rowsArray = [[1,3,4], [3,4,5], [6,1,2]]
    var rowsArray = [[1, 2, 3],
         [4, 5, 6],
         [7, 8, 9]]
    rowsArray = rowsArray[0].indices.map { col in
        rowsArray.indices.map { row in
            rowsArray[row][col]
        }.reversed()
    }
//    let rr = rowsArray.indices.map{ $0}
//    print(rr)
    
    //let rr = columnsArray.map{$0.reversed()}
    //print(Array(rr))
    print(rowsArray)
}

/*
 Given an array of integers, find the pair of adjacent elements that has the largest product and return that product.
 Example
 For inputArray = [3, 6, -2, -5, 7, 3], the output should be
 adjacentElementsProduct(inputArray) = 21
 */
func adjacentElementsProduct(inputArray: [Int]) -> Int {
    let total = inputArray.count
    var products: [Int] = []
    var i = 0
    while i < total {
        if (i + 1) < total {
            products.append(inputArray[i] * inputArray[i+1])
        }
        i+=1
    }
    return products.max()!
}

func modifiedAdjacentElementsProduct(inputArray: [Int]) -> Int {
    var largetProduct = -10000
    let indices = inputArray.indices.filter{ inputArray[$0] > 0}
    print(indices)
    for index in indices {
        let nextElIndex = index + 1
        if nextElIndex < inputArray.count {
            let midEl = inputArray[index]
            let nextEl = inputArray[nextElIndex]
            
            let nextProduct = midEl * nextEl
            largetProduct = nextProduct > largetProduct ? nextProduct : largetProduct
        }
        
    }
    return largetProduct
}
