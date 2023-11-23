//
//  HomeViewModel.swift
//  KtvClone
//
//  Created by Martin on 11/23/23.
//

import Foundation

@MainActor
class HomeViewModel {
    private(set) var home: Home?
    public var dataChanged: (() -> Void)?
    
    func requestData() {
        Task {
            do {
                self.home = try await DataLoader.load(
                    url: URLDefines.home,
                    for: Home.self
                )
                self.dataChanged?()
            } catch {
                print("json pasing failed: \(error.localizedDescription)")
            }
        }
    }
    
    
}
