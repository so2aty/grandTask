//
//  Services.swift
//
//

import UIKit
import Alamofire

class Services {
    static let instance = Services()
    
    func getHomePage(search: String?,completionHandler: @escaping(_ articles: [Articles]?,_ error: String?)->Void) {
        let url = APIRouter.home(search: search)
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, nil)
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    
                    let model = try JSONDecoder().decode(News.self, from: jsonData)
                    
                    completionHandler(model.articles ?? [], nil)
                    
                }catch let error {
                    print(error.localizedDescription)
                    completionHandler(nil, nil)
                }
            }
        }
    }
    
    func getHeadLines(completionHandler: @escaping(_ articles: [Articles]?,_ error: String?)->Void) {
        let url = APIRouter.headLine
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, nil)
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                    
                    let model = try JSONDecoder().decode(News.self, from: jsonData)
                    
                    completionHandler(model.articles ?? [], nil)
                    
                }catch let error {
                    print(error.localizedDescription)
                    completionHandler(nil, nil)
                }
            }
        }
    }
    
}



