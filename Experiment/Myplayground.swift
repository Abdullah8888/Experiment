//
//  Myplayground.swift
//  Experiment
//
//  Created by Abdullah on 05/04/2022.
//

import Foundation



//struct Person: Equatable {
//    var name: String
//    var age: String
//
//    static func ==(lhs: Person, rhs: Person) -> Bool {
//        return lhs.name == rhs.name && lhs.age == rhs.age
//    }
//}




class Parentt: Equatable, Hashable {
    
    
    var name: String?
    var phone: String?
    
 
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
    
    static func == (lhs: Parentt, rhs: Parentt) -> Bool {
        lhs.phone == lhs.phone && lhs.name == rhs.name
    }
//
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(phone)
    }
}

class AAA: Parentt {
    override init(name: String, phone: String) {
        super.init(name: name, phone: phone)
    }
}

class BBB: Parentt {
    var hobby: String?
    init(name: String, phone: String, hobby: String) {
        super.init(name: name, phone: phone)
        self.hobby = hobby
    }
}



func letSee() {
//    let aa = [AAA(name: "AA", phone: "09"), AAA(name: "AA1", phone: "091"), BBB(name: "BB", phone: "08"), BBB(name: "BB1", phone: "081")]

    let asf = [AAA(name: "AA", phone: "09"), AAA(name: "AA1", phone: "091"), AAA(name: "AA2", phone: "092"), AAA(name: "AA3", phone: "093"), AAA(name: "AA4", phone: "094")]
    
    let asf2 = [BBB(name: "BB", phone: "08", hobby: "h1"), BBB(name: "BB1", phone: "081", hobby: "h2"), BBB(name: "AA3", phone: "093", hobby: "h3")]
    
    let ans = Array(Set(asf).subtracting(Set(asf2)))
    
    //print(asf)
    
    print(ans)
    
    for el in ans {
        print(el)
    }
    
    var gg: [Parentt] = []
    gg = asf
}
//This usually means either that the type violates Hashable's requirements, or
//that members of such a set were mutated after insertion.
