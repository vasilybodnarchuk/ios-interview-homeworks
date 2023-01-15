//
//  AppLoadingViewController.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/6/23.
//

import UIKit

class AppLoadingViewController: UIViewController {
    
    private weak var router: Routerable!
    
    init(router: Routerable) {
        super.init(nibName: nil, bundle: nil)
        self.router = router
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createActivityIndicator())
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let miliseconds = UInt32.random(in: 500_000...1_000_000)
            usleep(miliseconds)
            DispatchQueue.main.async {
                self?.router.navigate(path: .setRoot(type: .root))
            }
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
}
