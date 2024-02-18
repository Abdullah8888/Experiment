//
//  Associatedtype.swift
//  Experiment
//
//  Created by Abdullah on 16/04/2022.
//

import Foundation

protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

struct NameData {
    let firstName: String
    let lastName: String
}

struct AAAA: ItemStoring {
    var items: [NameData]
    
    func count() -> Int {
        items.count
    }
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}
