//
//  Networking.swift
//  LOL
//
//  Created by fsc on 2019/3/26.
//  Copyright © 2019 fsc. All rights reserved.
//

//import Foundation
//import Alamofire
//import Moya
//
//enum ApiManager {
//    case getUserData
//}
//
//extension ApiManager: TargetType {
//
//    var baseURL: URL {
//        return URL(string: "https://httpbin.org")!
//    }
//
//    var path: String {
//        switch self {
//        case .getUserData:
//            return "/get"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .getUserData:
//            return .get
//        }
//    }
//
//    var parameters: [String : AnyObject]? {
//        switch self {
//        case .getUserData:
//            return nil
//        }
//    }
//
//    var parameterEncoding: ParameterEncoding {
//        return URLEncoding.default
//    }
//
//    var sampleData: Data {
//        return "".data(using: String.Encoding.utf8)!
//    }
//
//    var headers: [String : String]? {
//        return nil
//    }
//
//
//    var task: Task { return .requestPlain }
//
//    var validate: Bool { return false }
//
//}

