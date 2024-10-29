import Foundation

public enum TimeFrame: String, CaseIterable {
    case week = "Week"
    case month = "Month"
    case year = "Year"
    
    var maxFreezes: Int {
        switch self {
        case .week: return 2
        case .month: return 6
        case .year: return 60
        }
    }
    
    var maxStreaks: Int {
        switch self {
        case .week: return 7
        case .month: return 31
        case .year: return 366
        }
    }
}



