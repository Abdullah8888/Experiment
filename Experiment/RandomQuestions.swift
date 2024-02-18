//
//  Random questions.swift
//  Experiment
//
//  Created by Abdullah on 15/09/2021.
//

import Foundation

func inc(b: Int) -> () -> Int {
    var a = 0
    
    func sum() -> Int {
        a += b
        return a
    }
    return sum
}
//let byten = inc(b: 10)
//print(byten())
//print(byten())
//let by5 = inc(b: 5)
//print(by5())
//print(byten())
//
//let dd = [
//[1,3,4],
//    [1,3,4],
//    [1,3,4]
//]
//
//print(dd.flatMap{$0})
//print(dd.map{$0})
//print(dd.reduce([]){$0 + $1})
//
//print(Array(dd.joined()))
//
//
//class Author {
//    var book: Book?
//}
//
//class Book {
//    var nn = 100
//}
//
//let john = Author()
//john.book = Book()
//
//var pa: Int = john.book!.nn
//print(pa)
//
//john.book = nil
////pa = john.book?.nn
//let fgg = Int("04")
//print(fgg)
func anagram(text: [String]) -> [String] {
    var myText = text
    var index = 0
    var innerIndex = 1
    var result: [String] = []
    while index < myText.count {
        while innerIndex < myText.count   {
            if myText[index].sorted() != myText[innerIndex].sorted() {
                result.append(myText[index])
                result.append(myText[innerIndex])
            }
            innerIndex = innerIndex  + 1
        }
        index = index + 1
    }
    let removeDuplicate = Set(result)
    result = Array(removeDuplicate).sorted()
    return result.sorted()
}


func moves(arr: [Int]) -> Int {
    var myArr = arr
    var index = 0
    var innerIndex = 1
    var count = 0
    //[8,5,11,4,6]
    while index < myArr.count {
        
        while innerIndex < myArr.count {
            if (myArr[innerIndex] < myArr[index]) && (myArr[innerIndex] % 2 == 0) {
                let temp = myArr[index]
                myArr[index] = myArr[innerIndex]
                myArr[innerIndex] = temp
                count = count + 1
            }
            innerIndex = innerIndex + 1
        }
        index = index + 1
        innerIndex = index + 2
    }
    return count
}
