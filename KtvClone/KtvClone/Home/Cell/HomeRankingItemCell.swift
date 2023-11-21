//
//  HomeRankingItemCell.swift
//  KtvClone
//
//  Created by Martin on 11/21/23.
//

import UIKit

class HomeRankingItemCell: UICollectionViewCell {
    static let identifier = "HomeRankingItemCell"

    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        rankingLabel.text = nil
        thumbnailView.image = nil
    }
    
    public func setRank(_ rank: Int) {
        rankingLabel.text = "\(rank)"
    }

}
