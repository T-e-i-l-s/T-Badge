import Foundation
import UIKit

// MARK: - View Controller
final class SignInController: UIViewController {
    
    private lazy var rootView = view as! SignInView
    
    var userInfo = SignInUserInfo()
    
    override func loadView() {
        view = SignInView(frame: .zero)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.acceptButton.addTarget(self, action: #selector(acceptButtonClick), for: .touchUpInside)
        
        title = "Регистрация"
    }
    
    @objc func acceptButtonClick () {
        // TODO: Check account
    }
}
