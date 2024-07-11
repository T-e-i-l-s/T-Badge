import UIKit

class TabBarController: UITabBarController {
    
    private lazy var homeController: UINavigationController = {
        let vc = HomeViewController()
        let view = UINavigationController(rootViewController: vc)
        view.tabBarItem.title = "События"
        view.tabBarItem.image = UIImage(systemName: "house")
        return view
    }()
    
    private lazy var profileController: UINavigationController = {
        let view = UINavigationController(rootViewController: AccountViewController(authManager: authManager, updateAuth: updateAuth))
        view.tabBarItem.title = "Профиль"
        view.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        return view
    }()
    
    private let authManager: AuthManager
    private let updateAuth: () -> Void
    
    init(authManager: AuthManager, updateAuth: @escaping () -> Void) {
        self.authManager = authManager
        self.updateAuth = updateAuth
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = AccountViewController(authManager: authManager, updateAuth: updateAuth)
        let view1 = UINavigationController(rootViewController: vc1)
        view1.tabBarItem.title = "Профиль"
        view1.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        
        let vc2 = HomeViewController()
        vc2.accountViewController = vc1
        let view2 = UINavigationController(rootViewController: vc2)
        view2.tabBarItem.title = "События"
        view2.tabBarItem.image = UIImage(systemName: "house")
        
        self.setViewControllers([view2, view1], animated: true)
    }
}
