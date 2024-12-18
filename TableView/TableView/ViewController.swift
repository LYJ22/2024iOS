//
//  ViewController.swift
//  TableView
//
//  Created by lyj on 12/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    // 메모를 저장할 배열
    var memoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addMemo(_ sender: UIButton) {
        if textField.text! != "" {
            memoList.append(textField.text!)
        }
        tableView.reloadData()  // 테이블 뷰 갱신
        textField.text = ""
        
        // 스크롤을 맨 아래로 이동
        let lastIndex = IndexPath(row: memoList.count - 1, section: 0)
        tableView.scrollToRow(at: lastIndex, at: .bottom, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
}

