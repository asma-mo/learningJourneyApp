import SwiftUI

struct OnboardingView: View {
    @State private var learningSubject: String = ""
    @State private var selectedTimeFrame: String = "Month"
    
    @EnvironmentObject var timeFrameState: TimeFrameState
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    ZStack {
                        Circle()
                            .foregroundColor(Color("DarkBackgroundColor"))
                            .frame(width: 118, height: 118)
                        
                        Text("🔥")
                            .font(.system(size: 50))
                    }
                    .padding(.top, 50)
                    
                    Spacer().frame(height: 48)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Hello Learner!")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        
                        Text("This app will help you learn everyday")
                            .font(.system(size: 18))
                            .foregroundColor(Color("secondaryGrayColor"))
                            .padding(.bottom, 36)
                        
                        
                        Text("I want to learn")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        
                        
                        
                        TextField("Swift", text: $learningSubject, prompt: Text("Swift").foregroundColor(.gray.opacity(0.3)))
                            .foregroundColor(.white)
                            .tint(Color("primaryOrangeColor"))
                            .padding(.vertical, 10)
                            .padding(.leading, 16)
                            .background(Color.gray.opacity(0.3).frame(height: 1), alignment: .bottom)
                        
                        Text("I want to learn it in a")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        
                        
                        HStack {
                            ForEach(TimeFrame.allCases, id: \.self) { timeFrame in
                                Button(action: {
                                    timeFrameState.selectedTimeFrame = timeFrame
                                    //print(timeFrameState.selectedTimeFrame)
                                }) {
                                    Text(timeFrame.rawValue)
                                        .frame(width: 68, height: 37)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(timeFrameState.selectedTimeFrame == timeFrame ? .black : Color("primaryOrangeColor"))
                                        .background(timeFrameState.selectedTimeFrame == timeFrame ? Color("primaryOrangeColor") : Color("DarkBackgroundColor"))
                                        .cornerRadius(8)
                                }}
                        }
                        .padding(.top, 12)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                    
                    
                    Spacer().frame(height: 58)
                    
                    
                    NavigationLink(destination: CurrentDayView()) {
                        HStack {
                            Text("Start")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .foregroundColor(.black)
                        .frame(width: 151, height: 52)
                        .background(Color("primaryOrangeColor"))
                        .cornerRadius(8)
                    }
                    .padding(.bottom, 231)

                }
            }
        }
    }
}

struct TimeFrameButton: View {
    var title: String
    @Binding var selectedTimeFrame: String
    
    var body: some View {
        Button(action: {
            selectedTimeFrame = title
        }) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(selectedTimeFrame == title ? .black : .white)
                .padding()
                .background(selectedTimeFrame == title ? Color.orange : Color.gray)
                .cornerRadius(10)
        }
    }
}

#Preview {
    OnboardingView()
            .environmentObject(TimeFrameState())
}
