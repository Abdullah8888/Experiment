//
//  RandomMain.swift
//  Experiment
//
//  Created by Abdullah on 19/04/2024.
//

import Foundation
protocol ObjectProtocol: AnyObject {
    func performAction()
}

// Real subject class that we want to manage the lifecycle of
class RealObject: ObjectProtocol {
    func performAction() {
        print("RealObject performing action")
    }
    deinit {
        print("RealObject is out")
    }
}

// Proxy class that will manage the reference counting of the real object
class ObjectProxy: ObjectProtocol {
    // Weak reference to the real object
    var realObject: RealObject?
    
    init(realObject: RealObject) {
        self.realObject = realObject
    }
    
    func performAction() {
        realObject?.performAction()
    }
    
    deinit {
        print("ObjectProxy is out")
    }
}

func runRandomMain() {
    // Usage example
//    var realObject: RealObject? = RealObject()
//    var proxy: ObjectProxy? = ObjectProxy(realObject: realObject!)
//
//    // Perform action through the proxy
//    proxy?.performAction() // Output: RealObject performing action
//
//    // Set the real object and proxy to nil to observe deallocation
//    realObject = nil
//    proxy = nil
    
    var test1 = "10001001"
    var res = test1.split(separator: "1")
    var ddd = 1 / 2
    print(ddd)
    var num = 32
    var binaryNumber = ""
        while num != 0 {
            var remainder = num % 2
            binaryNumber = String(remainder) + binaryNumber
            num = num / 2
        }
    print(binaryNumber)
}

