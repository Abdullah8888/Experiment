//
//  Codility.swift
//  Experiment
//
//  Created by Abdullah on 04/02/2022.
//

import Foundation

func testSetSubtractingOperation(){
    let set1 = Set([3,7,5,6])
    let set2 = Set([2,4,7,5])
    let ans = set2.subtracting(set1)
    print(ans)
}

//Missing smaller positive integer
public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let filteredArr = Set(A.filter{$0 > 0})
    for el in 1...A.count+1 {
        if !filteredArr.contains(el) {
            return el
        }
    }
    return 1
}

func binaryRepresentation() {
    let binaryRep = String(32, radix: 2)
    let splittedArr = binaryRep.split(separator: "1")
    var zerosCount = 0
    for el in splittedArr {
        let chunkBinary = "1"+el+"1"
        if binaryRep.contains(chunkBinary){
            if zerosCount < el.count {
                zerosCount = el.count
            }
        }
    }
    print(zerosCount > 0 ? zerosCount : 0)
}

//fibonacci series solved with bottom up approach (Time complexity is O(n))
func fibWithBottomUp(n: Int) -> Int{
    if n == 0 {
        return 0
    }
    if n == 1 || n == 2 {
        return 1
    }
    var bottomUp = Array(repeating: 0, count: n+1)
    bottomUp[1] = 1
    bottomUp[2] = 1
    for el in 3..<n+1 {
        bottomUp[el] = bottomUp[el-1] + bottomUp[el-2]
    }
    return bottomUp[n]
}

//Bottom up approach Time complexity is 0(n), space compelxity is 0(n)
func fib(_ n: Int) -> Int {
    guard n > 1 else { return n }
    var cache : [Int] = Array(repeating: 0, count: n)
    cache[0] = 0
    cache[1] = 1
    for i in 2..<n {
        cache[i] = cache[i - 1] + cache[i - 2]
    }
    return cache[n - 1] + cache[n - 2]
}

//Bottom up approach via swapping Time complexity is 0(n), space compelxity is 0(1)
func fib2(_ num: Int) -> Int {
    guard num > 1 else { return num }
    var a = 0
    var b = 1
    var c = 0
    for _ in 2..<num {
        c = a + b
        a = b
        b = c
    }
    return a + b
}

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    let total = A.count
    if total == K || K == 0 || total == 1 || total == 0 {
        return A
    }
    else {
        var arr = Array(repeating: 0, count: total)
        for _ in 1...K {
            arr[0] = A.last!
            for index in 1...total-1 {
                arr[index] = A[index - 1]
            }
            A = arr
        }
        return arr
    }
}

func testLabeledLoop() {
    let numbers = 1...10
    outerLoop: for number1 in numbers {
        print("lopl")
        for number2 in numbers {
            if number1 == number2 && number1 * number2 == 7 {
                print("Square found: \(number1)")
                break outerLoop
            }
        }
    }
}

class Dog: Hashable {
     var uid: Int
     var name: String
     var age: Int
     var hashValue: Int {
          return uid.hashValue
     }
    
    init(uid: Int, name: String, age: Int) {
          self.uid = uid
          self.name = name
          self.age = age
     }
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
         return lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        uid.hash(into: &hasher)
    }
}

func customHashableUsage() {
    let dog1 = Dog(uid: 1, name: "Scrappy", age: 4)
    let dog2 = Dog(uid: 2, name: "Sparky", age: 3)
    var dogArray: [Dog: String] = [
         dog1: "Woff Woff",
         dog2: "Wooooooof!"
         ]
    var dogs: Set<Dog> = [dog1, dog2]
    
    print(dog1.hashValue)
    print(dog2.hashValue)
    print(dogArray[dog1])
}

func firstMethod() {
    let A = [3,4,4,3,3,2]
    let output = A.reduce(into: [Int: Int]()) { curr, next in
        curr[next, default: 1]  = curr[next] != nil ? curr[next, default: 1] + 1 : 1
    }
    print(output)
}

func secondMethod() {
    let A = [3,4,4,3,3,2]
    let ArrayOfTupples = A.map { ($0, 1) }
    let output = Dictionary(ArrayOfTupples, uniquingKeysWith: +)
    print(output)
}

//output: [4: 2, 3: 3, 2: 1]



func oddOccurrencesInArray(_ A : inout [Int]) -> Int {
    let dicts = A.reduce(into: [Int: Int]()){ curr, next in
        curr[next, default: 1] = curr[next] != nil ? curr[next, default: 1] + 1 : 1
    }
    for (key, value) in dicts {
            if value % 2 != 0 {
                return key
            }
        }
    return 0
}

func ssd(X: Int, Y: Int, D: Int) -> Int {
    return Int(ceil((Double(Y - X)) / Double(D)))
}

//form palidrone
func task1(_ S: inout String) -> String {
    var word = ""
    var letters = S.filter{$0 != "?"}
    for (index, el) in S.enumerated() {
        var atIndex = S.index(S.startIndex, offsetBy: index)
        //print(S[atIndex])
        if S[atIndex] == "?" {
            if letters.count > 1 {
                word.append(String(letters.remove(at: letters.startIndex)))
            }
            else {
                word.append(letters)
            }
            
        }
        else {
            word.append(String(S[atIndex]))
        }
    }
    
    return word == String(word.reversed()) ? word : "NO"
}


public func solution3(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    let arrSort = A.sorted()
    var total = arrSort.count
    var i = 0
    var countRes = 0
    while i < total {
        if i + 1 < total {
            if arrSort[i] < arrSort[i+1] {
                if arrSort.firstIndex(of: arrSort[i+1])! < arrSort.firstIndex(of: arrSort[i])! {
                    countRes+=1
                }
            }
        }
    }

    return countRes
}

func sortDuplicates(arr: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    let numWithFrequencyDict = arr.reduce(into: [Int: Int]()) {
        dict, key in
        dict[key, default:1] = dict[key] != nil ? dict[key]! + 1 : 1
    }
    if let min = numWithFrequencyDict.keys.min(), let max = numWithFrequencyDict.keys.max() {
        for key in min...max{
            result.append(Array(repeating: key, count: numWithFrequencyDict[key]!))
        }
    }
    return result
}


func numberOfPatches(_ s: String) -> Int {
    let chars = Array(s)
    var holes = 0
    var index = 0
    while index < chars.count {
        if chars[index] == "X" {
            index = index + 2
            holes = holes + 1
        }
        index = index + 1
    }
    return holes
}


func checkForAll() {
    var s: String = "(()))"
    let ddd = Array(s)
    for (ind, el) in s.indices.enumerated() {
        let indd = s.index(s.startIndex, offsetBy: ind)
        let sdf = s[indd]
        print(sdf)

    print(ind)
    }


    let es = max(3, 2)
    print(es)

    let array = [1, 1, 1]

    let hasAllItemsEqual = array.dropFirst().allSatisfy({ $0 == array.first })
    print(hasAllItemsEqual)

}


func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
         var minimumTime = 0
        var colorsStack: [[Character: Int]] = []
        
        for (index, el) in colors.enumerated() {
            
            if let lastChar = colorsStack.last {
                //let dd = lastChar.first?.key
                if lastChar.first!.key == el {
                    let neededTimeNext = neededTime[index]
                    let neededTimePrev = lastChar.first!.value
                    if neededTimeNext > neededTimePrev {
                        minimumTime = minimumTime + neededTimePrev
                        colorsStack.removeLast()
                        colorsStack.append([el: neededTime[index]])
                    }
                    else {
                        minimumTime = minimumTime + neededTimeNext
                    }
                    
                }
                
                else {
                    colorsStack.append([el: neededTime[index]])
                }
            }
            else {
                colorsStack.append([el: neededTime[index]])
            }
        }
        return minimumTime
    }
let dd = minCost("aaabbbabbbb", [3,5,10,7,5,3,5,5,4,8,1])
//print(dd)
