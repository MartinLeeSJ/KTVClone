//
//  UIImageView+Task.swift
//  KtvClone
//
//  Created by Martin on 11/23/23.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> Task<Void, Never> {
        return .init {
            guard let responseData = try? await URLSession.shared.data(for: URLRequest(url: url)).0,
                  let image = UIImage(data: responseData) else {
                return
            }
            
            self.image = image
        }
    }
}
