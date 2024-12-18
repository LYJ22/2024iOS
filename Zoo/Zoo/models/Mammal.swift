//
//  Mammal.swift
//  Zoo
//
//  Created by lyj on 12/12/24.
//

import Foundation
import UIKit

class Mammal: Animal{
    var shortFur: Bool
    
    init(name: String, diet: String, photoName: String? = nil, photo: UIImage? = nil, shortFur: Bool) {
        self.shortFur = shortFur
        super.init(name: name, diet: diet, photoName: photoName, photo: photo)
    }
    
    override func makeSound() -> String {
        return "\(name)은(는) 포유류 소리를 냅니다."
    }
}
