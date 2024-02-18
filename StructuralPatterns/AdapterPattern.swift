//
//  AdapterPattern.swift
//  Experiment
//
//  Created by Abdullah on 14/11/2022.
//

import Foundation
/**
 Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate
 Resources:- https://medium.com/swiftcraft/swift-solutions-adapter-pattern-a2118a6a2910,
 https://refactoring.guru/design-patterns/adapter/swift/example#example-1,
 
 Use Cases
 The Adapter Pattern should be used when the following are true:
 i. A component shares similar functionality with existing objects in your app.
 ii. Despite sharing similar functionality, the component has an interface that is incompatible with other objects in your app. The component is i often from a third party framework.
 iv. The component’s source code cannot (or should not) be modified.
 v. The component needs to integrate with your app.
 */

//Simple Illustration
protocol SomeAnimal {
    func behavior()
}

struct BirdStruct: SomeAnimal {
    func behavior() {
        print("Bird can jump")
    }
}

//Now, let say there is another Animal outside the scope above.
//The Adaptee
struct FrogStruct {
    func leap() {
        print("I can leap")
    }
}

extension FrogStruct: SomeAnimal {
    func behavior() {
        leap()
    }
}

func entryPoint1() {
    let animals: [SomeAnimal] = [BirdStruct(), FrogStruct()]
    animals.forEach{ $0.behavior() }
}
