import UIKit
import SnapKit

// MARK: - View Controller
final class EventInfoViewController: UIViewController {
    private lazy var rootView = view as! EventInfoView
    
    override func loadView() {
        super.loadView()
        view = EventInfoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "О событии"
        rootView.getBadgeButton.addTarget(self, action: #selector(openBadgePage), for: .touchDown)
    }
    
    @objc func openBadgePage () {
//        let addModeSelectorVC = SelectModeViewController()
//        addModeSelectorVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(addModeSelectorVC, animated: true)
        let BadgeVC = BadgeViewController()
        BadgeVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(BadgeVC, animated: true)
    }
}
