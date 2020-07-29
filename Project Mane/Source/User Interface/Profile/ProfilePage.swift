//
//  Profile.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
	@State var notificationsEnabled: Bool = true
	@State var darkModeEnabled: Bool = false
	@State var userName: String = ""
	@State var selectedDate = Date()
	
	@State private var genderIndex = 0
	var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]
	
	@State private var modeIndex = 0
	var modeOptions = ["Automatic", "Light", "Dark"]

	
	var body: some View {
		NavigationView {
			VStack {
				Form {
					profileSection
					settingSection
					helpSection
					aboutSection
					deleteSection
				}
			}.navigationBarTitle("My Account")
		}
	}
	
	var profileSection: some View {
		Section(header: Text("PROFILE").fontWeight(.medium)) {
			TextField("Username", text: $userName)
			Picker(selection: $genderIndex, label: Text("Gender")) {
				ForEach(0 ..< genderOptions.count) {
					Text(self.genderOptions[$0])
				}
			}
			DatePicker("Date of Birth", selection: $selectedDate, displayedComponents: .date)
			Text("Email")
		}
	}
	
	var settingSection: some View {
		Section(header: Text("APP SETTINGS").fontWeight(.medium)) {
			Text("Accessibility")
			Text("Language & Region")
			Text("Themes")
			Text("App Icon")
			Picker(selection: $modeIndex, label: Text("Dark Mode")) {
				ForEach(0 ..< modeOptions.count) {
					Text(self.modeOptions[$0])
				}
			}
			Toggle(isOn: $notificationsEnabled) {
				Text("Enable Notifications")
			}
		}
	}
	
	var helpSection: some View {
		Section(header: Text("HELP").fontWeight(.medium)) {
			Text("User Support")
			Text("FAQ")
			Text("Rate Us")
			Text("Send Feedback")
		}
	}
	
	var aboutSection: some View {
		Section(header: Text("ABOUT").fontWeight(.medium)) {
			HStack {
				Text("App Version")
				Spacer()
				Text("1.0").foregroundColor(.secondaryText)
			}
			Text("Terms of Service")
			Text("Privacy Policy")
		}
	}
	
	var deleteSection: some View {
		Section {
			Text("DELETE ACCOUNT").foregroundColor(.red)
			
		}
	}
}

struct ProfileView_Previews: PreviewProvider {
	static var previews: some View {
		ProfileView()
	}
}
