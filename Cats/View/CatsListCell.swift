//
//  CatsListCell.swift
//  Cats
//
//  Created by gabriel hideki on 27/07/23.
//

import UIKit

class CatsListCell: UICollectionViewCell, ViewCodeProtocol {
    
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        setViews()
        addSubviews()
        setContraints()
    }
    
    func setViews() {
        
    }
    
    func setContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func addSubviews() {
        self.contentView.addSubview(imageView)
    }
    
    func bindViewWith(cat: Cat) {
        let cat = cat
        self.imageView.image = nil
        self.imageView.setNeedsDisplay()
        if let img = cat.images?[0]?.link, let url = URL(string: img) {
            self.imageView.load(url: url)
        }
    }
    
}
