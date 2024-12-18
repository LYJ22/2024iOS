//
//  ViewController.swift
//  VendingMachine
//
//  Created by lyj on 12/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var labelItemCount: UILabel!
    @IBOutlet weak var labelItemPrice: UILabel!
    @IBOutlet weak var textFieldItemCount: UITextField!
    
    let vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelItemCount.text = "남은 수량: \(vendingMachine.itemCount)개"
        labelItemPrice.text = "가격: \(vendingMachine.itemPrice)개"
    }

    @IBAction func addDeposit(_ sender: UIButton) {
        if let depositAdded = sender.titleLabel?.text, let depositAddedInt = Int(depositAdded){
            labelDisplay.text = vendingMachine.receiveMoney(depositAddedInt)
        } else {
            showAlert(title: "에러", message: "투입 금액이 적절하지 않습니다.")
        }
        
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        var result: String?
        
        if let itemCountOrdered = textFieldItemCount.text, let itemCountOrderedInt = Int(itemCountOrdered){
            do{
                result = try vendingMachine.vend(numberOfItems: itemCountOrderedInt)
            }catch VendingMachineError.insufficientFunds(let moneyNeeded){
                showAlert(title: "오류", message: "금액이 \(moneyNeeded)원 만큼 모자릅니다.")
            }catch VendingMachineError.outOfStock(let currentItemCount){
                showAlert(title: "오류", message: "남은 수량이 \(currentItemCount)밖에 없습니다.")
            }catch{
                print(error)
            }
            
            if let result = result {
                textFieldItemCount.text = ""
                labelDisplay.text = "0"
                labelItemCount.text = "남은 수량: \(vendingMachine.itemCount)"
                showAlert(title: "구입 성공", message: result)
            }
        }
        else{
            showAlert(title: "오류", message: "주문 수량을 확인해주세요.")
        }
    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

