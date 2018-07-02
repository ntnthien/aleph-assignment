//
//  ProductViewModel.swift
//  Thien Assignment
//

import RxSwift
import Moya

class ProductViewModel {
    struct Input {
        let appleButtonTap: Observable<Void>
        let androidButtonTap: Observable<Void>
    }
    let provider: MoyaProvider<AlephAPI>
    let productsObservable: Observable<[Product]>
    private let productsSubject = PublishSubject<[Product]>()
    private let disposeBag = DisposeBag()
    
    init(input: Input, provider: MoyaProvider<AlephAPI> = MoyaProvider<AlephAPI>()) {
        self.provider = provider
        productsObservable = productsSubject.asObservable()
        input.appleButtonTap
            .flatMap { self.provider.rx.request(.getAppleProducts) }
            .mapArray(Product.self, keyPath: "products.items")
            .bind(to: productsSubject)
            .disposed(by: disposeBag)
        
        input.androidButtonTap
            .flatMap { self.provider.rx.request(.getAndroidProducts) }
            .mapArray(Product.self, keyPath: "products.items")
            .bind(to: productsSubject)
            .disposed(by: disposeBag)
    }
    
}
