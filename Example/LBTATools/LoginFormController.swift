//
//  LoginFormController.swift
//  LBTATools_Example
//
//  Created by Brian Voong on 5/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import LBTATools

class LoginFormController: LBTAFormController {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "tools"), contentMode: .scaleAspectFit)
    let emailTextField = IndentedTextField(placeholder: "Email", padding: 12, cornerRadius: 5, backgroundColor: .white)
    let usernameTextField = IndentedTextField(placeholder: "Username", padding: 12, cornerRadius: 5, backgroundColor: .white)
    let nameTextField = IndentedTextField(placeholder: "Full name", padding: 12, cornerRadius: 5, backgroundColor: .white)
    let passwordTextField = IndentedTextField(placeholder: "Password", padding: 12, cornerRadius: 5, backgroundColor: .white)
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: #colorLiteral(red: 0.2883880436, green: 0.5055884719, blue: 0.9490465522, alpha: 1), target: self, action: #selector(handleCancel))
    let cancelButton = UIButton(title: "Cancel", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .red, target: self, action: #selector(handleCancel))
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
    let orLabel = UILabel(text: "or use the following", font: .systemFont(ofSize: 16), textColor: .black, textAlignment: .center)
    
    let fbButton = UIButton(image: #imageLiteral(resourceName: "fb_circle.png").withRenderingMode(.alwaysOriginal))
    let twitterButton = UIButton(image: #imageLiteral(resourceName: "twitter_circle").withRenderingMode(.alwaysOriginal))
    let linkedInButton = UIButton(image: #imageLiteral(resourceName: "github_circle").withRenderingMode(.alwaysOriginal))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(white: 0.95, alpha: 1)
        
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        signUpButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
        orLabel.constrainHeight(44)
        
        [emailTextField, usernameTextField, nameTextField, passwordTextField, signUpButton, cancelButton].forEach{$0.constrainHeight(50)}
        imageView.constrainHeight(64)
        
        [fbButton, twitterButton, linkedInButton].forEach{$0.imageView?.contentMode = .scaleAspectFit}
        let buttonsStackView = UIStackView(arrangedSubviews: [fbButton, twitterButton, linkedInButton])
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.constrainHeight(50)
        
        [imageView, emailTextField, usernameTextField, nameTextField,  passwordTextField, signUpButton, cancelButton, orLabel, buttonsStackView].forEach({stackView.addArrangedSubview($0)})
        
        stackView.setCustomSpacing(32, after: imageView)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 24, bottom: 0, right: 24)
        
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if stackView.frame.height > view.safeAreaLayoutGuide.layoutFrame.height {
            scrollView.contentSize.height = stackView.frame.size.height
        }
    }
    
    @objc fileprivate func handleTapDismiss() {
        view.endEditing(true)
    }
    
}
