//
//  MyPageViewController.swift
//  HCar
//
//  Created by lyj on 12/18/24.
//

import UIKit
import FirebaseAuth

class MyPageViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLogout(_ sender: UIButton) {
        logoutUser()
    }
    
    func logoutUser(){
        do{
            try Auth.auth().signOut()
            print("로그아웃 성공!")
            self.navigateToIntroScreen()
        } catch let signOutError as NSError{
            print("로그아웃 중 오류 발생: \(signOutError.localizedDescription)")
        }
    }

    func navigateToIntroScreen(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let introVC = storyboard.instantiateViewController(withIdentifier: "introViewcontroller") as? IntroViewController{
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first {
                window.rootViewController = introVC
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }else{
            print("introViewcontroller를 찾을 수 없습니다.")
        }
    }
}
