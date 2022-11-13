//
//  SimpleTableViewCell.swift
//  tableView3
//
//  Created by admin on 12/11/22.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var textLabelThing: UILabel!
    
    @IBOutlet weak var deleteLabelThing: UIButton!
    
    @IBOutlet weak var editLabelThing: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
