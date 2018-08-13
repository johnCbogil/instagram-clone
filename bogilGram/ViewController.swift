//
//  ViewController.swift
//  bogilGram
//
//  Created by John Bogil on 8/13/18.
//  Copyright © 2018 John Bogil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let addPhotoButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddPhotoButton()
        configureInputFields()
    }
    
    
    fileprivate func configureAddPhotoButton() {
        view.addSubview(addPhotoButton)
        addPhotoButton.frame = CGRect.init(x: 0, y: 0, width: 140, height: 140)
        addPhotoButton.center = view.center
        addPhotoButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    }
    
    fileprivate func configureInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
}

