//
//  AddCarViewController.swift
//  HCar
//
//  Created by lyj on 12/17/24.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

class AddCarViewController: UIViewController, UINavigationControllerDelegate {
    let db = Firestore.firestore()

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    @IBOutlet weak var textFieldYear: UITextField!
    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var textViewDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonImage(_ sender: UIButton) {
        let alertController = UIAlertController(title: "사진 추가", message: "사진을 가져올 방법을 선택하세요.", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라", style: .default){ _ in
            self.openCamera()
        }
        let albumAction = UIAlertAction(title: "앨범", style: .default){ _ in
            self.openAlbum()
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
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
        }
        else{
            showAlert("앨범을 사용할 수 없습니다.")
        }
    }
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addCar(_ sender: UIBarButtonItem) {
        //이미지 먼저 업로드
        if let image = buttonImage.imageView?.image{
            uploadImage(image: image){ urlString in
                if let urlString = urlString {
                    print("Image uploaded successfully: \(urlString)")
                    //cars 컬렉션에 Car 정보 저장
                    let car = Car(id: "", name: self.textFieldName.text!, price: Int(self.textFieldPrice.text!)!, year: Int(self.textFieldYear.text!)!, image: urlString, details: self.textViewDetail.text!, userId: Auth.auth().currentUser!.uid, isSale: false)
                    self.saveCar(car: car)
                }else{
                    print("Failed to load image.")
                }
            }
        }else{
            print("Failed to load image.")
        }
        
//        let car = Car(name: textFieldName.text!, price: Int(textFieldPrice.text!)!, year: Int(textFieldYear.text!)!, imageName: nil/*, image: buttonImage.imageView?.image!*/)
//        CarListManager.shared.addCar(car)
//       saveCar(car: car)

    }
    
    // 이미지 업로드
    func uploadImage(image: UIImage, completion: @escaping(String?) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.8) else{ return }
        let storageRef = Storage.storage().reference().child("image/\(UUID().uuidString).jpg")
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Error uploading image: \(error)")
                completion(nil)
            }else{
                storageRef.downloadURL { url, _ in
                    completion(url?.absoluteString)
                }
            }
        }
    }
    
    func saveCar(car: Car){
        let encoder = JSONEncoder()
        do{
            let jsonData = try encoder.encode(car)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            let carRef = db.collection("cars").addDocument(data: jsonObject ?? [:]) { error in
                if let error = error{
                    print("Error writing document: \(error)")
                }
            }
            
            db.collection("cars").document(carRef.documentID).updateData(["id": carRef.documentID]){ updateError in
                if let updateError = updateError {
                    print("Error updating document ID: \(updateError)")
                }else{
                    print("Document ID successfully updated")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }catch{
            print("Error endoing car: \(error)")
        }
    }
}

extension AddCarViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // 버튼에 이미지 버튼 설정
            setButtonImage(selectedImage)
        } else if let originalImage = info[.originalImage] as? UIImage{
            // 원본 이미지를 버튼에 설정
            setButtonImage(originalImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func setButtonImage(_ image: UIImage){
        //버튼에 이미지 설정
        buttonImage.setImage(image, for: .normal)
        //버튼 크기와 이미지 비율 유지
        buttonImage.imageView?.contentMode = .scaleAspectFill
        buttonImage.clipsToBounds = true
    }
}
