//
//  SecondViewController.swift
//  TabBar
//
//  Created by lyj on 12/10/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var reply = "답장 내용"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        label.text = reply
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let replyVC = segue.destination as! ReplyViewController
        if segue.identifier == "ReplyVC"{
            replyVC.message = textField.text!
        }
        replyVC.onReply = { replyMessage in
            self.reply = replyMessage
        }
    }

}
