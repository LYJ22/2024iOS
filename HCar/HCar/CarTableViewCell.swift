//
//  CarTableViewCell.swift
//  HCar
//
//  Created by lyj on 12/17/24.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}