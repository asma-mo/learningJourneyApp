import SwiftUI

@main
struct learningJourneyAppApp: App {
    
    // How to use enviroment Object? It is global storage
    @StateObject  var globalObject = OnboardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environmentObject(globalObject)
        }
    }
}
