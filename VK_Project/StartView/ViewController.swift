//
//  ViewController.swift
//  VK_Project
//
//  Created by Vladimir Barus on 01.11.2020.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookLogin: UIButton!
    @IBOutlet weak var appleLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: logo.heightAnchor)
        ])
        facebookLogin.layer.borderWidth = 1
        facebookLogin.layer.borderColor = UIColor.darkGray.cgColor
        facebookLogin.layer.masksToBounds = true
        facebookLogin.layer.cornerRadius = 6
        appleLogin.layer.borderWidth = 1
        appleLogin.layer.borderColor = UIColor.darkGray.cgColor
        appleLogin.layer.masksToBounds = true
        appleLogin.layer.cornerRadius = 6
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 6
    }
}
