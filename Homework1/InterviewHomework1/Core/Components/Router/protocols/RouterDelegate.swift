//
//  RouterDelegate.swift
//  InterviewHomework1
//
//  Created by Vasily Bodnarchuk on 1/14/23.
//

import UIKit

protocol RouterDelegate: AnyObject {
    func create(viewController: ViewControllerType) -> UIViewController
}
