//
//  HomeRecommendCell.swift
//  KtvClone
//
//  Created by Martin on 11/17/23.
//

import UIKit

class HomeRecommendCell: UITableViewCell {
    static let identifier = "HomeRecommendCell"
    static let rowHeight: CGFloat = 71

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.layer.cornerRadius = 5
        rankLabel.layer.cornerRadius = 5
        rankLabel.clipsToBounds = true
        timeLabel.layer.cornerRadius = 3
        timeLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
