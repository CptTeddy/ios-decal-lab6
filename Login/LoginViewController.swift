//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
        static let labelMargin: CGFloat = 30
        static let labelHeight: CGFloat = 200
        static let subviewHeight: CGFloat = 250
        static let textfieldWidth: CGFloat = 100
        static let textfieldHeight: CGFloat = 60
        static let buttonWidth: CGFloat = 50
        static let buttonHeight: CGFloat = 50
    }

    // TODO: instantiate the views needed for your project
    var view1: UILabel = {
        let label = UILabel()
        label.text = "Login View Controller"
        label.font = UIFont(name: "Avenir", size: 36)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    var view2: UIView = {
        let subview = UIView()
        subview.backgroundColor = UIColor.white
        subview.layer.cornerRadius = 18
        return subview
    }()
    
    var view3: UITextField = {
        let account = UITextField()
        account.placeholder = "account login"
        account.backgroundColor = UIColor.white
        return account
    }()
    
    var view4: UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.backgroundColor = UIColor.white
        return password
    }()
    
    let view5: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 30)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = Constants.backgroundColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        // TODO: layout your views using frames or AutoLayout
        
        view.addSubview(view1)
        view.addSubview(view2)
        view2.addSubview(view3)
        view2.addSubview(view4)
        view2.addSubview(view5)
        
        view1.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: Constants.labelHeight)
        view1.textAlignment = NSTextAlignment.center
        
        view2.frame = CGRect(x: 0, y: -60, width: view.frame.width * 0.9, height: Constants.subviewHeight)
        view2.center = view.center
        
        view3.frame = CGRect(x: 15, y: 0, width: view2.frame.width * 0.8, height: Constants.textfieldHeight)
    
        view4.frame = CGRect(x: 15, y: 80, width: view2.frame.width * 0.8, height: Constants.textfieldHeight)

        view5.frame = CGRect(x: view2.frame.width * 0.2, y: view2.frame.height - 90, width: 0.6 * view2.frame.width, height: Constants.buttonHeight)
        
        
    }
    
    // TODO: create an IBAction for your login button
    
    
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
