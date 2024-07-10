class AuthStubs {
    func checkAccess(name: String, password: String, result: @escaping (String?) -> ()) {
        result("token")
    }
    
    func createAccount(name: String, password: String, result: @escaping (String?) -> ()) {
        result("token")
    }
}
