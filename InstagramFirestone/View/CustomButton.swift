//
//  CustomButton.swift
//  InstagramFirestone
//
//  Created by Alphan Ogün on 5.07.2023.
//

import UIKit

class CustomButton: UIButton {
     init(placeholder: String) {
         super.init(frame: .zero)
        
         setTitle(placeholder, for: .normal)
         setTitleColor(.white, for: .normal)
         backgroundColor = .systemPurple.withAlphaComponent(0.5)
         isEnabled = false
         layer.cornerRadius = 5
         titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
         setHeight(50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
