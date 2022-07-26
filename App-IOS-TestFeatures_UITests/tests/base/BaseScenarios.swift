import Foundation

class BaseScenarios: BaseTestClass {
    
    func auth() {
        authPage.enterName("name")
                .enterEmail("email")
                .enterPass("pass123")
                .tapSignUpButton()
        main.onPage()
    }
    
}
