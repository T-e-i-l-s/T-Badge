//
//  HomePresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol HomePresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class HomePresenter {
    weak var view: HomeViewProtocol?
    var router: HomeRouterInput

    init(view: HomeViewProtocol, router: HomeRouterInput) {
        self.view = view
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoaded() {
        // first setup view
    }
}
