import UIKit
import SnapKit

// Будем потом подгружать из апи
struct AchievmentModel {
    let image: String
    let name: String
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}

struct UserInfo {
    let image = "profile_sample"
    let name = "Иван Иванов"
    let achievements = [
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош"),
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош"),
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош"),
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош"),
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош"),
        AchievmentModel(image: "achievement1", name: "Чел хорош"),
        AchievmentModel(image: "achievement2", name: "Чел мегахорош")
    ]
}

final class AccountView: UIView{
    lazy var userInfo = UserInfo()
    private var collectionViewHeightConstraint: Constraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    var userInfoView: UIView = {
        let v = UIView()
        v.backgroundColor = .tertiarySystemFill
        v.layer.cornerRadius = 16
        return v
    }()
    
    var accountIconBackground: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray
        v.layer.cornerRadius = 25
        return v
    }()
    
    var accountText: UILabel = {
        let l = UILabel()
        l.text = ""
        l.textColor = .systemBackground
        l.font = UIFont.systemFont(ofSize: 23, weight: .regular)
        return l
    }()
    
    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = userInfo.name
        l.textColor = .label
        l.numberOfLines = 0
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return l
    }()
    
    var achievementsView: UIView = {
        let v = UIView()
        v.backgroundColor = .tertiarySystemFill
        v.layer.cornerRadius = 16
        return v
    }()
    
    lazy var achievementsBlockTitle: UILabel = {
        let l = UILabel()
        l.text = "Достижения"
        l.textColor = .label
        l.numberOfLines = 0
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return l
    }()
    
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(userInfoView)
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(17)
            make.leading.trailing.equalToSuperview().inset(17)
        }
        
        userInfoView.addSubview(accountIconBackground)
        accountIconBackground.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(14)
            make.top.bottom.equalToSuperview().inset(14)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        accountIconBackground.addSubview(accountText)
        accountText.text = userInfo.name.prefix(1).uppercased()
        accountText.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        userInfoView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(accountIconBackground.snp.trailing).offset(14)
            make.trailing.equalToSuperview().inset(14)
        }
        
        
        addSubview(achievementsView)
        achievementsView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(17)
        }
        
        achievementsView.addSubview(achievementsBlockTitle)
        achievementsBlockTitle.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(17)
        }
        
        
        let achievmentsCollectionView = AchievementCollectionView()
        achievmentsCollectionView.configure(data: userInfo.achievements)
        achievementsView.addSubview(achievmentsCollectionView)
        achievmentsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(achievementsBlockTitle.snp.bottom).offset(14)
            make.bottom.equalToSuperview().inset(17)
            make.leading.trailing.equalToSuperview().inset(17)
        }
    }
}
