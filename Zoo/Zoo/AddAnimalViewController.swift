//
//  AddAnimalViewController.swift
//  Zoo
//
//  Created by lyj on 12/13/24.
//

import UIKit

class AddAnimalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldDiet: UITextField!
    @IBOutlet weak var labelTrait: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    
    var animal: Animal?
    var selectedIndex: Int = 0
    var trait: Bool = false //스위치 값
    var animalImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        //UIAlertController 생성
        let alertController = UIAlertController(title: "사진 추가", message: "사진을 가져올 방법을 선택하세요.", preferredStyle: .actionSheet)
        //카메라 액션 추가
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { _ in
            self.openCamera()
        }
        //앨범 액션 추가
        let albumAction = UIAlertAction(title: "앨범", style: .default) { _ in
            self.openAlbum()
        }
        //취소 액션 추가
        let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true)
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
        else{
            showAlert("카메라를 사용할 수 없습니다.")
        }
    }
    
    func openAlbum(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }else{
            showAlert("앨범을 사용할 수 없습니다.")
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //UIImagePickerControllerDelegate 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            // 버튼에 이미지 설정
            setButtonImage(selectedImage)
        }
        else if let originalImage = info[.originalImage] as? UIImage{
            // 버튼에 원본 이미지 설정
            setButtonImage(originalImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //버튼에 이미지 설정
    func setButtonImage(_ image: UIImage){
        imageButton.setImage(image, for: .normal)
        //버튼 크기와 이미지 비율 유지
        imageButton.imageView?.contentMode = .scaleAspectFill
        imageButton.clipsToBounds = true
        
        animalImage = image
    }
    
    @IBAction func selectType(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        labelTrait.text = {
            switch selectedIndex{
            case 0: return "털이 짧은가요?"
            case 1: return "온도 조절이 가능한가요?"
            case 2: return "날 수 있나요?"
                
            default: return ""
            }
        }()
    }
    
    @IBAction func setTrait(_ sender: UISwitch) {
        trait = sender.isOn
    }
    
    @IBAction func buttonOk(_ sender: UIBarButtonItem) {
        animal = {
            switch selectedIndex{
            case 0: return Mammal(name: textFieldName.text!, diet: textFieldDiet.text!, photo: animalImage, shortFur: trait)
            case 1: return Reptile(name: textFieldName.text!, diet: textFieldDiet.text!, photo: animalImage, temperatureControl: trait)
            case 2: return Bird(name: textFieldName.text!, diet: textFieldDiet.text!, photo: animalImage, canFly: trait)
            default:
                return nil
            }
        }()
        Zoo.shared.addAnimal(animal!)
        navigationController?.popViewController(animated: true)
    }
    

}
