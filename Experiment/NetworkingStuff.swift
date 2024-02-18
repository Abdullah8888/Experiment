//
//  NetworkingStuff.swift
//  Experiment
//
//  Created by Abdullah on 13/04/2022.
//

import Foundation

struct AAB {
    var name: String = ""
}

func isKongaPrimeCustomer(completion: @escaping (Result<AAB,Error>) -> ()) {
    
    let ss = AAB()
    completion(.success(ss))
    let errr: Error
    //let integerResult: Result<Int, Error> = .failure(let err)
    //integerResult
}


func asdmmmf() {
    isKongaPrimeCustomer { ddd in
        switch ddd {
        case .failure(let ss):
            print("this is \(ss)")
        case .success(let sap):
            print("this is \(sap.name)")
        }
    }
}

func testMethodA(callBack: () -> ()) {
    print("2")
//    testMethodAA {
//        print("3")
//        callBack()
//    }
    
}

func testMethodAA(callBack: () -> ()) {
    print("1")
    callBack()
}

func testD() {
    print("A")
    testMethodA {
        print("B")
    }
}
