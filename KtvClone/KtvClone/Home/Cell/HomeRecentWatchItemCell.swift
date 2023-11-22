//
//  HomeRecentWatchItemCell.swift
//  KtvClone
//
//  Created by Martin on 11/21/23.
//

import UIKit

class HomeRecentWatchItemCell: UICollectionViewCell {
    
    static let identifier = "HomeRecentWatchItemCell"
    static let height: CGFloat = 148

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumbnailView.layer.cornerRadius = 42
        self.thumbnailView.layer.borderWidth = 2
        self.thumbnailView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
    }
    
    override func prepareForReuse() {
        thumbnailView.image = nil
        dateLabel.text = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
    }
    
    

}
