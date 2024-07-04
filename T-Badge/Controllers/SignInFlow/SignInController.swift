import Foundation
import UIKit

// MARK: - View Controller
final class SignInController: UIViewController {
    var user = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var backButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        b.setTitle("Назад", for: .normal)
        b.sizeToFit()
        b.addTarget(self, action: #selector(cancelSignIn), for: .touchDown)
        return b
    }()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Регистрация"
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
        return tf
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрировать", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 50

        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
        button.addTarget(self, action: #selector(loginButtonClick), for: .touchDown)
        
        return button
    }()
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(acceptButton)
        
        
        backButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(backButton.snp.bottom).inset(-20)
        }
        
        nameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameTextField.snp.bottom).inset(-10)
        }
        
        acceptButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    @objc func loginButtonClick () {
        // TODO: Check account
        print(user.name, user.password)
    }
    
    @objc func cancelSignIn () {
        self.dismiss(animated: true, completion: nil)
    }
}
