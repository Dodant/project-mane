//
//  Today.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct TodayView: View {
	@State private var showingSheet = false
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				HStack {
					VStack(alignment: .leading) {
						
						Text(todayFormatter())
							.foregroundColor(.gray)
							.bold()
							.font(Font.footnote)
						
						Text("Today")
							.font(Font.largeTitle).bold()
					}
					
					Spacer()
					
					Button(action: { self.showingSheet.toggle() }) {
						Image(systemName: "person.crop.circle")
							.resizable()
							.frame(width: 40, height: 40, alignment: .trailing)
					}
					.accentColor(.sky)
					.sheet(isPresented: $showingSheet,
						   onDismiss: { print("Dismissed")},
						   content: { ProfileView() })
				}
				.padding([.leading, .trailing, .top])
				
				HighlightView(category: "NEW PACK FROM",
							  title: "Adventure Time",
							  message:"The fun will never end\t\t\t\t\t\t\nit's Adventure Time.",
							  imageName: "time")
				HighlightView(category: "NEW PACK FROM",
							  title: "Pinkfong",
							  message:"                                                                           ",
							  imageName: "fong")
				HighlightView(category: "WELCOME",
							  title: "Riot Games",
							  message:"                                                                            ",
							  imageName: "leagues")
				HighlightView(category: "WELCOME",
							  title: "Adult Swim",
							  message:"                                                                           ",
							  imageName: "rick")
			}
		}
	}
	
//	func loadProfile(){ }

	func todayFormatter() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE, MMMM dd"
		return formatter.string(from: Date())
	}
	
	struct HighlightView: View {
		var category: String
		var title: String
		var message: String
		var imageName: String
		
		var body: some View {
			VStack {
				ZStack {
					Image(imageName)
						.resizable()
						.scaledToFill()
					
					LinearGradient(gradient: Gradient(
						colors: [.clear, Color.black.opacity(0.15)]),
								   startPoint: .top, endPoint: .bottom)
					
					VStack(alignment: .leading){
						Text(category).foregroundColor(Color.white.opacity(0.5)).bold()
						Text(title).foregroundColor(.white).font(Font.title).bold()
						Spacer()
						Text(message).font(.callout).fontWeight(.semibold).foregroundColor(Color.white)
					}
					.padding()
					
				}.frame(width:350, height: 490)
			}
			.cornerRadius(30)
			.padding()
			.shadow(radius: 10)
			.frame(height: 500, alignment: .leading)
		}
	}
}

struct TodayView_Previews: PreviewProvider {
	static var previews: some View {
		TodayView()
	}
}

