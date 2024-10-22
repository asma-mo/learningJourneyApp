// MARK: - LearningModels.swift

import Foundation

/// Represents what the user wants to learn
struct LearningGoal: Codable {
    var subject: String
    var duration: GoalDuration
}

enum GoalDuration: String, Codable, CaseIterable {
    case week
    case month
    case year
    
    /// Provides the maximum number of freeze days allowed based on the duration
    var maxFreezes: Int {
        switch self {
        case .week: return 2
        case .month: return 6
        case .year: return 60
        }
    }
}


/// Tracks the user's learning progress
struct LearningProgress: Codable {
    var streak: Int
    var lastLearnedDate: Date?
    var remainingFreezes: Int
    
    init(streak: Int = 0,
         lastLearnedDate: Date? = nil,
         remainingFreezes: Int = 6) {
        self.streak = streak
        self.lastLearnedDate = lastLearnedDate
        self.remainingFreezes = remainingFreezes
    }
}
