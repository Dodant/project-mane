//
//  TabBarView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/20.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
	@State private var selected = 0
	
	var body: some View {
		TabView(selection: $selected){
			Group {
				today
				foryou
				live
				search
			}
			.accentColor(.primary)
		}
		.accentColor(.sky)
	}
}

private extension TabBarView {
	var today: some View {
		TodayView()
			.onTapGesture {
				self.selected = 0
		}
		.tabItem {
			Image(systemName: "doc.plaintext").imageScale(.large)
			Text("Today")
		}
		.tag(0)
	}
	var foryou: some View {
		ForYouView()
			.environmentObject(Store())
			.onTapGesture {
				self.selected = 1
		}
		.tabItem {
			Image(systemName: "heart").imageScale(.large)
			Text("For You")
		}
		.tag(1)
		
	}
	var live: some View {
		LiveView()
			.onTapGesture {
				self.selected = 2
		}
		.tabItem {
			Image(systemName: "dot.radiowaves.left.and.right").imageScale(.large)
			Text("Live")
		}
		.tag(2)
	}
	var search: some View {
		SearchView()
			.onTapGesture {
				self.selected = 3
		}
		.tabItem {
			Image(systemName: "magnifyingglass").imageScale(.large)
			Text("Search")
		}
		.tag(3)
	}
}

struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView()
	}
}
