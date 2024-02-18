//
//  Turing.swift
//  Experiment
//
//  Created by Abdullah on 01/09/2022.
//

import Foundation

//52CD+

func calPoint(_ ops: [String]) -> Int {
    var count = ops.count
    var arr: [Int] = []
    var sum = 0
    for el in ops {
        if el == "+" {
            var dd = arr[arr.count-1] + arr[arr.count-2]
            arr.append(dd)
        }
        else if el == "C" {
            arr.removeLast()
        }
        else if el == "D" {
            var dd = arr.last! * 2
            arr.append(dd)
        }
        else {
            arr.append(Int(el)!)
        }
    }
    sum = arr.reduce(0,+)
    return sum
}

//()[]{}
//([)]
//func validParenthesis(_ s: String) -> Bool {
//    var isValidSymbol: Bool = false
//    let validCouples = ["()","[]","{}"]
//    var stack: [String] = []
//    s.index
//    for (index, el) in s.enumerated() {
//        if index > 0 {
//            var ads =
//        }
//        else {
//            stack.append("\(el)")
//        }
//    }
//    return isValidSymbol
//}

func isValidParenthesis(_ s: String) -> Bool {
    let rule = Array("()[]{}")
    var stack = [Character]()
    for (_, char) in s.enumerated() {
        print("aa is \(rule.firstIndex(of: char))")
        if rule.firstIndex(of: char)! % 2 == 0 {    // open brackets
            stack.append(char)
        } else {                            // close brackets
            if stack.isEmpty {
                return false
            } else {
                print("bb is \(rule.firstIndex(of: char))")
                print("cc is \(rule.firstIndex(of: stack.last!))")
                if rule.firstIndex(of: char)! - rule.firstIndex(of: stack.last!)! == 1 {  //barckets matched
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
    }
    return stack.isEmpty
}
