import UIKit
import SnapKit

final class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupTapGesture() {
        // WARN: Эта херня не работает, но она должна скрывать клаву когда юзер нажимает на экран после ввода
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    var user = LoginUserInfo()
    
    lazy var nameTextField: UITextField = {
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
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
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
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрироваться.", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(nameTextField)
        addSubview(passwordTextField)
        addSubview(acceptButton)
        addSubview(registerView)
        
        nameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
        }
        
        registerView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        acceptButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(registerView.snp.top).offset(-20)
        }
        
    }
    
    @objc func dismissKeyboard() {
        print("Dismiss keyboard")
        
        self.endEditing(true)
    }
}
