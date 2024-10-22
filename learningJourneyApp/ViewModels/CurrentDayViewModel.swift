// MARK: - CurrentDayViewModel.swift

import Foundation
import SwiftUI

class CurrentDayViewModel: ObservableObject {
    @Published var progress: LearningProgress = LearningProgress()
    
    func logAsLearned() {
        progress.streak += 1
        progress.lastLearnedDate = Date()
        saveProgress()
    }
    
    func logAsFrozen() {
        guard progress.remainingFreezes > 0 else { return }
        progress.remainingFreezes -= 1
        saveProgress()
    }
    
    private func saveProgress() {
        if let encoded = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(encoded, forKey: "learningProgress")
        }
    }
}
