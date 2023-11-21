//
//  HomeRecommendContainerCell.swift
//  KtvClone
//
//  Created by Martin on 11/17/23.
//

import UIKit

protocol HomeRecommendContainerCellDelegate: AnyObject {
    func homeRecommendContainerCell(_ cell: HomeRecommendContainerCell, didSelectAt index: Int)
}

class HomeRecommendContainerCell: UITableViewCell {
    static let identifier = "HomeRecommendContainerCell"
    static var height: CGFloat  {
        let top: CGFloat = 84 - 6
        let bottom: CGFloat = 68 - 6
        let footerInset: CGFloat = 51
        return HomeRecommendCell.rowHeight * 5 + top + bottom + footerInset
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var expandButton: UIButton!
    
    public weak var delegate: HomeRecommendContainerCellDelegate?
    
    @IBAction func didTapExpandButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        
        self.tableView.rowHeight = HomeRecommendCell.rowHeight
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(
            UINib(nibName: "HomeRecommendCell", bundle: .main),
            forCellReuseIdentifier: HomeRecommendCell.identifier
        )
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension HomeRecommendContainerCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: HomeRecommendCell.identifier) as? HomeRecommendCell ?? UITableViewCell()
    }
    
    
}
