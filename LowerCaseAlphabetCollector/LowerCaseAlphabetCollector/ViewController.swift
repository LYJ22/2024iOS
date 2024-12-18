//
//  ViewController.swift
//  LowerCaseAlphabetCollector
//
//  Created by lyj on 12/11/24.
//
// 사용자 입력을 받아서 소문자를 모으는 앱
// 소문자의 중복을 허용하지 않는다.

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var lowerCastAlphabets: Set<Character> = []
    var lowerCastAlphabetsArray: Array<Character> = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    @IBAction func register(_ sender: UIButton) {
        let input = textField.text!
        if input.count == 1 {
            let char = Character(input)
            if char.isLowercase{
                lowerCastAlphabets.insert(char)
                print("lowerCastAlphabets: \(lowerCastAlphabets)")
                
                // set을 array로 변환하기
                lowerCastAlphabetsArray = Array(lowerCastAlphabets)
                lowerCastAlphabetsArray = lowerCastAlphabetsArray.sorted()
                print("lowerCastAlphabetsArray: \(lowerCastAlphabetsArray)")
                
                tableView.reloadData()
            }
            else{
                showAlert(on: self, title: "소문자가 아닙니다.")
            }
        }
        else{
            showAlert(on: self, title: "한 글자가 아닙니다.")
        }
        
    }
    
    func showAlert( on viewController: UIViewController, title: String){
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lowerCastAlphabetsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(lowerCastAlphabetsArray[indexPath.row])
        return cell
    }
    
}

