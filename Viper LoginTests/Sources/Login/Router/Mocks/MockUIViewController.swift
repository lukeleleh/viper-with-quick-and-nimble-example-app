//
//  MockUIViewController.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import UIKit

final class MockUIViewController: UIViewController {

    private(set) var alertContent: (title: String?, message: String?, actionTitle: String?)?

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if let alertViewController = viewControllerToPresent as? UIAlertController {
            alertContent = (title: alertViewController.title, message: alertViewController.message, actionTitle: alertViewController.actions.first?.title)
        }
    }

}
