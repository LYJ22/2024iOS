//
//  Bird.swift
//  Zoo
//
//  Created by lyj on 12/12/24.
//

import Foundation
import UIKit

class Bird: Animal{
    var canFly: Bool
    
    init(name: String, diet: String, photoName: String? = nil, photo: UIImage? = nil, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, diet: diet, photoName: photoName, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은(는) 짹짹!!"
    }
}
