//
//  ProductViewModel.swift
//  Thien Assignment
//

import RxSwift
import Moya


class ProductViewModel {
    let provider: MoyaProvider<AlephAPI>
    let productsObservable: Observable<[Product]>
    private let productsSubject = PublishSubject<[Product]>()
    private let disposeBag = DisposeBag()
    
    init(provider: MoyaProvider<AlephAPI> = MoyaProvider<AlephAPI>()) {
        self.provider = provider
        
        
        productsObservable = productsSubject.asObservable()
        
    }
 
    func getAppleProducts() {
        return self.provider.rx.request(.getAppleProducts)
            .mapArray(Product.self, keyPath: "products.items")
            .bind(to: productsSubject)
            .disposed(by: disposeBag)
    }
    
    func getAndroidProducts() {
        return self.provider.rx.request(.getAndroidProducts)
            .mapArray(Product.self, keyPath: "products.items")
            .bind(to: productsSubject)
            .disposed(by: disposeBag)
    }
}
