//
//  LoginPresenter.swift
//  Super easy dev
//
//  Created by vanyaluk on 01.07.2024
//

import UIKit

protocol LoginPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

final class LoginPresenter {
    weak var view: LoginViewProtocol?
    var router: LoginRouterInput

    init(view: LoginViewProtocol, router: LoginRouterInput) {
        self.view = view
        self.router = router
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func viewDidLoaded() {
        // first setup view
    }
}
