import SwiftUI

struct currentDayView: View {
    
    @EnvironmentObject var globalObject: OnboardingViewModel
    @StateObject private var viewModel = CurrentDayViewModel()
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text(Date()
                    .formatted(.dateTime.weekday(.wide).day(.twoDigits).month(.abbreviated)))
                .foregroundColor(Color("secondaryGrayColor"))
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                HStack {
                    
                    Text("Learning \(globalObject.learningGoal)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 8)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color("DarkBackgroundColor"))
                            .frame(width: 44, height: 44)
                        Text("🔥")
                            .font(.system(size: 24))
                    }
                }.padding(.bottom, 25)
                
                //Calender
                VStack {
                    
                    HStack{
                        Text(Date().formatted(.dateTime.month(.wide).year()))
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                        Button(action: {}) {
                            Image(systemName: "chevron.right")
                            
                        }.font(.system(size: 13, weight: .bold))
                        
                        Spacer()
                        HStack(spacing: 16) {
                            Button(action: {
                                viewModel.previousWeek()
                            }) {
                                Image(systemName: "chevron.left")
                                
                            }
                            Button(action: {
                                viewModel.nextWeek()
                            }) {
                                Image(systemName: "chevron.right")
                            }
                        }.font(.system(size: 20, weight: .medium))
                        
                    }.padding(.bottom, 11)
                    .foregroundColor(Color("primaryOrangeColor"))
                    
                    
                    HStack{
                        
                        ForEach(0..<viewModel.daysOfWeek.count, id: \.self) { index in
                            let day = viewModel.currentWeekDays[index]
                            let isToday = Calendar.current.isDate(day.date, inSameDayAs: Date())
                            
                            VStack(spacing: 8) {
                                
                                
                                Text(viewModel.daysOfWeek[index])
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(isToday ? .white: Color("secondaryGrayColor"))
                                
                                
                                ZStack {

                                    Circle()
                                        .fill(viewModel.backgroundColor(for: day))
                                        .frame(width: 36, height: 36)
                                    
                                    Text("\(Calendar.current.component(.day, from: day.date))")
                                        .font(.system(size: 16, weight: isToday ? .bold : .regular))
                                        .foregroundColor(viewModel.textColor(for: day))
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
                                Text("\(viewModel.currentStreak)🔥")
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
                                Text("\(viewModel.daysFrozen)🧊")
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
                let today = viewModel.today
                
                Button(action: {
                    if let today = viewModel.currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: Date()) }) {
                           viewModel.toggleStreak()
                    }
                }) {
                    
                    Text(viewModel.logText(for: today))
                            .font(.system(size: 41, weight: .semibold))
                            .padding(.horizontal, 58)
                            .frame(width: 320, height: 320)
                            .background(viewModel.buttonBackgroundColor(day: today))
                            .foregroundColor(viewModel.buttonTextColor(day: today))
                            .clipShape(Circle())
                  }.padding(.vertical, 28)

                
                Button(action: {
                    if let today = viewModel.currentWeekDays.first(where: { Calendar.current.isDate($0.date, inSameDayAs: Date()) }) {
                        viewModel.toggleFreeze()
                    }
                }) {
                    Text("Freeze day")
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                        .frame(width: 162, height: 52)
                        .background(viewModel.buttonBackgroundColor(day: today, isFreezeButton: true))
                        .foregroundColor(viewModel.buttonTextColor(day: today, isFreezeButton: true))
                        .cornerRadius(8)
                }

                
                Text("\(viewModel.countFreezedDays()) out of \(globalObject.selectedTimeFrame.maxFreezes) freezes used")
                    .font(.system(size: 14))
                    .foregroundColor(Color("secondaryGrayColor"))
                    
                
                }.padding( 16)
                
                
            }.navigationBarHidden(true)
//                .onAppear{
//                    let date = currentWeekDates()
//                    date.forEach { x in
//                        print(x,"🩷")
//                    }
            
            
        
    }
        
}

#Preview {
    currentDayView()
        .environmentObject(OnboardingViewModel())
}
