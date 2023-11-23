//
//  HomeRecommendViewModel.swift
//  KtvClone
//
//  Created by Martin on 11/23/23.
//

import Foundation

@MainActor
final class HomeRecommendViewModel {
    private(set) var isFolded: Bool = true {
        didSet {
            self.foldChanged?(self.isFolded)
        }
    }
    
    var foldChanged: ((Bool) -> Void)?
    var recommends: [Home.Recommend]?
    var itemCount: Int {
        let count = self.isFolded ? 5 : self.recommends?.count ?? 0
        
        return min(count, self.recommends?.count ?? 0)
    }
    
    func toggleFoldState() {
        self.isFolded.toggle()
    }
    
}
