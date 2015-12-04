//
//  ClassItemTableViewCell.swift
//  
//
//  Created by Vamsi Gadiraju on 10/23/15.
//
//

import UIKit

class ClassItemTableViewCell: UITableViewCell {
    //Mark: Properties
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var profName: UILabel!
    @IBOutlet weak var buildingName: UILabel!
    @IBOutlet weak var timeAndDay: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    

        // Configure the view for the selected state
    }

}
