//
//  CatsList.swift
//  Cats
//
//  Created by gabriel hideki on 26/07/23.
//

import UIKit

class CatsList: UIViewController {
    
    private let viewModel: CatsListViewModel
    
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
    
    
    init(viewModel: CatsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        self.fetchCats()
        
        self.setViews()
        self.addSubviews()
        self.setContraints()
        
        self.bindViewModelEvent()
        
    }
    
    private func bindViewModelEvent() {
        viewModel.onFetchCatsSucceed = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        viewModel.onFetchCatsFailure = { error in
            print(error)
        }
    }
    
    @objc private func refresh() {
        self.fetchCats()
    }
    
    func fetchCats() {
        viewModel.fetchCats()
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
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CatsListCell else {
            return UICollectionViewCell()
        }
        cell.bindViewWith(cat: viewModel.cats[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 20 , height: self.collectionView.frame.width/2 - 20)
    }
    
}
