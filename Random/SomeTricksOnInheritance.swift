//
//  SomeTricksOnInheritance.swift
//  Experiment
//
//  Created by Abdullah on 14/11/2022.
//

import Foundation
class Clock {
    var time: String? {
        willSet {
            print("the parent \(newValue)")
        }
//        didSet {
//            print("the parent")
//        }
    }
}

class MyClock: Clock {
    override var time: String? {
        willSet {
            print("the child \(newValue)")
        }
//        didSet {
//            print("the child")
//        }
    }
}

//var timeObje = MyClock.init()
//MyClock.time = "time2"
//print(MyClock.time)

