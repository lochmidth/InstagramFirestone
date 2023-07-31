//
//  MainTabController.swift
//  InstagramFirestone
//
//  Created by Alphan Ogün on 1.07.2023.
//

import UIKit
import FirebaseAuth

class MainTabController: UITabBarController {
    
    //MARK: - Lifecycle
    
    private var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        checkIfUserLoggedIn()
        
    }
    
    //MARK: - API
    
    func fetchUser() {
        
        UserService.fetchUser { user in
            self.user = user
        }
    }
    
    func checkIfUserLoggedIn() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
    
    //MARK: - Helpers
    
    func configureViewControllers(withUser user: User) {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: UIImage(named: "home_unselected"), selectedImage: UIImage(named: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_unselected"), rootViewController: ImageSelectorController())
        
        let notificaitons = templateNavigationController(unselectedImage: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), rootViewController: NotificationController())
        
        let profileController = ProfileController(user: user)
        let profile = templateNavigationController(unselectedImage: UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"), rootViewController: profileController)
        
        viewControllers = [feed, search, imageSelector, notificaitons, profile]
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        
    }
    
    func templateNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
        
    }
    
}

//MARK: - AuthenticationDelegate

extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        fetchUser()
        self.dismiss(animated: true)
    }
}
