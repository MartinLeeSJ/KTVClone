//
//  HomeRankingContainerCell.swift
//  KtvClone
//
//  Created by Martin on 11/20/23.
//

import UIKit

protocol HomeRankingContainerCellDelegate: AnyObject {
    func homeRankingContainerCell(_ cell: HomeRankingContainerCell, didSelectAt index: Int)
}

final class HomeRankingContainerCell: UITableViewCell {
    static let identifier = "HomeRankingContainerCell"
    static let height: CGFloat = 349

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    public weak var delegate: HomeRankingContainerCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(
            UINib(nibName: "HomeRankingItemCell", bundle: .main),
            forCellWithReuseIdentifier: HomeRankingItemCell.identifier
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeRankingContainerCell: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeRankingItemCell.identifier,
            for: indexPath
        ) as? HomeRankingItemCell else {
            fatalError("Unsupported")
        }
        
        cell.setRank(indexPath.row + 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeRankingContainerCell(self, didSelectAt: indexPath.row)
    }
   
    
    
}
