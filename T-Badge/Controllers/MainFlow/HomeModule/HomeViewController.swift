//
//  HomeViewController.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

// MARK: - View Protocol
protocol HomeViewProtocol: AnyObject {
    
}

// MARK: - View Controller
final class HomeViewController: UIViewController {
    
    // UI
    
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoaded()
    }
    
    private func setupUI() {
        view.backgroundColor = .green
    }
}

// MARK: - View Protocol Realization
extension HomeViewController: HomeViewProtocol {
    
}
