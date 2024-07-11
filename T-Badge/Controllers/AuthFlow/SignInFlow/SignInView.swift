import UIKit
import SnapKit

final class SignInView: UIView {
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
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    var user = SignInUserInfo()
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    lazy var welcomeLabel: UILabel = {
        let l = UILabel()
        l.text = "Рад знакомству 🤝"
        l.textColor = .label
        l.font = .systemFont(ofSize: 30, weight: .semibold)
        l.textAlignment = .center
        return l
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Ваше имя"
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.layer.cornerRadius = 13
        tf.layer.cornerCurve = .continuous
        tf.backgroundColor = .secondarySystemBackground
        return tf
    }()
    
    lazy var usernameTextField: UITextField = {
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
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 13
        button.layer.cornerCurve = .continuous
        button.clipsToBounds = true

        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
        return button
    }()

    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(50)
            make.centerX.equalToSuperview()
        }
        
        addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        addSubview(nameTextField)
        nameTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(usernameTextField.snp.top).offset(-15)
            make.height.equalTo(50)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(usernameTextField.snp.bottom).inset(-15)
            make.height.equalTo(50)
        }
        
        addSubview(acceptButton)
        acceptButton.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(20)
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
