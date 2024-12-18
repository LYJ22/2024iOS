//
//  ViewController.swift
//  Zoo
//
//  Created by lyj on 12/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewSpacing = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, AnimalCellDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Zoo.shared.allAnimals().count
    }
    
    // collectionview cell의 object
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as! AnimalCell
        let animal = Zoo.shared.allAnimals()[indexPath.row]
        cell.imageViewPhoto.image = animal.photo ??  UIImage(named: animal.photoName ?? "")
        cell.labelName.text = animal.name
        cell.labelDiet.text = "식성: " + animal.diet
        // 개별 특성
        cell.labelFeature.text = getTrait(animal: animal)
        
        // 델리것 설정
        cell.delegate = self
        cell.tag = indexPath.row // 셸에 태그를 설정하여 동물 인덱스 추적
        
        return cell
    }
    
    func getTrait(animal: Animal) -> String {
        var trait = ""
        switch animal {
        case let mammal as Mammal:
            trait = mammal.shortFur ? "털 짧음" : "털 김"
        case let bird as Bird:
            trait = bird.canFly ? "날 수 있음" : "날 수 없음"
        case let reptile as Reptile:
            trait = reptile.temperatureControl ? "온도 조절 가능" : "온도 조절 불가"
        default:
            break
        }
        return trait
    }
    
    // collectionview의 cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - collectionViewSpacing) / 2
        
        return CGSize(width: width, height: width * 1.2)
    }
    
    func didTapPhoto(at index: Int) {
        let animal = Zoo.shared.allAnimals()[index]
        let alert = UIAlertController(title: animal.makeSound(), message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    func didTapRemove(at index: Int) {
        Zoo.shared.removeAnimal(at: index)
        collectionView.reloadData()
    }
}
