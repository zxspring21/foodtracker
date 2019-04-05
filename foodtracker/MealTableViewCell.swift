//
//  MealTableViewCell.swift
//  foodtracker
//
//  Created by Portran Lu on 2019/4/4.
//  Copyright © 2019 盧柏瑋. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // In a storyboard, you can configure a table view to display static data (supplied in the storyboard) or dynamic data (programmatically supplied by the table view controller) which is default item in TableViewController.
    // This means the interface you created in the storyboard is simply a prototype for your cell.
    
    // MARK: Properties:
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
