<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>

<h1>📚 Learning Goal Tracker App</h1>
<p>Welcome to the <strong>Learning Goal Tracker App</strong>, a tool designed to help you set learning goals, track your daily progress, and keep your streak going with flexible options to freeze without losing motivation. Let's start your learning journey!</p>

<h2>🚀 Project Overview</h2>
<p>This app is divided into three main tasks:</p>

<h3>📝 Task 1: Start Learning</h3>
<ul>
<li><strong>Onboarding</strong>: A friendly introduction to help you set up your learning goal and desired duration.</li>
<li><strong>Set Learning Goal and Duration</strong>: Choose a subject and define the timeframe to achieve it.</li>
</ul>

<h3>📅 Task 2: Log a Day as Learned or Freezed</h3>
<ul>
<li><strong>Learned Today</strong>:
<ul>
<li>Mark a day as successfully learned and increase your streak count.</li>
<li>The calendar will show an orange circle for streak days.</li>
</ul>
</li>
<li><strong>Freeze Day</strong>:
<ul>
<li>Mark a day as freezed to protect your streak.</li>
<li>The calendar will show a blue circle for freeze days.</li>
</ul>
</li>
</ul>

<h3>✏️ Task 3: Change Learning Goal or Duration</h3>
<ul>
<li><strong>Update Learning Goal</strong>:
<ul>
<li>Change your learning goal to reflect new aspirations.</li>
<li>The main screen will update with the new goal title.</li>
</ul>
</li>
<li><strong>Update Duration</strong>:
<ul>
<li>Adjust your duration to increase or decrease freeze allowances.</li>
</ul>
</li>
</ul>

<h2>✨ Features</h2>
<ul>
<li><strong>Flexible Goal Setting</strong>: Quick onboarding to set learning goals and desired timeframes.</li>
<li><strong>Daily Progress Tracking</strong>: Log each day as learned or freezed, with visual cues in the calendar.</li>
<li><strong>Freeze Day Flexibility</strong>:
<ul>
<li>Prevent losing your streak with a freeze day, allowing a specific number of freezes based on your duration choice:</li>
<ul>
<li><strong>Weekly</strong>: 2 freezes</li>
<li><strong>Monthly</strong>: 6 freezes</li>
<li><strong>Yearly</strong>: 60 freezes</li>
</ul>
</ul>
</li>
<li><strong>Automatic Streak Reset</strong>: Streaks reset under the following conditions:
<ul>
<li>If more than 32 hours pass without logging a day as learned or freezed.</li>
<li>After updating both the learning goal and duration.</li>
<li>At the end of the selected duration (unless you choose to continue).</li>
</ul>
</li>
</ul>

<h2>🛠️ Setup & Installation</h2>
<ol>
<li><strong>Clone the repository:</strong>
<pre><code>git clone https://github.com/asma-mo/learningJourneyApp.git</code></pre>
</li>
<li><strong>Open the project in Xcode:</strong>
<pre><code>cd learning-goal-tracker
open LearningGoalTracker.xcodeproj</code></pre>
</li>
<li><strong>Build and run the project:</strong>
<ul>
<li>Select an appropriate simulator or connected device in Xcode.</li>
<li>Press <kbd>Cmd</kbd> + <kbd>R</kbd> or click the <strong>Run</strong> button.</li>
</ul>
</li>
</ol>

<h2>🧑‍💻 Technology Stack</h2>
<ul>
<li><strong>Frontend:</strong> SwiftUI</li>
<li><strong>State Management:</strong> @EnvironmentObject, MVVM Pattern</li>
<li><strong>Backend:</strong> No backend</li>
</ul>

<h2>🎨 Visual Workflow</h2>
<p><img src="https://i.ibb.co/mqYnSjW/Screenshot-2024-11-04-at-2-15-48-PM.png" alt="Project Workflow"></p>
<p>The above flowchart shows the user journey from onboarding to tracking progress and updating goals.</p>

<h2>📸 App Screenshots</h2>
<p>Below are some screenshots of the Learning Goal Tracker App:</p>

<p float="left" align="center">
<img src="https://i.ibb.co/1LHcyTw/Screenshot-2024-11-04-at-2-21-01-PM.png" width="120" alt="Onboarding Screen" title="Onboarding"/>      
<img src="https://i.ibb.co/WWDRgt5/Screenshot-2024-11-04-at-2-21-13-PM.png" width="120" alt="Current Day - Default" title="Current Day - Default"/>      
<img src="https://i.ibb.co/vQMs13P/Screenshot-2024-11-04-at-2-21-22-PM.png" width="120" alt="Learned Today" title="Learned Today"/>      
<img src="https://i.ibb.co/ssZYVcZ/Screenshot-2024-11-04-at-2-21-30-PM.png" width="120" alt="Day Freezed" title="Day Freezed"/>      
<img src="https://i.ibb.co/XSW077s/Screenshot-2024-11-04-at-2-21-41-PM.png" width="120" alt="Update Learning Goal" title="Update Learning Goal"/>
</p>

<h2>🤝 Contributing</h2>
<ul>
<li>Contributions are welcome! If you have any suggestions, please submit a pull request or open an issue to discuss.</li>
</ul>

<h2>📌 Notes</h2>
<ul>
<li><strong>Freeze days</strong> help users protect their streaks based on their chosen duration.</li>
<li>The freeze count depends on the selected duration:</li>
<ul>
<li><strong>2 freezes</strong> per week</li>
<li><strong>6 freezes</strong> per month</li>
<li><strong>60 freezes</strong> per year</li>
</ul>
<li>Users must log their days consistently to maintain their streaks and avoid resets.</li>
</ul>

</body>
</html>
