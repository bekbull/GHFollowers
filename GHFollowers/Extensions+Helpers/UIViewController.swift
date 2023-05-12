//
//  UIViewController.swift
//  GHFollowers
//
//  Created by Bekbol Bolatov on 11.05.2023.
//

import UIKit

extension UIViewController {
     
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
    
}
