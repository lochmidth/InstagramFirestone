//
//  RegisterationController.swift
//  InstagramFirestone
//
//  Created by Alphan Ogün on 3.07.2023.
//

import UIKit

class RegisterationController: UIViewController {
    
    //MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextField: CustomTextField = {
        
        let tf = CustomTextField(placeholder: "Email")
        return tf
    }()
    
    private let passwordTextField: CustomTextField = {
        
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let fullNameTextField: CustomTextField = {
        
        let tf = CustomTextField(placeholder: "Full Name")
        return tf
    }()
    
    private let usernameTextField: CustomTextField = {
        
        let tf = CustomTextField(placeholder: "Username")
        return tf
    }()
    
    private let signUpButton: CustomButton = {
        
        let button = CustomButton(placeholder: "Sign Up")
        return button
    }()
    
    private lazy var alreadyHaveanAccountButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Log In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)

        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Actions
    
    @objc func handleShowLogin() {
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveanAccountButton)
        alreadyHaveanAccountButton.centerX(inView: view)
        alreadyHaveanAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}

