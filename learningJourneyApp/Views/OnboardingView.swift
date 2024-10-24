import SwiftUI

struct OnboardingView: View {
    
    //@EnvironmentObject var globalObject: OnboardingViewModel
    
    @State private var learningSubject: String = ""
    @EnvironmentObject  var viewModel: OnboardingViewModel

//    For test to be deleted!!!
    //@StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    ZStack {
                        Circle()
                            .fill(Color("DarkBackgroundColor"))
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
                                    viewModel.selectedTimeFrame = timeFrame
                                    //print(timeFrameState.selectedTimeFrame)
                                }) {
                                    Text(timeFrame.rawValue)
                                        .frame(width: 68, height: 37)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(viewModel.selectedTimeFrame == timeFrame ? .black : Color("primaryOrangeColor"))
                                        .background(viewModel.selectedTimeFrame == timeFrame ? Color("primaryOrangeColor") : Color("DarkBackgroundColor"))
                                        .cornerRadius(8)
                                }}
                        }
                        .padding(.top, 12)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                    
                    
                    Spacer().frame(height: 58)
                    
                    
                    NavigationLink(destination: currentDayView()) {
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
                    } .simultaneousGesture(TapGesture().onEnded {
                        viewModel.learningGoal = learningSubject
                        //print(globalObject.learningGoal)
                    })
                    .padding(.bottom, 231)

                }
            }
        }
    }
}


#Preview {
    OnboardingView()
}
