// MARK: - OnboardingViewModel.swift

import Foundation
import SwiftUI

public class OnboardingViewModel: ObservableObject {
    
    @Published public var selectedTimeFrame: TimeFrame = .week
    
    @Published var learningGoal: String = ""
    
    
    
}



