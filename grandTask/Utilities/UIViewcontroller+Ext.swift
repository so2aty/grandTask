//
//  UIViewcontroller+Ext.swift
//  grandTask
//
//  Created by mac on 22/07/2022.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable{
    func startLoading() {
        let size = CGSize(width: 60, height: 60)
        self.startAnimating(size, message: "", messageFont: nil, type: .ballPulseSync, color: .black, padding: 6)
    }
    func stopLoading() {
        self.stopAnimating()
    }
}
