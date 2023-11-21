//
//  HomeHeaderCell.swift
//  KtvClone
//
//  Created by Martin on 11/17/23.
//

import UIKit

class HomeHeaderCell: UITableViewCell {
    static let identifier = "HomeHeaderCell"
    static let height: CGFloat = 50

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
