//
//  IntroViewController.swift
//  HCar
//
//  Created by lyj on 12/18/24.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

enum SignupOrLogin{
    case signup
    case login
}

class IntroViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldNick: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPw: UITextField!
    @IBOutlet weak var buttonComplete: UIButton!
    
    var signupOrLogin = SignupOrLogin.signup
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signupOrLogin = .signup
            textFieldNick.isHidden = false
            buttonComplete.setTitle("회원가입", for: .normal)
        }else{
            signupOrLogin = .login
            textFieldNick.isHidden = true
            buttonComplete.setTitle("로그인", for: .normal)
        }
    }
    
    @IBAction func complete(_ sender: UIButton) {
        switch signupOrLogin {
        case .signup:
            signup()
        case .login:
            login()
        }
    }
    
    func signup(){
        guard let email = textFieldEmail.text, !email.isEmpty, let pw = textFieldPw.text, !pw.isEmpty, let nickname = textFieldNick.text, !nickname.isEmpty else{
            showAlert("Error", "모든 필드를 입력해주세요.")
            return
        }
        
        // 파이어베이스 auth
        Auth.auth().createUser(withEmail: email, password: pw){
            (AuthDataResult, error) in
            if let error = error {
                self.showAlert("회원가입 오류", error.localizedDescription)
                return
            }
            // 파이어베이스 Auth가 성공적으로 완료되면 파이어베이스 스토어에 유저정보 저장
            print("회원가입 성공!")
            self.saveUser(email: email, nickname: nickname)
        }
    }
    
    func saveUser(email: String, nickname: String){
        let user = User(email: email, nickname: nickname)
        let db = Firestore.firestore()
        
        //Firestore에 사용자 데이터 저장
        db.collection("users").document(Auth.auth().currentUser!.uid).setData([
            "email": user.email,
            "nickname": user.nickname
        ]){ error in
            if let error = error {
                self.showAlert("Firestore 오류", error.localizedDescription)
            }else{
                // 유저 정보 저장 완료
                self.navigateToHomeScreen()
            }
        }
    }

    func login(){
        guard let email = textFieldEmail.text, !email.isEmpty, let pw = textFieldPw.text, !pw.isEmpty else{
            showAlert("Error", "이메일과 비밀번호를 입력해주세요.")
            return
        }
        
        //Firebase Auth 로그인
        Auth.auth().signIn(withEmail: email, password: pw){ (authResult, error) in
            if let error = error {
                self.showAlert("로그인 오류", error.localizedDescription)
                return
            }
            
            // 로그인 성공
            print("로그인 성공")
            self.navigateToHomeScreen()
        }
    }
    
    
    func showAlert(_ title: String ,_ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // 로그인 완료 후 홈 화면으로 이동
    func navigateToHomeScreen(){
        if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "mainTabBarController"){
            //self.navigationController?.pushViewController(homeVC, animated: true)
            present(homeVC, animated: true, completion: nil)
        }
    }
}
