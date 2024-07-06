import UIKit
import SnapKit

// MARK: - View Controller
final class CreateEventViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view = CreateEventView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создать событие"
    }
    
    @objc func openCreateNewEventController() {
    }
    
    @objc func openEventWithCodeController() {
    }
}
