class AuthStubs {
    func checkAccess (name: String, password: String) -> Bool {
        // Тут надо будет проверять логин и пароль
        if (name != "1" || password != "1") {
            return false
        }
        return true
    }
    
    func createAccount (name: String, password: String) {
        // Тут надо будет все закинуть на сервер
    }
}
