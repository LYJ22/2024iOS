//
//  Zoo.swift
//  Zoo
//
//  Created by lyj on 12/12/24.
//

import Foundation

class Zoo {
    static let shared = Zoo() // 싱글톤 패턴
    private init(){}
    
    private var animals: [Animal] = [
        Mammal(name: "사자", diet: "육식", photoName: "lion", shortFur: false),
        Mammal(name: "사슴", diet: "초식", photoName: "deer", shortFur: true),
        Mammal(name: "판다", diet: "초식", photoName: "panda", shortFur: true),
        Bird(name: "앵무새", diet: "초식", photoName: "parrot", canFly: true)
    ]
    
    func allAnimals() -> [Animal]{
        return animals
    }
    func removeAnimal(at index: Int){
        animals.remove(at: index)
    }
    func addAnimal(_ animal: Animal){
        animals.append(animal)
    }
}
