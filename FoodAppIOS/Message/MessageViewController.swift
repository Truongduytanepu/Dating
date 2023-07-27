//
//  MessageViewController.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 23/07/2023.
//

import UIKit
import Firebase
import FirebaseAuth

class MessageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func logOutHandle(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            // Xoá thông tin đăng nhập lưu trữ bằng UserDefaults
            UserDefaults.standard.removeObject(forKey: "isLoggedIn")
            
            // Điều hướng người dùng đến màn hình đăng nhập
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                appDelegate.window?.rootViewController = loginVC
            }
        }catch{
            print("Logout Failure")
        }
    }
}
