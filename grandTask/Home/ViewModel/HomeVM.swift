//
//  HomeVM.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import Foundation
import Alamofire
import NVActivityIndicatorView

class HomeVM {
    
    var BindingParsingclouser : () -> Void = {}
    var newsList = [Articles]()
    
    func getAllNews(search: String?) {
        Services.instance.getHomePage(search: search) { articles, error in
            self.newsList = articles ?? []
            
            self.BindingParsingclouser()
        }
    }
    
}
