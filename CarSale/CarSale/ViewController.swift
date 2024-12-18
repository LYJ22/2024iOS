//
//  ViewController.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewSpacing = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CarCellDelegate{
    
    // 차 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CarSale.shared.allCars().count
    }
    
    // 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carCell", for: indexPath) as! CarCell
        let car = CarSale.shared.allCars()[indexPath.row]
        // 차량 사진
        cell.imageView.image = UIImage(named: car.photo)
        cell.labelName.text = car.name
        cell.labelDescription.text = car.description
        cell.labelFeature.text = getFeature(car: car)
        
        cell.delegate = self
        cell.tag = indexPath.row
        
        return cell
    }
    
    func getFeature(car: Car) -> String {
        var feature = ""
        switch car {
        case let sedan as Sedan:
            feature = sedan.isElectric ? "전기차 입니다" : "전기차가 아닙니다."
        case let truck as Truck:
            feature = truck.isDiesel ? "디젤차 입니다" : "디젤차가 아닙니다."
        case let sportscar as Sportscar:
            feature = sportscar.Convertible ? "오픈카 입니다" : "오픈카가 아닙니다."
        default: break
        }
        return feature
    }
    
    // collectionview의 cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - collectionViewSpacing) / 2
        
        return CGSize(width: width, height: width)
    }
    
    func didTapPhoto(at index: Int) {
        let car = CarSale.shared.allCars()[index]
        let alert = UIAlertController(title: car.makeSound(), message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    func didTapSell(at index: Int) {
        CarSale.shared.removeCar(at: index)
        collectionView.reloadData()
    }
}


