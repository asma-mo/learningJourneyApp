// MARK: - OnboardingViewModel.swift

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var learningGoal: String = ""
    @Published var selectedDuration: GoalDuration = .month
    
    func startLearning() {
        let goal = LearningGoal(subject: learningGoal, duration: selectedDuration)
        saveGoal(goal)
    }
    
    private func saveGoal(_ goal: LearningGoal) {
        if let encoded = try? JSONEncoder().encode(goal) {
            UserDefaults.standard.set(encoded, forKey: "learningGoal")
        }
    }
}