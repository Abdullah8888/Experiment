//
//  DependencyInjectionExample.swift
//  Experiment
//
//  Created by Abdullah on 22/11/2021.
//

import Foundation

protocol Propulsion {
    func move()
}

class RaceCarEngine: Propulsion {
    func move() {
        print("Vrrrooooommm!!")
    }
}

class Car {
    var engine: Propulsion?
    var carName: String?
    
    init(carName: String, engine: RaceCarEngine) {
        self.engine = engine
        self.carName = carName
    }

    convenience init(carName: String) {
        self.init(carName: carName, engine: RaceCarEngine())
    }
    
    func forward() {
        engine?.move()
    }
}

class ClassA {
    var a,b: String
    init(a: String, b: String) {
        self.a = a
        self.b = b
    }
    convenience init(a: String) {
        self.init(a: a, b: "b")
    }
}

enum AA {
    case loginPassed
    case loginAttempt
}

extension AA {
    var name: String {
        "sadf"
    }
}

//let dgt = Car(carName: "sdf")
