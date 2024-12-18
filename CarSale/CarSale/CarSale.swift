//
//  CarSale.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import Foundation

class CarSale {
    static let shared = CarSale()
    private init(){}
    
    private var cars: [Car] = [
        Sedan(name: "소나타", description: "중형세단", photo: "sonata", isElectric: false),
        Sedan(name: "아우라", description: "소형세단", photo: "aura", isElectric: false),
        Truck(name: "봉고", description: "트럭", photo: "truck", isDiesel: false),
        Sportscar(name: "맥라렌", description: "스포츠카", photo: "sportscar", Convertible: false)
    ]
    
    func allCars() -> [Car]{
        return cars
    }
    func addCar(car: Car){
        cars.append(car)
    }
    func removeCar(at index: Int){
        cars.remove(at: index)
    }
}
