//
//  MyTabBarViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeUseCase = Injection.init().provideHome()
        let homePresenter = HomePresenter(homeUseCase: homeUseCase)
        let homeViewController = UINavigationController(rootViewController: HomeViewController(presenter: homePresenter))
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        viewControllers = [homeViewController]
        

        // Do any additional setup after loading the view.
    }
    

   
}
