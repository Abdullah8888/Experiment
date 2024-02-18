//
//  sam.swift
//  Experiment
//
//  Created by Abdullah on 09/09/2021.
//

import Foundation

protocol A1 {
    
    func makePayment()
}

protocol A2 {
    
    func makeMoney()
}

class AA2: A2 {
    func makeMoney() {
        print("make money")
    }
}

class MyClasssA {
    
    var a2: A2
    
    init(a2: A2) {
        self.a2 = a2
    }
    
    func doSomething() {
        a2.makeMoney()
    }
}

class Lapo {
    
    func someGuy() {
        let dd  = DIContainer().createMyClasssA()
        dd.doSomething()
    }
}

class DIContainer {
    
    func createMyClasssA() -> MyClasssA {
        let aa2 = AA2()
        return MyClasssA(a2:aa2)
    }
    
}

func pala3() {
    
}
