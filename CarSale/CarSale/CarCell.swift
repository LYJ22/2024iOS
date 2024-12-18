//
//  CarCell.swift
//  CarSale
//
//  Created by lyj on 12/13/24.
//

import UIKit

protocol CarCellDelegate: AnyObject {
    func didTapPhoto(at index: Int)
    func didTapSell(at index: Int)
}

class CarCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelFeature: UILabel!
    
    // 판매
    @IBOutlet weak var labelSell: UILabel!
    
    weak var delegate: CarCellDelegate?
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        
        // 사진 눌렀을 때
        let tapGesturePhoto = UITapGestureRecognizer(target: self, action: #selector(photoTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesturePhoto)
        
        // 판매 눌렀을 때
        let tapGestureSell = UITapGestureRecognizer(target: self, action: #selector(sellTapped))
        labelSell.isUserInteractionEnabled = true
        labelSell.addGestureRecognizer(tapGestureSell)
         
    }
    
    // 차 사진 클릭되었을 때
    @objc func photoTapped() {
        delegate?.didTapPhoto(at: self.tag)
    }
    
    // 판매 클릭되었을 때
    @objc func sellTapped() {
        delegate?.didTapSell(at: self.tag)
    }
}
