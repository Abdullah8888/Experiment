//
//  ada_001.swift
//  Experiment
//
//  Created by Abdullah on 25/02/2023.
//

import Foundation

class Sample {
    var secondSample: SecondSample
    init(secondSample: SecondSample) {
        self.secondSample = secondSample
    }
    deinit {
        print("1")
    }
}

class SecondSample {
    weak var sample: Sample?
    deinit {
        print("2")
    }
}

func testSamples() {
    var secondSample: SecondSample? = SecondSample()
    var sample = Sample(secondSample: secondSample!)
    secondSample?.sample = sample
    secondSample = nil
}

class Aman {
    var id: String? {
        didSet {
            print("A \(id)")
        }
    }
}

class Bman: Aman {
    override var id: String? {
        didSet {
            print("B \(id)")
        }
    }
}

class Cman {
    var dman: Dman?
    func show() {
        print("I dey")
    }
    
    deinit {
        print("Cman is out")
    }
}

class Dman {
    weak var cman: Cman?
    init() {
        
    }
    
    func show() {
        print("I don show")
    }
    deinit {
        print("Dman is out")
    }
}

func testCode() {
    let sample  = Dman()
    let sample1  = Cman()
    print("\(sample.cman)")
    sample.cman = sample1
    
    
    sample1.dman = sample
    
    sample.show()
    
}
