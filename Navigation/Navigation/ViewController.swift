//
//  ViewController.swift
//  Navigation
//
//  Created by lyj on 12/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var reply = "답장 내용"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool){
        print("viewWillAppear")
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

