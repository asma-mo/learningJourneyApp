import SwiftUI

struct CurrentDayView: View {
    
    @EnvironmentObject var OnboardingVM: OnboardingViewModel
    //@StateObject private var viewModel = CurrentDayViewModel()
    
    @EnvironmentObject var CurrentDayVM: CurrentDayViewModel
    //@StateObject var CurrentDayVM =  CurrentDayViewModel()
    
//    var lastDayTest = currentWeekDays.first(where: { Calendar.current.component(.weekday, from: $0.date) == 7 }) ?? currentWeekDays[6]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text(CurrentDayVM.effectiveDate()
                        .formatted(.dateTime.weekday(.wide).day(.twoDigits).month(.abbreviated)))
                    .foregroundColor(Color("secondaryGrayColor"))
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    HStack {
                        
                        Text("Learning \(OnboardingVM.learningGoal)")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        Spacer()
                        
                        NavigationLink(destination: UpdateLearningGoalView()) {
                            ZStack {
                                
                                Circle()
                                    .fill(Color("DarkBackgroundColor"))
                                    .frame(width: 44, height: 44)
                                Text("🔥")
                                    .font(.system(size: 24))
                            }
                        }
                    }.padding(.bottom, 25)
                    //Calender
                    VStack {
                        
                        HStack{
                            Text(CurrentDayVM.effectiveDate().formatted(.dateTime.month(.wide).year()))
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                            Button(action: {}) {
                                Image(systemName: "chevron.right")
                                
                            }.font(.system(size: 13, weight: .bold))
                            
                            Spacer()
                            HStack(spacing: 16) {
                                Button(action: {
                                    CurrentDayVM.previousWeek()
                                }) {
                                    Image(systemName: "chevron.left")
                                    
                                }
                                Button(action: {
                                    CurrentDayVM.nextWeek()
                                }) {
                                    Image(systemName: "chevron.right")
                                }
                            }.font(.system(size: 20, weight: .medium))
                            
                        }.padding(.bottom, 11)
                            .foregroundColor(Color("primaryOrangeColor"))
                        
                        
                        HStack{
                            
                            ForEach(0..<CurrentDayVM.daysOfWeek.count, id: \.self) { index in
                                let day = CurrentDayVM.currentWeekDays[index]
                                let isToday = Calendar.current.isDate(day.date, inSameDayAs: CurrentDayVM.effectiveDate())
                                
                                VStack(spacing: 8) {
                                    
                                    
                                    Text(CurrentDayVM.daysOfWeek[index])
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(isToday ? .white: Color("secondaryGrayColor"))
                                    
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .fill(CurrentDayVM.backgroundColor(for: day))
                                            .frame(width: 36, height: 36)
                                        
                                        Text("\(Calendar.current.component(.day, from: day.date))")
                                            .font(.system(size: 16, weight: isToday ? .bold : .regular))
                                            .foregroundColor(CurrentDayVM.textColor(for: day))
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            
                        }//.padding(.horizontal, 20)
                        
                        Divider()
                            .frame(width: 345, height: 1)
                            .background(Color("secondaryGrayColor"))
                        
                        HStack(spacing: 32) {
                            VStack {
                                HStack(spacing: 4) {
                                    Text("\(CurrentDayVM.currentStreak)🔥")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                                Text("Day streak")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color("secondaryGrayColor"))
                            }
                            
                            Divider()
                                .frame(width: 1, height: 70)
                                .background(Color("secondaryGrayColor"))
                            
                            VStack {
                                HStack(spacing: 4) {
                                    Text("\(CurrentDayVM.daysFrozen)🧊")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                }
                                Text("Day freezed")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(Color("secondaryGrayColor"))
                            }
                        }
                        
                        
                        
                    }.padding(11)
                        .frame(width: 367, height: 208)
                        .background(
                            RoundedRectangle(cornerRadius: 13)
                            //.fill(Color("secondaryGrayColor"))
                                .stroke(Color("secondaryGrayColor")))
                    
                    //dummy data
                    let today = CurrentDayVM.today
                    
                    Button(action: {
                        if let today = CurrentDayVM.currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: CurrentDayVM.effectiveDate()) })
                            {
                            
                            CurrentDayVM.toggleStreak()
                            
                            }
                        if CurrentDayVM.currentStreak == OnboardingVM.selectedTimeFrame.maxStreaks {
                            CurrentDayVM.test.toggle()
                        }
                        
                        
                    }) {
                        
                        Text(CurrentDayVM.logText(for: today))
                            .font(.system(size: 41, weight: .semibold))
                            .padding(.horizontal, 58)
                            .frame(width: 320, height: 320)
                            .background(CurrentDayVM.buttonBackgroundColor(day: today))
                            .foregroundColor(CurrentDayVM.buttonTextColor(day: today))
                            .clipShape(Circle())
                    }.padding(.vertical, 28)
                    
                    
                    Button(action: {
                        if let today = CurrentDayVM.currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: CurrentDayVM.effectiveDate()) })
 {
                            CurrentDayVM.toggleFreeze()
                            
                            if CurrentDayVM.daysFrozen == OnboardingVM.selectedTimeFrame.maxFreezes {
                                print(CurrentDayVM.daysFrozen == OnboardingVM.selectedTimeFrame.maxFreezes)
                                CurrentDayVM.test.toggle()
                            }
                        }
                    }) {
                        Text("Freeze day")
                            .font(.system(size: 16, weight: .semibold))
                            .padding()
                            .frame(width: 162, height: 52)
                            .background(CurrentDayVM.buttonBackgroundColor(day: today, isFreezeButton: true))
                            .foregroundColor(CurrentDayVM.buttonTextColor(day: today, isFreezeButton: true))
                            .cornerRadius(8)
                    }
                    
                    
                    Text("\(CurrentDayVM.countFreezedDays()) out of \(OnboardingVM.selectedTimeFrame.maxFreezes) freezes used")
                        .font(.system(size: 14))
                        .foregroundColor(Color("secondaryGrayColor"))
                    
                    
                }.padding( 16)
                
                
            }.onAppear {
               
                CurrentDayVM.updateCurrentWeekDays()
            }
            //                .onAppear{
            //                    let date = currentWeekDates()
            //                    date.forEach { x in
            //                        print(x,"🩷")
            //                    }
            
            
        }.navigationBarHidden(true)
            .tint(Color("primaryOrangeColor"))
    }
        
}

#Preview {
    CurrentDayView()
        .environmentObject(OnboardingViewModel())
}
