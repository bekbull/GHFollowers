//
//  UIViewController.swift
//  GHFollowers
//
//  Created by Bekbol Bolatov on 11.05.2023.
//

import UIKit
import SafariServices

extension UIViewController {
     
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertViewController = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
    
    func presentSafariViewController(with url: URL) {
        let safariViewContoller = SFSafariViewController(url: url)
        safariViewContoller.preferredControlTintColor = .systemGreen
        present(safariViewContoller, animated: true)
    }
}
