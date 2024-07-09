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
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Логин"
        tf.backgroundColor = .tertiarySystemFill
        tf.textColor = .label
        tf.font = .systemFont(ofSize: 19)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.backgroundColor = .tertiarySystemFill
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
        
        return button
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(nameTextField)
        addSubview(passwordTextField)
        addSubview(acceptButton)
        
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
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
