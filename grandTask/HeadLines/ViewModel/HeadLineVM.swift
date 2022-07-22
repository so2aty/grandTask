//
//  HeadLineVM.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import Foundation
import Alamofire

class HeadLineVM {
    
    
    var BindingParsingclouser : () -> Void = {}
    var headLinesList = [Articles]()
    
    func getAllHeadLines () {
        Services.instance.getHeadLines { articles, error in
            self.headLinesList = articles ?? []
            
            self.BindingParsingclouser()
        }
    }
    
}
