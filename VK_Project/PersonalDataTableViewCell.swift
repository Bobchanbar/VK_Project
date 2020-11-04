//
//  PersonalDataTableViewCell.swift
//  VK_Project
//
//  Created by Vladimir Barus on 04.11.2020.
//

import UIKit

class PersonalDataTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
