import UIKit

class TabBarController: UITabBarController {
    
    let homeController: UIViewController = {
        let view = UIViewController()
        view.view.backgroundColor = .systemBackground
        view.tabBarItem.title = "События"
        view.tabBarItem.image = UIImage(systemName: "house")
        return view
    }()
    
    let profileController: UIViewController = {
        let view = UIViewController()
        view.view.backgroundColor = .systemBackground
        view.tabBarItem.title = "Профиль"
        view.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([homeController, profileController], animated: true)
    }
}
