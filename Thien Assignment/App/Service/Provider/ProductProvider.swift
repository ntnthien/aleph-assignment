//
//  ProductProvider.swift
//  Thien Assignment
//

import Moya

enum AlephAPI {
    case getAppleProducts
    case getAndroidProducts
}

extension AlephAPI: TargetType {

    public var baseURL: URL { return URL(string: "http://dev.aleph-labs.com/ios_assignment")! } // swiftlint:disable:this force_unwrapping

    
    /// method + path
    var path: String {
        switch self {
        // Authentication
        case .getAppleProducts:
            return "apple.json"
        case .getAndroidProducts:
            return "android.json"
        }
    }

    
    var httpHeaderFields: [String: String]? {
        switch self {
            
        default:
            return nil
        }
    }
    
    var method: Method {
        return .get
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        return .requestPlain
    }
    
    /// Provides stub data for use in testing.
    public var sampleData: Data {
        switch self {
        case .getAppleProducts:
            return "{\"data\":{\"id\":\"your_new_gif_id\"},\"meta\":{\"status\":200,\"msg\":\"OK\"}}".data(using: String.Encoding.utf8)! // swiftlint:disable:this force_unwrapping
        case .getAndroidProducts:
            return "{\"data\":{\"id\":\"your_new_gif_id\"},\"meta\":{\"status\":200,\"msg\":\"OK\"}}".data(using: String.Encoding.utf8)! // swiftlint:disable:this force_unwrapping
        }
    }
}

