import UIKit
import SnapKit

class UserInfo {
    var name: String = ""
    var password: String = ""
}

// MARK: - View Controller
final class LoginViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
        view.addGestureRecognizer(tapGesture)
        setupUI()
    }
    
    @objc func handleScreenTap() {
        view.endEditing(true)
    }
    
    // UI
    
    var user = UserInfo()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Вход"
        l.textColor = .label
        l.font = .systemFont(ofSize: 28)
        return l
    }()
    
    @objc lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Логин"
        tf.backgroundColor = .secondarySystemBackground
        tf.textColor = .label
        tf.font = .systemFont(ofSize: 19)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.backgroundColor = .secondarySystemBackground
        tf.textColor = .label
        tf.font = .systemFont(ofSize: 19)
        tf.borderStyle = .roundedRect
        tf.delegate = self
        return tf
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 50

        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
        button.addTarget(self, action: #selector(loginButtonClick), for: .touchDown)
        
        return button
    }()
    
    lazy var registerView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            noAccountLabel,
            createAccountButton
        ])
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 4
        return sv
    }()
    
    lazy var noAccountLabel: UILabel = {
        let l = UILabel()
        l.text = "Нет аккаунта?"
        l.textColor = .label
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    lazy var createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрироваться.", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(acceptButton)
        view.addSubview(registerView)
        
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
        }
        
        nameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameTextField.snp.bottom).inset(-10)
        }
        
        registerView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        acceptButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(registerView.snp.top).inset(-20)
        }
    }
    
    @objc func loginButtonClick () {
        // TODO: Check account
        print(user.name, user.password)
    }
    
//    func nameTextField(_ textField: UITextField) -> Bool {
//        user.password = textField.text!
//        return true
//    }
//    
//    func passwordTextField(_ textField: UITextField) -> Bool {
//        user.password = textField.text!
//        return true
//    }
}
