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
    
    private var imageTask: Task<Void,Never>?
    private static let timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        return formatter
    }()
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailImageView.image = nil
        rankLabel.text = nil
        timeLabel.text = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        
        imageTask?.cancel()
        imageTask = nil
    }
    
    public func setData(_ data: Home.Recommend, rank: Int?) {
        rankLabel.isHidden = rank == nil
        if let rank {
            rankLabel.text = "\(rank)"            
        }
        imageTask = thumbnailImageView.loadImage(url: data.imageUrl)
        timeLabel.text = Self.timeFormatter.string(from: data.playtime)
        
        titleLabel.text = data.title
        subTitleLabel.text = data.channel
    }
    
}
