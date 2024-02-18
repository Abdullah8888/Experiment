//
//  ComposeSample.swift
//  Experiment
//
//  Created by Abdullah on 23/06/2022.
//

import Foundation

protocol AnimalDelegate {
    
    func sayHi()
}

class Cat: AnimalDelegate {
    
    func sayHi() {
        print("Hi, I'm a cat")
    }
}

class Bird: AnimalDelegate {
    func sayHi() {
        print("Hi, I'm a bird")
    }
}

class Dogg: AnimalDelegate {
    func sayHi() {
        print("Hi, I'm a dog")
    }
}

class AnimalComposite: AnimalDelegate {
    
    private let animals: [AnimalDelegate]
    
    init (animals: [AnimalDelegate]) {
        self.animals = animals
    }
    
    func sayHi() {
        animals.forEach{$0.sayHi()}
    }
}

//Then you can compose them like so below
//let animal = AnimalComposite(animals: [Cat(), Bird(), Dogg()])
//animal.sayHi()
