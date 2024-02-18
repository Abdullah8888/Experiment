//
//  LiskovSubstitionExample.swift
//  Experiment
//
//  Created by Abdullah on 22/11/2021.
//

import Foundation

class LiskovClass {
    func printName() {
        print("the bokk")
    }
}

class LiskovSubClass: LiskovClass {
    override func printName() {
        print("the bookl")
    }
}


