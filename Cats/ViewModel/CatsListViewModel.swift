//
//  CatsListViewModel.swift
//  Cats
//
//  Created by gabriel hideki on 26/07/23.
//

import Foundation

protocol CatsListViewModel: AnyObject {
    var cats: [Cat] { set get }
    var onFetchCatsSucceed: (() -> Void)? { set get }
    var onFetchCatsFailure: ((Error) -> Void)? { set get }
    func fetchCats()
}

final class CatsListDefaultViewModel: CatsListViewModel {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    var cats: [Cat] = []
    var onFetchCatsSucceed: (() -> Void)?
    var onFetchCatsFailure: ((Error) -> Void)?

    func fetchCats() {
        let request = CatsListRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let cats):
                self?.cats = cats.filter({ !($0.images?.isEmpty ?? false) })
                self?.onFetchCatsSucceed?()
            case .failure(let error):
                self?.onFetchCatsFailure?(error)
            }
        }
    }
}
