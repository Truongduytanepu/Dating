//
//  MainTabbarViewController.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 22/07/2023.
//

import UIKit
import ESTabBarController_swift


class MainTabbarViewController: ESTabBarController {

    
    lazy var homeVC: UIViewController = {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserViewController")
            viewController.view.backgroundColor = .green
            viewController.tabBarItem = ESTabBarItem(
                CustomStyleTabBarContentView(),
                title: "Home".uppercased(),
                image: UIImage(named: "home"),
                selectedImage: UIImage(named: "home"))
            let nav = AppNavigationController(rootViewController: viewController)
            return nav
        }()
            

    lazy var home1VC: UIViewController = {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MessageViewController")
            viewController.view.backgroundColor = .gray
            viewController.tabBarItem = ESTabBarItem(
                CustomStyleTabBarContentView(),
                title: "Message".uppercased(),
                image: UIImage(named: "message"),
                selectedImage: UIImage(named: "message"))
            let nav = AppNavigationController(rootViewController: viewController)
            return nav
        }()
    
    lazy var home2VC: UIViewController = {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
            viewController.tabBarItem = ESTabBarItem(
                CustomStyleTabBarContentView(),
                title: "Profile".uppercased(),
                image: UIImage(named: "user"),
                selectedImage: UIImage(named: "user"))
            let nav = AppNavigationController(rootViewController: viewController)
            return nav
        }()
    
    override func loadView() {
        super.loadView()
        loadTabBarView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = .clear
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedIndex = 0
    }

    private func loadTabBarView() {
        setViewControllers([homeVC, home1VC, home2VC], animated: true)
    }
}

