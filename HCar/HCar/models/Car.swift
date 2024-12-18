//
//  Car.swift
//  HCar
//
//  Created by lyj on 12/17/24.
//

import Foundation
import UIKit

struct Car: Codable{
    var id: String?
    let name: String
    var price: Int
    let year: Int
    let image: String
    let details: String // 자세한 설명
    let userId: String // 판매자 id
    var isSale: Bool? = false
}

/*class Car{
    
    let name: String
    var price: Int
    let year: Int
    let imageName: String?
    let image: UIImage?
    
    init(name: String, price: Int, year: Int, imageName: String?, image: UIImage?) {
        self.name = name
        self.price = price
        self.year = year
        self.imageName = imageName
        self.image = image
    }
}*/
