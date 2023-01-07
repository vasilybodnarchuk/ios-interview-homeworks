//
//  AppLoadingViewController.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/6/23.
//

import UIKit

class AppLoadingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createActivityIndicator())
        DispatchQueue.global(qos: .userInitiated).async {
            let miliseconds = UInt32.random(in: 500_000...1_000_000)
            usleep(miliseconds)
        }
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
}
