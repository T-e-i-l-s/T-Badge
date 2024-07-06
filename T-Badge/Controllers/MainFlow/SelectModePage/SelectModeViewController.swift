import UIKit
import SnapKit

// MARK: - View Controller
final class SelectModeViewController: UIViewController {
    private lazy var rootView = view as! LoginView
    
    override func loadView() {
        super.loadView()
        view = SelectModeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добавить событие"
    }
    
    @objc func openCreateNewEventController() {
    }
    
    @objc func openEventWithCodeController() {
    }
}
