//
//  TestCode.swift
//  Experiment
//
//  Created by Abdullah on 09/09/2021.
//

import Foundation

/* Overiding property and methods */
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("form base")
    }
}

class Train: Vehicle {
    
    override var description: String {
        return "overrided property"
    }
    override func makeNoise() {
        print("form subclss")
    }
}

/* Experiment on Enums and struct */

enum Animal {
    case dog, cat, rat
    init?(name: Animal) {
        self = name
    }
    func changeAnimalName() -> Animal{
        return .rat
    }
}


struct Animals {
    var answer: String?
    var name: String? {
        get {
            guard let ans = answer else {
                return " no answer"
            }
            return ans
        }
        set {
             answer = "set name"
        }
    }
    
    mutating func switchName() {
        name = "switch name"
    }
}

protocol SomeProtocols {
    var property1: String {get set}
}

//Iterating over Enumeration Cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
    init(it: Beverage) {
        self = it
    }
    func printAllCases() {
        for beverage in Beverage.allCases {
            print(beverage)
        }
    }
}

//Recursive Enumerations
/*A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.*/

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

//Enums with asoociated values
/* This is use to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.**/
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

func setBarcode(productBarcode: Barcode){
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
}


/* Extensions
 Subscripts
 Extensions can add new subscripts to an existing type. This example adds an integer subscript to Swift’s built-in Int type. This subscript [n] returns the decimal digit n places in from the right of the number:

 123456789[0] returns 9
 123456789[1] returns 8 */
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
//  746381295[0]
// returns 5
//  746381295[1]
// returns 9
//  746381295[2]
// returns 2
//  746381295[8]
// returns 7

func isAdmissibleOverpayment(prices: [Double], notes: [String], x: Double) -> Bool {
    var overPay: Double = 0.0
    for (i, _) in prices.enumerated() {
        if !notes[i].contains("Same") {
            let pVal = Double(notes[i].split(separator: "%")[0])!
            if notes[i].contains("hi") {
                let inStorePrice = (prices[i] * 100) * 1/abs(100 + pVal)
                overPay += abs(prices[i] - inStorePrice)
            }
            else {
                let inStorePrice = (prices[i] * 100) * 1/abs(100 - pVal)
                overPay -= abs(prices[i] - inStorePrice)
            }
        }
    }
    return overPay <= x ? true : false
}

func sampleChe() {
    var ddd = false
    var b: [Int] = [40, 66]
    var ch = b.filter { gg in
        ddd = gg + 2 == 42 ? true : false
        return ddd
    }
    print("the bb \(ch) \(ddd)")
}

func sample(prices: [Double], notes: [String], x: Double) -> Bool {
    var overPay: Double = 0.0
    var stp: Double = 0.0
    for (index, note) in notes.enumerated() {
        if note.contains("higher") {
            if let percentValue = Double(note.split(separator: "%")[0]) {
                stp = 100 * prices[index] / (percentValue  + 100)
                overPay += prices[index] - stp
            }
        }
        else if note.contains("lower") {
            if let percentValue = Double(note.split(separator: "%")[0]) {
                stp = 100 * prices[index] / (100 - percentValue)
                overPay += prices[index] - stp
            }
        }
    }
    return overPay <= x ? true : false
}


func arrayInintersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        var arr1 = nums1
        var arr2 = nums2
    
        if arr1.count > arr2.count {
            for (index, _) in arr2.enumerated() {
                if arr1.contains(arr2[index]) {
                    let elementIndex = arr1.firstIndex(of: arr2[index])
                    _ = arr1.remove(at: elementIndex!)
                    result.append(arr2[index])
                }
            }
        }
        else {
            for (index, _) in arr1.enumerated() {
                if arr2.contains(arr1[index]) {
                    let elementIndex = arr2.firstIndex(of: arr1[index])
                    _ = arr2.remove(at: elementIndex!)
                    result.append(arr1[index])
                }
            }
        }
        return result
    }
