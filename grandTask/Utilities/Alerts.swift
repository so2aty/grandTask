//
//  Alerts.swift
//  grandTask
//
//  Created by mac on 21/07/2022.
//

import UIKit

class Alerts {
    
    static let instance = Alerts()
    
    func showAlert ( title : String , message: String) -> UIAlertController {
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        return alert
    }
    
    
}
