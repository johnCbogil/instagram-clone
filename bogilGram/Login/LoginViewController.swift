//
//  LoginViewController.swift
//  bogilGram
//
//  Created by John Bogil on 8/27/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        let signUpTextPartOne = NSMutableAttributedString(string: "Dont' have an account?  ", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor:UIColor.lightGray])
        let signUpTextPartTwo = NSMutableAttributedString(string: "Sign up.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 17, green: 154, blue: 237)])
        signUpTextPartOne.append(signUpTextPartTwo)
        button.setAttributedTitle(signUpTextPartOne, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    let logoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 0, green: 120, blue: 175)
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
//        textField.addTarget(self, action: #selector(handleTextInputDidChange), for: .editingChanged)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.isSecureTextEntry = true
//        textField.addTarget(self, action: #selector(handleTextInputDidChange), for: .editingChanged)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(signUpButton)
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        configureInputFields()
        
    }
    
    fileprivate func configureInputFields() {
        let stackview = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        view.addSubview(stackview)
        stackview.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
    }
    
    @objc func handleShowSignUp() {
        let signUpVC = SignUpController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
