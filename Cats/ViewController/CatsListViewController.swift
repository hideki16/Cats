//
//  CatsList.swift
//  Cats
//
//  Created by gabriel hideki on 26/07/23.
//

import UIKit

class CatsList: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        var collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CatsListCell.self, forCellWithReuseIdentifier: "cell")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        
        collection.setCollectionViewLayout(layout, animated: false)
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    override func viewDidLoad() {
        self.setViews()
    
        self.addSubviews()
        self.setContraints()
    }
    
    @objc private func refresh() {
        
    }
}

extension CatsList: ViewCodeProtocol {
    func setViews() {
        
        self.title = "Gallery"
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.clockwise.circle"),
            style: .plain,
            target: self,
            action: #selector(refresh))
    }
    
    func setContraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ])
    }
    
    func addSubviews() {
        self.view.addSubview(collectionView)
    }
}

extension CatsList: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CatsListCell
        cell?.backgroundColor = .red
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/4 - 10 , height: self.collectionView.frame.width/4 - 10)
    }
    
}
