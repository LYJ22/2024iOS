//
//  ReplyViewController.swift
//  TabBar
//
//  Created by lyj on 12/10/24.
//

import UIKit

class ReplyViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var message = ""
    var onReply: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = message
    }
    
    @IBAction func buttonOk(_ sender: UIBarButtonItem) {
        onReply?(textField.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
