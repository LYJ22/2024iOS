//
//  Truck.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import Foundation

class Truck: Car{
    var isDiesel: Bool
    
    init(name: String, description: String, photo: String, isDiesel: Bool) {
        self.isDiesel = isDiesel
        super.init(name: name, description: description, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은(는) 트럭 소리를 냅니다."
    }
}
