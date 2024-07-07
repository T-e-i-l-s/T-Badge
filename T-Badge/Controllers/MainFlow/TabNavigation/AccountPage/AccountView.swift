import UIKit
import SnapKit

// Будем потом подгружать из апи
struct Achievment {
    let image: String
    let name: String
    
    init (image: String, name: String) {
        self.image = image
        self.name = name
    }
}

struct UserInfo {
    let image = "profile_sample"
    let name = "Иван Иванов"
    let achievements = [
        Achievment(image: "achivement1", name: "Чел хорош"),
        Achievment(image: "achivement2", name: "Чел мегахорош")
    ]
}

final class AccountView: UIView {
    lazy var userInfo = UserInfo()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: userInfo.image)
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = userInfo.name
        l.textColor = .label
        l.numberOfLines = 0
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return l
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        
        profileImageView.snp.makeConstraints({ make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        })
        
        nameLabel.snp.makeConstraints({ make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        })
    }
}

