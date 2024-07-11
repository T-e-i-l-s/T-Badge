import UIKit
import SnapKit

final class AccountView: UIView {
    var userInfo: UserInfo = UserInfo(name: "", achievements: [], visitsCount: 0) {
        didSet {
            updateUI()
        }
    }
    
    private var collectionViewHeightConstraint: Constraint?
    
    private let achievmentsCollectionView = AchievementCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
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
    
    lazy var emptyListLabel: UILabel = {
        let l = UILabel()
        l.text = "Нет достижений"
        l.textColor = .label
        l.numberOfLines = 0
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
    
    lazy var visitsCountLabel: UILabel = {
        let l = UILabel()
        l.text = "\(userInfo.visitsCount) событий"
        l.textColor = .label
        l.numberOfLines = 0
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return l
    }()
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(userInfoView)
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
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
        accountText.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        userInfoView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-12)
            make.leading.equalTo(accountIconBackground.snp.trailing).offset(14)
            make.trailing.equalToSuperview().inset(14)
        }
        
        userInfoView.addSubview(visitsCountLabel)
        visitsCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(12)
            make.leading.equalTo(accountIconBackground.snp.trailing).offset(14)
            make.trailing.equalToSuperview().inset(14)
        }
        
//        userInfoView.addSubview(spinner)
//        spinner.snp.makeConstraints{ make in
//            make.center.equalToSuperview()
//        }
        
        addSubview(achievementsView)
        achievementsView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(17)
        }
        
        achievementsView.addSubview(achievementsBlockTitle)
        achievementsBlockTitle.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(17)
        }
        
        achievementsView.addSubview(achievmentsCollectionView)
        achievmentsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(achievementsBlockTitle.snp.bottom).offset(14)
            make.bottom.equalToSuperview().inset(17)
            make.leading.trailing.equalToSuperview().inset(17)
        }
        
        achievmentsCollectionView.addSubview(emptyListLabel)
        emptyListLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    
    private func updateUI() {
        nameLabel.text = userInfo.name
        accountText.text = userInfo.name.prefix(1).uppercased()
        let count = userInfo.visitsCount
        visitsCountLabel.text = "\(count) \(count == 1 ? "событие" : count >= 2 && count <= 4 ? "события" : "событий")"
        achievmentsCollectionView.configure(data: userInfo.achievements)
        
        if userInfo.achievements.isEmpty {
            emptyListLabel.isHidden = false
        } else {
            emptyListLabel.isHidden = true
        }
    }
}
