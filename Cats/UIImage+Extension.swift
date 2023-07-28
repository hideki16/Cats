//
//  UIImage+Extension.swift
//  Cats
//
//  Created by gabriel hideki on 27/07/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        let loading: UIActivityIndicatorView = {
            let indicator = UIActivityIndicatorView()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            indicator.hidesWhenStopped = true
            return indicator
        }()
        
        self.addSubview(loading)
        loading.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loading.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        loading.startAnimating()
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        loading.stopAnimating()
                    }
                }
            }
        }
    }
}
