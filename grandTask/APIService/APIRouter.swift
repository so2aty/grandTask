//
//  APIRouter.swift
//
//

import Alamofire


enum APIRouter: URLRequestConvertible {
    
    
    static func baseURL() -> URL {
        return URL(string: "https://newsapi.org/v2/")!
    }
    
    case home(search: String?)
    case headLine
    
    
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    /*==========================================================================================*/
    
    var path: URL {
        let base = APIRouter.baseURL()
        switch self {
        case .home: return base.appendingPathComponent("everything")
        case .headLine: return base.appendingPathComponent("top-headlines")
            
        }
    }
    
    /*==========================================================================================*/
    
    func asURLRequest() throws -> URLRequest {
        
        var params = Parameters()
        
        params["apiKey"] = "83175a12fd9845e3b655134b94fc4ef5"
        
        var urlRequest = URLRequest(url: path)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .home(search: let search):
            
            params["q"] = search ?? "bitcoin"
            
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
            
        case .headLine:
            params["country"] = "us"
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
            return urlRequest
            
        }
    }
}

