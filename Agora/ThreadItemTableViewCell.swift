//
//  ThreadItemTableViewCell.swift
//  
//
//  Created by Vamsi Gadiraju on 10/23/15.
//
//

import UIKit

class ThreadItemTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var threadContent: UILabel!
    @IBOutlet weak var voter: UIStepper!
    @IBOutlet weak var voteValue: UILabel!
    @IBOutlet weak var subject: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
