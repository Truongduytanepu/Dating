//
//  RegisterViewController.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 09/07/2023.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var hidePassword2: UIButton!
    @IBOutlet weak var hidePassword1: UIButton!
    @IBOutlet weak var btnRmm: UIButton!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    var check: Bool = true
    var checkPassword1: Bool = true
    var checkPassword2: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 25
    }
    
    @IBAction func showPasswordHandle(_ sender: Any) {
        checkPassword1 = !checkPassword1
        if checkPassword1 {
            passwordTF.isSecureTextEntry = true
            hidePassword1.setImage(UIImage(named: "hide"), for: .normal)
        } else {
            passwordTF.isSecureTextEntry = false
            hidePassword1.setImage(UIImage(named: "show"), for: .normal)
        }
    }
    
    @IBAction func showPasswordHandle1(_ sender: Any) {
        checkPassword2 = !checkPassword2
        if checkPassword2 {
            confirmPasswordTF.isSecureTextEntry = true
            hidePassword2.setImage(UIImage(named: "hide"), for: .normal)
        } else {
            confirmPasswordTF.isSecureTextEntry = false
            hidePassword2.setImage(UIImage(named: "show"), for: .normal)
        }
    }
    
    @IBAction func rememberCheck(_ sender: Any) {
        check = !check
            if check {
                btnRmm.setImage(UIImage(named: "check"), for: .normal)
            } else {
                btnRmm.setImage(UIImage(named: "unchecked"), for: .normal)
            }
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    
    @IBAction func handleSignUp(_ sender: Any) {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let confirmPassword = confirmPasswordTF.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if password == confirmPassword{
                if error != nil{
                    let alert = UIAlertController(title: "Sign Up Failure", message: error?.localizedDescription ?? "Something went wrong", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(title: "Sign Up Successfully", message: "Your account has been created", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }else{
                let alert = UIAlertController(title: "Sign Up Failure", message: "Confirmpassword went wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}
