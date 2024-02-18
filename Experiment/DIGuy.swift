//
//  DIGuy.swift
//  Experiment
//
//  Created by Abdullah on 25/04/2022.
//

import Foundation

protocol NetworkServiceDelegate {
    func fetch()
}

class NetworkService: NetworkServiceDelegate {
    func fetch() {
        print("na cat, na catt")
    }
    
    
}
protocol GetCatUseCase: AnyObject {
    func fetchCat()
}

class GetCat: GetCatUseCase {
    private var netService: NetworkServiceDelegate?
    
    init(netService: NetworkServiceDelegate) {
        self.netService = netService
    }
    
    func fetchCat() {
        netService?.fetch()
    }
}

protocol RootFactory {
    func makeGetCat() -> GetCat
    func makeDF() -> DF
}

class Depen: RootFactory {
    func makeDF() -> DF {
        let makeGetCat = makeGetCat()
        return DF(dd: makeGetCat)
    }
    
    
    func makeGetCat() -> GetCat {
        GetCat(netService: NetworkService())
    }
}

class DF {
    var dd: GetCatUseCase?
    init(dd: GetCatUseCase) {
        self.dd = dd
    }
    
    func gg() {
        dd?.fetchCat()
    }
}
class FisrtClass {
    let dependency = Depen()
    
    init() {
        
    }
    func star() {
        let makeDF = dependency.makeDF()
        makeDF.gg()
        
    }
}
