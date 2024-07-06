import UIKit
import SnapKit

final class SelectModeView: UIView {
    
    lazy var createNewEventButton: UIButton = {
        let b = UIButton()
        b.setTitle("Создать свое событие", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        b.layer.cornerRadius = 8.0
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        configuration.baseBackgroundColor = .systemBlue
        b.configuration = configuration
        
        return b
    }()
    
    lazy var joinEventWithCodeButton: UIButton = {
        let b = UIButton()
        b.setTitle("Ввести код", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        b.layer.cornerRadius = 8.0
        
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        configuration.baseBackgroundColor = .systemBlue
        b.configuration = configuration
        
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        let container = UIView()
        addSubview(container)
        container.addSubview(createNewEventButton)
        container.addSubview(joinEventWithCodeButton)
        
        container.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        createNewEventButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
        }
        joinEventWithCodeButton.snp.makeConstraints { make in
            make.top.equalTo(createNewEventButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Обновляем размеры градиентного слоя с учетом размеров кнопки
        if let gradientLayer = createNewEventButton.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = createNewEventButton.bounds
        }
    }
}
