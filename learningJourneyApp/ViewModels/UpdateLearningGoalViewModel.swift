import SwiftUI
import Combine

class UpdateLearningGoalViewModel: ObservableObject {
    @Published var learningSubject: String = ""
    @Published var newTimeFrame: TimeFrame? = nil

    private var onboardingVM: OnboardingViewModel?
    private var currentDayVM: CurrentDayViewModel?

   
    func updateLearningGoal() {
        guard let onboardingVM = onboardingVM, let currentDayVM = currentDayVM else {
            
            return
        }

        let isTitleChanged = !learningSubject.isEmpty && learningSubject != onboardingVM.learningGoal
        let isDurationChanged = newTimeFrame != nil && newTimeFrame != onboardingVM.selectedTimeFrame

        if isTitleChanged && isDurationChanged {
            onboardingVM.learningGoal = learningSubject
            onboardingVM.selectedTimeFrame = newTimeFrame!
            currentDayVM.test = false
        } else if isDurationChanged {
            onboardingVM.selectedTimeFrame = newTimeFrame!
        } else if isTitleChanged {
            onboardingVM.learningGoal = learningSubject
        }
    }

    
    func initialize(onboardingVM: OnboardingViewModel, currentDayVM: CurrentDayViewModel) {
        self.onboardingVM = onboardingVM
        self.currentDayVM = currentDayVM
        learningSubject = onboardingVM.learningGoal
        newTimeFrame = onboardingVM.selectedTimeFrame
    }
}
