//
//  LoginViewController.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIView!
    @IBOutlet private weak var loadingActivityIndicatorView: UIActivityIndicatorView!

    var presenter: LoginPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func didTapLogginButton(_ sender: Any) {
        let emailInput = emailTextField.text
        let passwordInput = passwordTextField.text
        presenter.didTapLoginButton(email: emailInput, password: passwordInput)
    }

}

extension LoginViewController: LoginViewProtocol {
    func setViewInteractionEnabled(to value: Bool) {
        view.isUserInteractionEnabled = value
        activityIndicatorView.isHidden = value
    }
}

private extension LoginViewController {
    func setUpView() {
        localizeViews()
    }

    func localizeViews() {
        infoLabel.text = "login_info_label".localized
        emailLabel.text = "login_email_label".localized
        emailTextField.placeholder = "login_email_palceholder_textfield".localized
        passwordLabel.text = "login_password_label".localized
        passwordTextField.placeholder = "login_password_palceholder_textfield".localized
        loginButton.setTitle("login_authenticate_button".localized, for: .normal)
    }
}
