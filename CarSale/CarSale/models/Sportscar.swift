//
//  Sportscar.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import Foundation

class Sportscar: Car{
    var Convertible: Bool
    
    init(name: String, description: String, photo: String, Convertible: Bool) {
        self.Convertible = Convertible
        super.init(name: name, description: description, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은(는) 스포츠카 소리를 냅니다."
    }
}
