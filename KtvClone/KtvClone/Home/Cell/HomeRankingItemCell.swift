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
    private var imageTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rankingLabel.text = nil
        thumbnailView.image = nil
        imageTask?.cancel()
        imageTask = nil
    }
    
    public func setData(_ data: Home.Ranking, rank: Int) {
        rankingLabel.text = "\(rank)"
        imageTask = thumbnailView.loadImage(url: data.imageUrl)
    }

}
