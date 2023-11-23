//
//  HomeRecentWatchContainerCell.swift
//  KtvClone
//
//  Created by Martin on 11/21/23.
//

import UIKit

protocol HomeRecentWatchContainerCellDelegate: AnyObject {
    func homeRecentWatchContainerCell(_ cell: HomeRecentWatchContainerCell, didSelectItemAt index: Int)
}

final class HomeRecentWatchContainerCell: UITableViewCell {

    static let identifier = "HomeRecentWatchContainerCell"
    static let height: CGFloat = 209
    
    @IBOutlet weak var collectionView: UICollectionView!
    public weak var delegate: HomeRecentWatchContainerCellDelegate?
    private var recents: [Home.Recent]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        
        collectionView.register(
            UINib(nibName: "HomeRecentWatchItemCell", bundle: .main),
            forCellWithReuseIdentifier: HomeRecentWatchItemCell.identifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setData(_ data: [Home.Recent]) {
        recents = data
        self.collectionView.reloadData()
    }
    
}

extension HomeRecentWatchContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeRecentWatchItemCell.identifier,
            for: indexPath
        ) 
        
        
        if let cell = cell as? HomeRecentWatchItemCell,
           let data = self.recents?[indexPath.item] {
            cell.setData(data)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
