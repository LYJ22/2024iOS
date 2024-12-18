//
//  SplashViewController.swift
//  HCar
//
//  Created by lyj on 12/17/24.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            if let user = Auth.auth().currentUser{
                print("로그인 상태입니다.")
                self.showScreen(withIdentifier: "mainTabBarController")
            }else{
                print("로그인하지 않았습니다.")
                self.showScreen(withIdentifier: "introViewcontroller")
            }
        }
    }
    

    private func showScreen(withIdentifier: String){
        if let mainVC = storyboard?.instantiateViewController(withIdentifier: withIdentifier){
            mainVC.modalTransitionStyle = .crossDissolve // 부드러운 화면 효과
            mainVC.modalPresentationStyle = .fullScreen
            self.present(mainVC, animated: true, completion: nil)
        }
    }

}
