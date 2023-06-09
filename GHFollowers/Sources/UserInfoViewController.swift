//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Bekbol Bolatov on 19.06.2023.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configure()
        getUserInfo()
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configure() {
        view.addSubviews(headerView, itemViewOne, itemViewTwo)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childViewController: GFUserInfoHeaderViewController(user: user), to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Okay")
            }
        }
    }
    
}
