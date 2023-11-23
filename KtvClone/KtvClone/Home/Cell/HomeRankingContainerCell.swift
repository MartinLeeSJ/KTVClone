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
    private var rankings: [Home.Ranking]?
    
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
    
    public func setData(_ data: [Home.Ranking]) {
        self.rankings = data
        self.collectionView.reloadData()
    }
    
}

extension HomeRankingContainerCell: UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rankings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeRankingItemCell.identifier,
            for: indexPath
        )
        
        if let cell = cell as? HomeRankingItemCell,
           let data = rankings?[indexPath.item] {
            cell.setData(data, rank: indexPath.item + 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeRankingContainerCell(self, didSelectAt: indexPath.row)
    }
   
    
    
}
