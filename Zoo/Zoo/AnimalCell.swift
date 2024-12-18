//
//  AnimalCell.swift
//  Zoo
//
//  Created by lyj on 12/12/24.
//

import UIKit

protocol AnimalCellDelegate: AnyObject {
    func didTapPhoto(at index: Int)
    func didTapRemove(at index: Int)
}

class AnimalCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDiet: UILabel!
    @IBOutlet weak var labelFeature: UILabel!
    
    @IBOutlet weak var imageViewRemove: UIImageView!
    
    weak var delegate: AnimalCellDelegate?
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        imageViewPhoto.layer.cornerRadius = 8.0
        imageViewPhoto.clipsToBounds = true
        
        let tapGesturePhoto = UITapGestureRecognizer(target: self, action: #selector(photoTapped))
        imageViewPhoto.isUserInteractionEnabled = true
        imageViewPhoto.addGestureRecognizer(tapGesturePhoto)
        
        let tapGestureRemove = UITapGestureRecognizer(target: self, action: #selector(removeTapped))
        imageViewRemove.isUserInteractionEnabled = true
        imageViewRemove.addGestureRecognizer(tapGestureRemove)
    }
    
    // 동물 사진 클릭되었을 때
    @objc func photoTapped() {
        delegate?.didTapPhoto(at: self.tag)
    }
    
    // 동물 사진 클릭되었을 때
    @objc func removeTapped() {
        delegate?.didTapRemove(at: self.tag)
    }
}
