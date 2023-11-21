//
//  HomeVideoCell.swift
//  KtvClone
//
//  Created by Martin on 11/16/23.
//

import UIKit

class HomeVideoCell: UITableViewCell {
    static let identifier = "HomeVideoCell"
    static let height: CGFloat = 321
    

    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var contentPopularityBadge: UIImageView!
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentSubtitleLabel: UILabel!
    
    @IBOutlet weak var authorThumbnailImageView: UIImageView?
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var authorSubtitleLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    @IBAction func didTapHeartButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView?.layer.cornerRadius = 10
        self.containerView?.layer.borderWidth = 1
        self.containerView?.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.containerView?.clipsToBounds = true
        
        self.authorThumbnailImageView?.layer.cornerRadius = 10
        self.authorThumbnailImageView?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
