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
    
    @IBOutlet weak var channelThumbnailImageView: UIImageView?
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelSubtitleLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    private var thumbnailImageTask: Task<Void,Never>?
    private var channelImageTask: Task<Void,Never>?
    
    
    @IBAction func didTapHeartButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView?.layer.cornerRadius = 10
        containerView?.layer.borderWidth = 1
        containerView?.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        containerView?.clipsToBounds = true
        
        channelThumbnailImageView?.layer.cornerRadius = 10
        channelThumbnailImageView?.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        thumbnailImageTask?.cancel()
        thumbnailImageTask = nil
        thumbnailImageView.image = nil
        
        channelImageTask?.cancel()
        channelImageTask = nil
        channelThumbnailImageView?.image = nil
        
        
        contentTitleLabel.text = nil
        contentSubtitleLabel.text = nil
        channelTitleLabel.text = nil
        channelSubtitleLabel.text = nil
        
        contentPopularityBadge.isHidden = true
    }
    
    public func setData(_ data: Home.Video) {
        contentTitleLabel.text = data.title
        contentSubtitleLabel.text = data.subtitle
        channelTitleLabel.text = data.channel
        channelSubtitleLabel.text = data.channelDescription
        
        contentPopularityBadge.isHidden = !data.isHot
        
        thumbnailImageTask = thumbnailImageView.loadImage(url: data.imageUrl)
        channelImageTask = channelThumbnailImageView?.loadImage(url: data.channelThumbnailURL)
    }
    
}
