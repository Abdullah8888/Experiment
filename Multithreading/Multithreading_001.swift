//
//  Multithreading_001.swift
//  Experiment
//
//  Created by Abdullah on 02/04/2023.
//

import Foundation

class Multithreading_001 {
    
    var array: [Int] = []
    var array2: [Int] = []
    let queue = DispatchQueue(label: "DispatchQueue", attributes: .concurrent)
    
    func startOperation() {
        print("welcome")
        queue.async {
            for n in 1...5 {
                print("Queue async without barrier \(n)")
            }
        }
        
        
//        queue.sync(flags: .barrier) {
//            for n in 1...5 {
//                print("Queue sync with barrier \(n)")
//            }
//        }
        
//        queue.async(flags: .barrier) {
//            for n in 1...5 {
//                print("Queue async with barrier \(n)")
//            }
//        }
    
    }
}
