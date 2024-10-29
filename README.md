📚 Learning Goal Tracker App
Welcome to the Learning Goal Tracker App, a tool designed to help you set learning goals, track your daily progress, and keep your streak going with flexible options to freeze without losing motivation. Let's start your learning journey!

🚀 Project Overview
This app is divided into three main tasks:

📝 Task 1: Start Learning
Onboarding: A friendly introduction to help you set up your learning goal and desired duration.
Set Learning Goal and Duration: Choose a subject and define the timeframe to achieve it.
📅 Task 2: Log a Day as Learned or Freezed
Learned Today: Mark a day as successfully learned and increase your streak count. The calendar will show an orange circle for streak days.
Freeze Day: Mark a day as freezed to protect your streak. The calendar will show a blue circle for freeze days.
✏️ Task 3: Change Learning Goal or Duration
Update Learning Goal: Change your learning goal to reflect new aspirations. The main screen will update with the new goal title.
Update Duration: Adjust your duration to increase or decrease freeze allowances.
✨ Features
Flexible Goal Setting: Quick onboarding to set learning goals and desired timeframes.
Daily Progress Tracking: Log each day as learned or freezed, with visual cues in the calendar.
Freeze Day Flexibility: Prevent losing your streak with a freeze day, allowing a specific number of freezes based on your duration choice:
Weekly: 2 freezes
Monthly: 6 freezes
Yearly: 60 freezes
Automatic Streak Reset: Streaks reset under the following conditions:
If more than 32 hours pass without logging a day as learned or freezed.
After updating both the learning goal and duration.
At the end of the selected duration (unless you choose to continue).
🛠️ Setup & Installation
Clone the repository:
bash
Copy code
git clone https://github.com/learningJourneyApp/learning-goal-tracker.git
Open the project in Xcode:
bash
Copy code
cd learning-goal-tracker
open LearningGoalTracker.xcodeproj
Build and run the project:
Select an appropriate simulator or connected device in Xcode.
Press Cmd + R or click the Run button.
🧑‍💻 Technology Stack
Frontend: SwiftUI
State Management: @EnvironmentObject, MVVM Pattern
Backend: No backend required
🎨 Visual Workflow

The above flowchart shows the user journey from onboarding to tracking progress and updating goals.

🤝 Contributing
Contributions are welcome! If you have any suggestions, please submit a pull request or open an issue to discuss.


📌 Notes
Freeze days help users protect their streaks based on their chosen duration.
The freeze count depends on the selected duration: 2 freezes/week, 6 freezes/month, or 60 freezes/year.
Users must log their days consistently to maintain their streaks and avoid resets.
