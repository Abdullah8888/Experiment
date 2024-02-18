//
//  RetainCycle.swift
//  Experiment
//
//  Created by Abdullah on 16/04/2022.
//

import Foundation

class MyViewModel {
    var handler: ((Int) -> Void)?
    
    func myFunct() {
        
        handler?(4)
    }
    
    
    deinit {
        print("I'm removed from memory")
    }
}

class MyViewModelB {
    
    var dd: MyViewModel? {
        let dd = MyViewModel()
        dd.myFunct()
        return dd
    }
    
    func myFunc() {
        dd?.handler = { [unowned self] dd in
            self.printFunc()
        }
        //dd = nil
    }
    
    func printFunc() {
        print("I'm called")
    }
    
    
    deinit {
        print("I'm removed from memory 2")
    }
}

class ABTest {
    var buyButton: (() -> Void)?
    //var aBTest2: ABTest2?
    

    func start() {
        print("start")
        buyButton = {[weak self] in
            self?.showShoppingCart()
            //self?.aBTest2?.start()
        }
    }

    private func showShoppingCart() {
        print("mjjkjk")
    }
    
    deinit {
        print("\(Self.self) is out")
    }
}

class ABTest2 {
    func start() {
        print("hyu 2")
    }
    deinit {
        print("\(Self.self) is out")
    }
}


class ContactBase: Equatable, Hashable {
    var phone: String?
    
    static func == (lhs: ContactBase, rhs: ContactBase) -> Bool {
        lhs.phone == rhs.phone
    }
//
    func hash(into hasher: inout Hasher) {
            hasher.combine(phone)
    }
}

class ContactA: ContactBase {
    var id: String?
    var name: String?
}

class ContactB: ContactBase {
    var uid: String?
    var address: String?
}

func testContact() {
    let contactA1 = ContactA()
    contactA1.id = "1"
    contactA1.phone = "081"
    let contactA2 = ContactA()
    contactA2.id = "2"
    contactA2.phone = "082"
    let contactA3 = ContactA()
    contactA3.id = "3"
    contactA3.phone = "083"
    
    let contactA: [ContactA] = [contactA1,contactA2,contactA3]
    
    let contactB1 = ContactB()
    contactB1.uid = "1"
    contactB1.address = "add1"
    contactB1.phone = "081"
    
    let contactB: [ContactB] = [contactB1]
    
    let res = Set(contactA).subtracting(Set(contactB))
    
    print(contactA)
    print(contactB)
    print(res.self)
    dump(res)
}
