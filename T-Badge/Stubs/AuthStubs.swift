class AuthStubs {
    func checkAccess(username: String, password: String, result: @escaping (String?) -> ()) {
        result("token")
    }
    
    func createAccount(name: String, username: String, password: String, result: @escaping (String?) -> ()) {
        result("token")
    }
}
