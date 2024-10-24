import SwiftUI

class CurrentDayViewModel: ObservableObject {
    
    @Published var currentWeekDays: [Day] = []
    @Published var currentStreak: Int = 0
    @Published var daysFrozen: Int = 0
    @Published var daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @Published var weekOffset: Int = 0
    
    private var test = true
    
    private var calendar = Calendar.current

    
    
    init() {
        updateCurrentWeekDays()
    }
    
    //for testing!!
    var today: Day {
        currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: Date()) }) ?? currentWeekDays[0]
    }
    
    // New method to handle previous week navigation
    func previousWeek() {
        weekOffset -= 1
        updateCurrentWeekDays()
    }
    
    // New method to handle next week navigation
    func nextWeek() {
        weekOffset += 1
        updateCurrentWeekDays()
    }
    
    func updateCurrentWeekDays() {
        
        // Get the current date and add the week offset
        let currentDate = Calendar.current.date(byAdding: .weekOfYear, value: weekOffset, to: Date()) ?? Date()
        
        // Get the start of the week for the offset date
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: currentDate)?.start else {
            return
        }

        currentWeekDays = (0..<7).compactMap { day in
            guard let date = calendar.date(byAdding: .day, value: day, to: startOfWeek) else { return nil }
            
            if test && weekOffset == 0{
                
                // Dummy Data
                let dayOfWeek = calendar.component(.weekday, from: date) - 1
                
                if dayOfWeek == 4 {
                    return Day(date: date, state: .none)
                } else if dayOfWeek == 2 || dayOfWeek == 1 || dayOfWeek == 3 {
                    return Day(date: date, state: .streak)
                } else if dayOfWeek == 0 {
                    return Day(date: date, state: .freeze)
                } else {
                    return Day(date: date, state: .none)
                }
            } else {
                return Day(date: date, state: .none)
            }
        }

        updateStreakAndFreezeCounts()
    }
    
    func countFreezedDays() -> Int {
        
        return currentWeekDays.filter { $0.state == .freeze }.count
        
//        currentWeekDays.filter { (day: Day) -> Bool in
//            return day.state == .freeze
//        }

    }

    
    func countStreakDays() -> Int {
       
        return currentWeekDays.filter { $0.state == .streak }.count
    }

    
    // MARK: - Colors control
    
    func logText(for day: Day) -> String {
            let isToday = calendar.isDate(day.date, inSameDayAs: Date())
            
            switch day.state {
            case .streak:
                return  "Learned Today"
            case .freeze:
                return "Day Freezed"
            case .none:
                return "Log today as Learned"
            }
        }
    
    func backgroundColor(for day: Day) -> Color {
            let isToday = calendar.isDate(day.date, inSameDayAs: Date())
            
            switch day.state {
            case .streak:
                return isToday ? Color("primaryOrangeColor") : Color("darkOrangeColor")
            case .freeze:
                return isToday ? Color("primaryBlueColor") : Color("darkBlueColor")
            case .none:
                return isToday ? Color.clear : Color.clear
            }
        }
    
    func textColor(for day: Day) -> Color {
            let isToday = calendar.isDate(day.date, inSameDayAs: Date())
            
            switch day.state {
            case .streak:
                return isToday ? Color.white : Color("primaryOrangeColor")
            case .freeze:
                return isToday ? Color.white : Color("primaryBlueColor")
            case .none:
                return isToday ? Color.white : Color.white
            }
        }
    
    func buttonBackgroundColor( day: Day, isFreezeButton: Bool = false) -> Color {
        if isFreezeButton && (day.state == .streak || day.state == .freeze) {
            return Color("DarkBackgroundColor")
        }else if isFreezeButton {
           return Color("secondaryLightBlueColor")
        }
        
        switch day.state {
        case .streak:
            return Color("darkOrangeColor")
        case .freeze:
            return Color("darkBlueColor")
        case .none:
            return Color("primaryOrangeColor")
        }
    }
    
    func buttonTextColor( day: Day, isFreezeButton: Bool = false) -> Color {
        if isFreezeButton && (day.state == .streak || day.state == .freeze) {
            return Color(.lightGray)
        }else if isFreezeButton {
            return Color("primaryBlueColor")
        }
        
        switch day.state {
        case .streak:
            return Color("primaryOrangeColor")
        case .freeze:
            return Color("primaryBlueColor")
        case .none:
            return Color.black
        }
    }
    

    
    
    // MARK: - Today's Toggle logic
    
    func toggleStreak() {
        guard let todayIndex = currentWeekDays.firstIndex(where: { isToday($0.date) }) else { return }

        if currentWeekDays[todayIndex].state == .streak {
            currentWeekDays[todayIndex].state = .none
        } else {
            currentWeekDays[todayIndex].state = .streak
        }
        
        updateStreakAndFreezeCounts()
    }
    
    func toggleFreeze() {
        guard let todayIndex = currentWeekDays.firstIndex(where: { isToday($0.date) }) else { return }

        if currentWeekDays[todayIndex].state == .freeze {
            currentWeekDays[todayIndex].state = .none
        } else {
            currentWeekDays[todayIndex].state = .freeze
        }
        
        updateStreakAndFreezeCounts()
    }
    
    //why _ date and not date?? becouse when i call it i can immediatly give it a value instead of writing -> date: value ;)
    private func isToday(_ date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: Date())
    }

    private func updateStreakAndFreezeCounts() {
        currentStreak = currentWeekDays.filter { $0.state == .streak }.count
        daysFrozen = currentWeekDays.filter { $0.state == .freeze }.count
    }
}
