//
//  ProviderHelper.swift
//  Thien Assignment
//

import RxSwift
import Moya

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from data: Data, keyPath: String) throws -> T {
        let toplevel = try JSONSerialization.jsonObject(with: data)
        if let nestedJson = (toplevel as AnyObject).value(forKeyPath: keyPath) {
            let nestedJsonData = try JSONSerialization.data(withJSONObject: nestedJson)
            return try decode(type, from: nestedJsonData)
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Nested json not found for key path \"\(keyPath)\""))
        }
    }
}

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func mapArray<T: Codable>(_ type: T.Type, keyPath: String = "") -> Observable<[T]> {
        return self.asObservable().flatMap({ (response) -> Observable<[T]> in
            return Observable<[T]>.create({ (observer) -> Disposable in
                do {
                    
                    let decoder = JSONDecoder()
                    let users = try decoder.decode([T].self, from: response.data, keyPath: keyPath)
                    observer.onNext(users)
                } catch(let error) {
                    observer.onError(error)
                }
                return Disposables.create()
            })
        })
    }
}


public extension ObservableType where E == Data {
    public func map<T>(_ type: T.Type, using decoder: JSONDecoder? = nil) -> Observable<T> where T: Decodable {
        return self.map { data -> T in
            let decoder = decoder ?? JSONDecoder()
            return try decoder.decode(type, from: data)
        }
    }
}
