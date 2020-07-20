//
//  Today.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct TodayView: View {
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
					
					Button(action: self.loadProfile, label: {
						Image(systemName: "person.crop.circle")
							.resizable()
							.frame(width: 40, height: 40, alignment: .trailing)
					}).accentColor(.blue)
				}
				.padding([.leading, .trailing, .top])
				

				
				HighlightView(category: "WELCOME",
							  title: "Adult Swim",
							  message:"                                                                  ",
							  imageName: "rick")
					.frame(height: 500, alignment: .leading)
				
				
				HighlightView(category: "WELCOME",
							  title: "Riot Games",
							  message:"                                                                  ",
							  imageName: "leagues")
					.frame(height: 500, alignment: .leading)
				
				HighlightView(category: "NEW PACK FROM",
							  title: "Pinkfong",
							  message:"                                                                  ",
							  imageName: "fong")
					.frame(height: 500, alignment: .leading)
			}
		}
		
	}
	
	func loadProfile(){
		
	}
	
	func todayFormatter() -> String {
		let date = Date()
		let formatter = DateFormatter()
		formatter.dateFormat = "EEEE, MMMM dd"
		return formatter.string(from: date)
	}
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
					colors: [.clear, Color.black.opacity(0.2)]),
							   startPoint: .top, endPoint: .bottom)
				
				VStack(alignment: .leading){
					Text(category).foregroundColor(Color.white.opacity(0.5)).bold()
					Text(title).foregroundColor(.white).font(Font.title).bold()
					Spacer()
					Text(message).foregroundColor(.white)
				}
				.padding()
				
			}.frame(width:350, height: 490)
		}
		.cornerRadius(30)
		.padding()
		.shadow(radius: 10)
	}
	
}

struct TodayView_Previews: PreviewProvider {
	static var previews: some View {
		TodayView()
	}
}
