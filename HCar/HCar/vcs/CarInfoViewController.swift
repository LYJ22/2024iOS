//
//  CarInfoViewController.swift
//  HCar
//
//  Created by lyj on 12/18/24.
//

import UIKit
import FirebaseFirestore

class CarInfoViewController: UIViewController {
    var car: Car?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    
    @IBOutlet weak var imgeViewPic: UIImageView!
    @IBOutlet weak var buttonBuy: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let car = car{
            print("car: \(car)")
            labelName.text = car.name
            labelPrice.text = String(car.price)
            labelYear.text = String(car.year)
            labelDetails.text = car.details
            
            // 버튼 셋팅
            if let isSale = car.isSale {
                self.buttonBuy.isEnabled = false
                self.buttonBuy.setTitle("구매 완료된 차량입니다.", for: .normal)
            }
            
            // 차량 이미지 불러오기
            if let url = URL(string: car.image){
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Error loading image: \(error)")
                        return
                    }
                    
                    if let data = data, let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.imgeViewPic.image = image
                        }
                    }
                }.resume()
            }
        }
    }
    
    @IBAction func buttonPressBuy(_ sender: UIButton) {
        let alertController = UIAlertController(title: "차량 구매", message: "차량을 구매하시겠습니까?", preferredStyle: .actionSheet)
        
        let purchaseAction = UIAlertAction(title: "구매", style: .default) { _ in
            let db = Firestore.firestore()
            if let car = self.car, let id = car.id {
                db.collection("cars").document(id).updateData(["isSale": true]){ updateError in
                    if let updateError = updateError{
                        print("Error updating isSale : \(updateError)")
                    }else{
                        print("isSale successfully updated")
                        self.buttonBuy.isEnabled = false
                        self.buttonBuy.setTitle("구매 완료된 차량입니다.", for: .normal)
                        //self.navigationController?.popViewController(animated: true)
                    }
                }
            }
            
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(purchaseAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    

}
