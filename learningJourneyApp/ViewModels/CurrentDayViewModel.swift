import SwiftUI

class CurrentDayViewModel: ObservableObject {
    
    @Published var currentWeekDays: [Day] = []
    @Published var currentStreak: Int = 0
    @Published var daysFrozen: Int = 0
    @Published var daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @Published var weekOffset: Int = 0
    
    @Published var testDate: Date? = nil //Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday: 7), matchingPolicy: .nextTime)
    
    @Published var test: Bool  = true {
        didSet {
            
            updateCurrentWeekDays()
        }
    }
    
    func effectiveDate() -> Date {
        return testDate ?? Date()
    }

    
    private var calendar = Calendar.current

    
    
    init() {
        updateCurrentWeekDays()
    }
    
    //for testing!!
    var today: Day {
        currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: effectiveDate()) }) ?? currentWeekDays[0]
    }
    
    func previousWeek() {
        weekOffset -= 1
        updateCurrentWeekDays()
    }
    
    func nextWeek() {
        weekOffset += 1
        updateCurrentWeekDays()
    }
    
    func updateCurrentWeekDays() {
        
        
        let currentDate = Calendar.current.date(byAdding: .weekOfYear, value: weekOffset, to: effectiveDate()) ?? Date()
        
       
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: currentDate)?.start else {
            return
        }

        currentWeekDays = (0..<7).compactMap { day in
            guard let date = calendar.date(byAdding: .day, value: day, to: startOfWeek) else { return nil }
            
            if test && weekOffset == 0{
                
                // Dummy Data
                let dayOfWeek = calendar.component(.weekday, from: date) - 1
            
                //Streak Full Test
//                if (0...5).contains(dayOfWeek){
//                    return Day(date: date, state: .streak)
                
                if dayOfWeek == 1 {
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
            let isToday = calendar.isDate(day.date, inSameDayAs: effectiveDate())
            
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
            let isToday = calendar.isDate(day.date, inSameDayAs: effectiveDate())
            
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
            let isToday = calendar.isDate(day.date, inSameDayAs: effectiveDate())
            
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
    
    // MARK: - Wokflow's condition checker
    
    

    
    
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
        return Calendar.current.isDate(date, inSameDayAs: effectiveDate())
    }


    private func updateStreakAndFreezeCounts() {
        currentStreak = currentWeekDays.filter { $0.state == .streak }.count
        daysFrozen = currentWeekDays.filter { $0.state == .freeze }.count
    }
}
