//
//  Car.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import Foundation

protocol SoundMaking {
    func makeSound() -> String
}

class Car {
    var name: String
    var description: String
    var photo: String
    
    init(name: String, description: String, photo: String) {
        self.name = name
        self.description = description
        self.photo = photo
    }
    
    func makeSound() -> String {
        return "일반적인 자동차 소리"
    }
}
