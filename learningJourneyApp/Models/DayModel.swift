import SwiftUI

struct Day: Identifiable {
    let id = UUID()
    let date: Date
    var state: DayState

    enum DayState {
        case streak, freeze, none
    }
}
