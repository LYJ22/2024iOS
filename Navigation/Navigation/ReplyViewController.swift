//
//  ReplyViewController.swift
//  Navigation
//
//  Created by lyj on 12/10/24.
//

import UIKit

//protocol ReplyDelegate {
//    func reply(_ controller: ReplyViewController, message: String)
//}

class ReplyViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //var delegate: ReplyDelegate?
    var message = ""
    var onReply: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = message
    }

    @IBAction func barButtonOk(_ sender: UIBarButtonItem) {
//        if delegate != nil{
//            delegate?.reply(self, message: textField.text!)
//        }
        onReply?(textField.text!)
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
}
