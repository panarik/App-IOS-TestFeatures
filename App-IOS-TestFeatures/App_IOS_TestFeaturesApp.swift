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

        // inject screen
        #if DEBUG
        var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
        #if targetEnvironment(macCatalyst)
        injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
        #elseif os(iOS)
        injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
        #endif
        Bundle(path: injectionBundlePath)?.load()
        #endif

    }

    var body: some Scene {
        WindowGroup {
            AuthView(signedIn: userIsSignedIn)
        }
    }
}
