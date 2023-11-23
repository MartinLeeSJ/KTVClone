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
    
    private var thumbnailImageTask: Task<Void, Never>?
    private static let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYMMDD."
        
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailView.layer.cornerRadius = 42
        self.thumbnailView.layer.borderWidth = 2
        self.thumbnailView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailView.image = nil
        dateLabel.text = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        
        thumbnailImageTask?.cancel()
        thumbnailImageTask = nil
    }
    
    public func setData(_ data: Home.Recent) {
        thumbnailImageTask = thumbnailView.loadImage(url: data.imageUrl)
        titleLabel.text = data.title
        subtitleLabel.text = Self.dateFormatter.string(
            from: .init(timeIntervalSince1970: data.timeStamp)
        )
    }
    
    

}
