import SwiftUI


struct UpdateLearningGoalView: View {
    
    @State private var learningSubject: String = ""
    @EnvironmentObject var UpdateLearningGoalVM: UpdateLearningGoalViewModel
    @EnvironmentObject var OnboardingVM: OnboardingViewModel
    @EnvironmentObject var CurrentDayVM: CurrentDayViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("I want to learn")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                TextField("Swift", text: self.$learningSubject, prompt: Text("Swift").foregroundColor(.gray.opacity(0.3)))
                    .foregroundColor(.white)
                    .tint(Color("primaryOrangeColor"))
                    .padding(.vertical, 10)
                    .padding(.leading, 16)
                    .background(Color.gray.opacity(0.3).frame(height: 1), alignment: .bottom)
                
                Text("I want to learn it in a")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.top, 12)
                
                HStack {
                    ForEach(TimeFrame.allCases, id: \.self) { timeFrame in
                        Button(action: {
                            UpdateLearningGoalVM.newTimeFrame = timeFrame
                        }) {
                            Text(timeFrame.rawValue)
                                .frame(width: 68, height: 37)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(UpdateLearningGoalVM.newTimeFrame == timeFrame ? .black : Color("primaryOrangeColor"))
                                .background(UpdateLearningGoalVM.newTimeFrame == timeFrame ? Color("primaryOrangeColor") : Color("DarkBackgroundColor"))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.top, 12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 36)
            .padding(.leading, 24)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Learning goal")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.white)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CurrentDayView()) {
                    Text("Update")
                        .foregroundColor(Color("primaryOrangeColor"))
                        .font(.system(size: 17, weight: .semibold))
                }
                .simultaneousGesture(TapGesture().onEnded {
                    UpdateLearningGoalVM.learningSubject = self.learningSubject
                    UpdateLearningGoalVM.updateLearningGoal()
                })
            }
        }
        .onAppear {
            UpdateLearningGoalVM.initialize(onboardingVM: OnboardingVM, currentDayVM: CurrentDayVM)
        }
    }
}

#Preview {
    UpdateLearningGoalView()
}
