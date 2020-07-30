//
//  Profile.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
	@State private var pickedImage: Image = Image(systemName: "person.crop.circle")
	@State private var nickname: String = ""
	@State private var isPickerPresented: Bool = false
	
	@State var notificationsEnabled: Bool = true
	@State var darkModeEnabled: Bool = false
	@State var selectedDate = Date()
	
	@State private var genderIndex = 0
	var genderOptions = ["🙍‍♂️ Male", "🙍‍♀️ Female", "🤖 Other"]
	
	@State private var modeIndex = 0
	var modeOptions = ["Automatic", "Light", "Dark"]
	
	
	var body: some View {
		NavigationView {
			VStack {
				userInfo
				
				Form {
					profileSection
					settingSection
					helpSection
					aboutSection
					deleteSection
				}
			}.navigationBarTitle("My Account")
		}
		.sheet(isPresented: $isPickerPresented) {
			ImagePickerView(pickedImage: self.$pickedImage)
		}
	}
	
	var userInfo: some View {
		VStack {
			profileImage
			nicknameTextField
		}
		.frame(maxWidth: .infinity, minHeight: 200)
		.background(Color.background)
	}
	
	var profileImage: some View {
		pickedImage
			.resizable().scaledToFill()
			.clipShape(Circle())
			.frame(width: 100, height: 100)
			.overlay(pickImageButton.offset(x:4, y:0), alignment: .bottomTrailing)
	}
	
	var pickImageButton: some View {
		Button(action: {
			self.isPickerPresented = true
		}) {
			Circle()
				.fill(Color.white)
				.frame(width: 32, height: 32)
				.shadow(color: .primaryShadow, radius: 2, x: 2, y: 2)
				.overlay(Image(systemName: "photo").foregroundColor(.black))
		}
	}
	
	var nicknameTextField: some View {
		TextField("Nickname", text: $nickname)
			.font(.system(size:25, weight: .medium))
			.textContentType(.nickname)
			.multilineTextAlignment(.center)
			.autocapitalization(.none)
	}
	
	var profileSection: some View {
		Section(header: Text("PROFILE").fontWeight(.medium)) {
//			TextField("Username", text: $userName)
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
