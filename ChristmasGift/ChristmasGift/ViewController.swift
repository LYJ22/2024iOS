//
//  ViewController.swift
//  ChristmasGift
//
//  Created by lyj on 12/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelMessage: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedCookie(_ sender: UIButton) {
        imageView.image = UIImage(named: "cookie")
    }
    
    @IBAction func clicked1(_ sender: UIButton) {
        imageView.image = UIImage(named: "card")
    }
    
    @IBAction func clicked2(_ sender: UIButton) {
        imageView.image = UIImage(named: "flower")
    }
    
    
    @IBAction func buttonOk(_ sender: UIButton) {
        let selectedDate = datePicker.date
        let formatter = DateFormatter() //날짜와 시간 포매팅
        formatter.dateStyle = .medium   //날짜 스타일 설정
        formatter.timeStyle = .short    //시간 스타일 설정
        
        let formattedDate = formatter.string(from: selectedDate)
        
        let alertController = UIAlertController(title: "\(labelName.text!)", message: "메세지: \(labelMessage.text!)\n배송 날짜: \(formattedDate)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancleAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

