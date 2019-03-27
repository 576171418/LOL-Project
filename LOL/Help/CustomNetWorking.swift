//
//  CustomNetWorking.swift
//  LOL
//
//  Created by fsc on 2019/3/27.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseUrlString.appending(path))
        let mutableURLRequest = NSMutableURLRequest(url: url!)
        switch self {
        case .getWeatherData:
            return Alamofire.ParameterEncoding.encode(parameters)
        }
    }
    
    
    case getWeatherData
    
    var baseUrlString: String {
        return "http://t.weather.sojson.com"
    }
    
    var path: String {
        switch self {
        case .getWeatherData:
            return "/api/weather/city/101030100"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherData:
            return HTTPMethod.get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getWeatherData:
            return [:]
        }
    }
    
    func request() -> Alamofire.Request {
        return Alamofire.request(baseUrlString.appending(path), method: method, parameters: parameters)
    }
    
}
