import Foundation

enum Endpoint {
    
    // MARK: - Static Properties
    
    static var signupURL: URL? {
        URL(string: "users", relativeTo: Environment.baseUrl)
    }
    
    static var signinURL: URL? {
        URL(string: "users/sign_in", relativeTo: Environment.baseUrl)
    }
    
    static var signoutURL: URL? {
        URL(string: "users/sign_out", relativeTo: Environment.baseUrl)
    }
    
    static var changePasswordURL: URL? {
        URL(string: "user/change_password.json", relativeTo: Environment.baseUrl)
    }
    
    static var updateUserURL: URL? {
        URL(string: "user/update", relativeTo: Environment.baseUrl)
    }
    
    static var getUserProfileURL: URL? {
        URL(string: "user/profile", relativeTo: Environment.baseUrl)
    }
    
    static var forgotPasswordURL: URL? {
        URL(string: "users/password", relativeTo: Environment.baseUrl)
    }
    
    static var getEmployeesURL: (Int, String) -> URL? = {
        URL(string: "employees/?page=\($0)/&query=\($1)", relativeTo: Environment.baseUrl)
    }
    
    static var createEmployeeURL: URL? {
        URL(string: "employees", relativeTo: Environment.baseUrl)
    }
    
    static var deleteEmployeeURL: (String) -> URL? = {
        URL(string: "employees/\($0)/", relativeTo: Environment.baseUrl)
    }
    
    static var updateShowroomURL: URL? {
        URL(string: "organization/update", relativeTo: Environment.baseUrl)
    }
    
    static var buyCarURL: URL? {
        URL(string: "xero/purchase", relativeTo: Environment.baseUrl)
    }
    
    static var sellCarURL: URL? {
        URL(string: "xero/sell", relativeTo: Environment.baseUrl)
    }
    
    static var searchCarURL: (String) -> URL? = {
        URL(string: "xero/item?registration=\($0)", relativeTo: Environment.baseUrl)
    }
    
    static var getCarsInStocksURL: URL? {
        URL(string: "xero/items", relativeTo: Environment.baseUrl)
    }
    
    static var setXeroTokenURL: URL? {
        URL(string: "xero/set_token", relativeTo: Environment.baseUrl)
    }
    
    static var getConfirmationTokenURL: URL? {
        URL(string: "user/confirmation_token", relativeTo: Environment.baseUrl)
    }
    
    static var xeroAuthenticationURL: URL? {
        let urlString = "https://login.xero.com/identity/connect/authorize?response_type=code&client_id=C1C3C12DC18C43ACB4D96CB024BFD2E2&redirect_uri=https%3A%2F%2Fbeta.mba-apps.com%2Fcallback&scope=openid+profile+email+accounting.contacts+accounting.settings+accounting.transactions+offline_access"
        return URL(string: urlString)
    }
    
    static var stripeAuthenticationURL: (String) -> URL? = {
        URL(string: "https://beta.mba-apps.com/stripe-integration?confirmation_token=\($0)")
    }
}
