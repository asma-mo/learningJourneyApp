import SwiftUI

@main
struct learningJourneyAppApp: App {
    
    // How to use enviroment Object? It is global storage
    @StateObject  var OnboardingVM = OnboardingViewModel()
    @StateObject  var CurrentDayVM = CurrentDayViewModel()
    @StateObject  var UpdateLearningGoalVM = UpdateLearningGoalViewModel()
    
    var body: some Scene {
        WindowGroup {
            // All views OnboardingView() will navigate me to them can also have access to this global storage...
            OnboardingView()
                .environmentObject(CurrentDayVM)
                .environmentObject(OnboardingVM)
                .environmentObject(UpdateLearningGoalVM)
        }
    }
}
