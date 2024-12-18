//
//  Sedan.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import Foundation

class Sedan: Car{
    var isElectric: Bool
    
    init(name: String, description: String, photo: String, isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: name, description: description, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은(는) 세단 소리를 냅니다."
    }
}
