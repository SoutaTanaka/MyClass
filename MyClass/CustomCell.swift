//
//  CustomCell.swift
//  
//
//  Created by 田中颯太 on 2018/03/29.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet var nameLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
