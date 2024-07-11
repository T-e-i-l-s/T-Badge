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
        setupUI()
        setupTapGesture()
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    var user = LoginUserInfo()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    lazy var welcomeLabel: UILabel = {
        let l = UILabel()
        l.text = "Привет👋"
        l.textColor = .label
        l.font = .systemFont(ofSize: 42, weight: .semibold)
        l.textAlignment = .center
        return l
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Логин"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.layer.cornerRadius = 13
        tf.layer.cornerCurve = .continuous
        tf.backgroundColor = .secondarySystemBackground
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.isSecureTextEntry = true
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.layer.cornerRadius = 13
        tf.layer.cornerCurve = .continuous
        tf.backgroundColor = .secondarySystemBackground
        return tf
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 13
        button.layer.cornerCurve = .continuous
        button.clipsToBounds = true
        
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
        
        addSubview(welcomeLabel)
        addSubview(nameTextField)
        addSubview(passwordTextField)
        addSubview(acceptButton)
        addSubview(registerView)
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.center.equalToSuperview()
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(nameTextField.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        
        registerView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.centerX.equalToSuperview()
        }
        
        acceptButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(registerView.snp.top).offset(-15)
        }
        
        addSubview(spinner)
        spinner.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
