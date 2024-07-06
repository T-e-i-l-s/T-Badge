import UIKit
import SnapKit

final class CreateEventView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Название"
        tf.backgroundColor = .secondarySystemBackground
        tf.textColor = .label
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.secondarySystemFill.cgColor
        tf.font = .systemFont(ofSize: 19)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Описание"
        tv.backgroundColor = .secondarySystemBackground
        tv.textColor = .label
        tv.font = .systemFont(ofSize: 19)
        tv.layer.cornerRadius = 8.0
        tv.layer.borderWidth = 1.0
        tv.layer.borderColor = UIColor.secondarySystemFill.cgColor
        tv.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()


    lazy var startDateLabel: UILabel = {
        let l = UILabel()
        l.text = "Начало события"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        return l
    }()
    
    private lazy var startDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.preferredDatePickerStyle = .wheels
        dp.timeZone = TimeZone.current
        return dp
    }()
    
    lazy var endDateLabel: UILabel = {
        let l = UILabel()
        l.text = "Конец события"
        l.textColor = .label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        return l
    }()
    
    private lazy var endDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .dateAndTime
        dp.preferredDatePickerStyle = .wheels
        dp.timeZone = TimeZone.current
        return dp
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Создать", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        button.configuration = configuration
        
        return button
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        let scrollView = UIScrollView()
        addSubview(scrollView)
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(descriptionTextView)
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(startDatePicker)
        stackView.addArrangedSubview(endDateLabel)
        stackView.addArrangedSubview(endDatePicker)
        stackView.addArrangedSubview(acceptButton)
        
        scrollView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        
        contentView.snp.makeConstraints({ make in
            make.edges.width.equalToSuperview()
        })
        
        stackView.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        })
        
        descriptionTextView.snp.makeConstraints({ make in
            make.height.equalTo(120)
        })
        
        nameTextField.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        startDateLabel.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        startDatePicker.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        endDateLabel.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        endDatePicker.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        acceptButton.snp.makeConstraints({ make in
            make.width.equalToSuperview()
        })
        
        contentView.layoutIfNeeded()
        scrollView.layoutIfNeeded()
    }

    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
