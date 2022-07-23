import SwiftUI

@main
struct App_IOS_TestFeaturesApp: App {

    // Properties.
    var userIsSignedIn = false

    init() {
        // Run without authorization.
        if CommandLine.arguments.contains("-UITest_StartSignedIn") {
            userIsSignedIn = true
        }
        print("User is signed in: \(userIsSignedIn)")

    }

    var body: some Scene {
        WindowGroup {
            AuthView(signedIn: userIsSignedIn)
        }
    }
}
