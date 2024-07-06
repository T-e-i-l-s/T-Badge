import UIKit
import SnapKit

// MARK: - View Controller
final class SelectModeViewController: UIViewController {
    private lazy var rootView = view as! SelectModeView
    
    override func loadView() {
        super.loadView()
        view = SelectModeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добавить событие"
        
        rootView.createNewEventButton.addTarget(self, action: #selector(openCreateNewEventController), for: .touchDown)
    }
    
    @objc func openCreateNewEventController() {
        print(123)
        let createEventVC = CreateEventViewController()
        createEventVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(createEventVC, animated: true)
    }
    
    @objc func openEventWithCodeController() {
    }
}
