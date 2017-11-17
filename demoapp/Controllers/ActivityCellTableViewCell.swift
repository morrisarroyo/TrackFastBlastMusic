//
//  ActivityCellTableViewCell.swift
//  demoapp
//
//  Created by Jason Sekhon on 2017-10-17.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit

class ActivityCellTableViewCell: UITableViewCell {

    @IBOutlet weak var activityImg: UIImageView!
    @IBOutlet weak var editImg: UIImageView!
    @IBOutlet weak var activityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
