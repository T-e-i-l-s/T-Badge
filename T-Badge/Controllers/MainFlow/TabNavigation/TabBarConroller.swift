import UIKit

class TabBarController: UITabBarController {
    
    private lazy var homeController: UIViewController = {
        let view = UINavigationController(rootViewController: HomeViewController())
        view.tabBarItem.title = "События"
        view.tabBarItem.image = UIImage(systemName: "house")
        return view
    }()
    
    private lazy var profileController: UIViewController = {
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
        self.setViewControllers([homeController, profileController], animated: true)
    }
}
