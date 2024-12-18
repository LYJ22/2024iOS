//
//  CarListManager.swift
//  HCar
//
//  Created by lyj on 12/17/24.
//

import Foundation

class CarListManager {
    static let shared = CarListManager() //싱글톤 패턴
    private init() {}
    
    public var cars: [Car] = [
//        Car(name: "소나타", price: 1500, year: 2020, imageName: "sonata1"/*, image: nil*/),
//        Car(name: "제네시스", price: 4200, year: 2022, imageName: "genesis"/*, image: nil*/),
//        Car(name: "투싼", price: 1800, year: 2021, imageName: "tusan"/*, image: nil*/),
//        Car(name: "그랜저", price: 2800, year: 2020, imageName: "grandeur"/*, image: nil*/)
    ]
    
    func allCars() -> [Car] {
        return cars
    }
    
    func setAllCars(cars: [Car]) {
        self.cars = cars
    }
    
    //func addCar(_ car: Car){
    //    cars.append(car)
    //}
}
