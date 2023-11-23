//
//  HomeViewController.swift
//  KtvClone
//
//  Created by Martin on 11/16/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let homeViewModel: HomeViewModel = .init()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindViewModel()
        
        homeViewModel.requestData()
        
        setUpTableView()
    }
    
    private func bindViewModel() {
        homeViewModel.dataChanged = { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            UINib(nibName: "HomeHeaderCell", bundle: .main),
            forCellReuseIdentifier: HomeHeaderCell.identifier
        )
        
        tableView.register(
            UINib(nibName: "HomeVideoCell", bundle: .main),
            forCellReuseIdentifier: HomeVideoCell.identifier
        )
        
        tableView.register(
            UINib(nibName: "HomeRankingContainerCell", bundle: .main),
            forCellReuseIdentifier: HomeRankingContainerCell.identifier
        )
        
        tableView.register(
            UINib(nibName: "HomeRecentWatchContainerCell", bundle: .main),
            forCellReuseIdentifier: HomeRecentWatchContainerCell.identifier
        )
        
        tableView.register(
            UINib(nibName: "HomeRecommendContainerCell", bundle: .main),
            forCellReuseIdentifier: HomeRecommendContainerCell.identifier
        )
        
        tableView.register(
            UINib(nibName: "HomeFooterCell", bundle: .main),
            forCellReuseIdentifier: HomeFooterCell.identifier
        )
        
        tableView.isHidden = true
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .header:
            return 1
        case .video:
            return self.homeViewModel.home?.videos.count ?? 0
        case .ranking:
            return 1
        case .recent:
            return 1
        case .recommend:
            return 1
        case .footer:
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .header:
            return tableView.dequeueReusableCell(
                withIdentifier: HomeHeaderCell.identifier
            ) as? HomeHeaderCell ?? UITableViewCell()
        case .video:
             let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeVideoCell.identifier,
                for: indexPath
            )
            if let cell = cell as? HomeVideoCell,
               let data = homeViewModel.home?.videos[indexPath.row] {
                cell.setData(data)
            }
    
            
            return cell
            
        case .ranking:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeRankingContainerCell.identifier,
                for: indexPath
            )
            
            if let cell = cell as? HomeRankingContainerCell,
               let data = homeViewModel.home?.rankings {
                cell.setData(data)
                cell.delegate = self
            }
            
            return cell
            
        case .recent:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeRecentWatchContainerCell.identifier,
                for: indexPath
            )
            
            if let cell = cell as? HomeRecentWatchContainerCell,
               let data = homeViewModel.home?.recents {
                cell.setData(data)
                cell.delegate = self
            }
            
            return cell
            
        case .recommend:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeRecommendContainerCell.identifier,
                for: indexPath
            )
            
            if let cell = cell as? HomeRecommendContainerCell,
               let data = homeViewModel.home?.recommends {
                cell.setData(data)
                cell.delegate = self
            }
            
            
            return cell
            
        case .footer:
            return tableView.dequeueReusableCell(
                withIdentifier: HomeFooterCell.identifier
            ) as? HomeFooterCell ?? UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return .zero
        }
        
        switch section {
        case .header: return HomeHeaderCell.height
        case .video: return HomeVideoCell.height
        case .ranking: return HomeRankingContainerCell.height
        case .recent: return HomeRecentWatchContainerCell.height
        case .recommend: return HomeRecommendContainerCell.height
        case .footer: return HomeFooterCell.height
        }
    }
}

extension HomeViewController: HomeRecommendContainerCellDelegate {
    func homeRecommendContainerCell(_ cell: HomeRecommendContainerCell, didSelectAt index: Int) {
        
    }
}

extension HomeViewController: HomeRankingContainerCellDelegate {
    func homeRankingContainerCell(_ cell: HomeRankingContainerCell, didSelectAt index: Int) {
        
    }
}

extension HomeViewController: HomeRecentWatchContainerCellDelegate {
    func homeRecentWatchContainerCell(_ cell: HomeRecentWatchContainerCell, didSelectItemAt index: Int) {
        
    }
    
}

