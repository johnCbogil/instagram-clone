//
//  ViewController.swift
//  bogilGram
//
//  Created by John Bogil on 8/13/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let addPhotoButton:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(self, action: #selector(handleTextInputDidChange), for: .editingChanged)
        return textField
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(self, action: #selector(handleTextInputDidChange), for: .editingChanged)

        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(handleTextInputDidChange), for: .editingChanged)
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddPhotoButton()
        configureInputFields()
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, email.count > 0 else {return}
        guard let username = usernameTextField.text, username.count > 0 else {return}
        guard let password = passwordTextField.text, password.count > 0 else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error)
            }
            else {
                print("Sucessfully created user \(result?.user.uid ?? "")")
            }
        }
    }
    
    @objc func handleTextInputDidChange() {
        
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
        usernameTextField.text?.count ?? 0 > 0 &&
        passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
        }
        
        
    }
    
    fileprivate func configureAddPhotoButton() {
        view.addSubview(addPhotoButton)
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPhotoButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 140, height: 140)
    }
    
    fileprivate func configureInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingRight: -40, paddingBottom: 200, width: 0, height: 200)
    }
}

extension UIView {
    
    func anchor(top:NSLayoutYAxisAnchor?, left:NSLayoutXAxisAnchor?, bottom:NSLayoutYAxisAnchor?, right:NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft:CGFloat, paddingRight:CGFloat, paddingBottom:CGFloat, width: CGFloat, height: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
            
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

