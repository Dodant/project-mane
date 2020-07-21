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
				collection
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
			Image(systemName: self.selected != 0
				? "square.grid.2x2"
				: "square.grid.2x2.fill"
			).imageScale(.large)
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
			Image(systemName: self.selected != 1
				? "heart"
				: "heart.fill"
			).imageScale(.large)
			Text("For You")
		}
		.tag(1)
		
	}
	var collection: some View {
		CollectionView()
			.onTapGesture {
				self.selected = 2
		}
		.tabItem {
			Image(systemName: self.selected != 2
				? "tray.full"
				: "tray.full.fill"
			).imageScale(.large)
			Text("Collection")
		}
		.tag(2)
	}
	var search: some View {
		SearchView()
			.onTapGesture {
				self.selected = 3
		}
		.tabItem {
			Image(systemName: self.selected != 3
				? "magnifyingglass.circle"
				: "magnifyingglass.circle.fill"
			).imageScale(.large)
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
