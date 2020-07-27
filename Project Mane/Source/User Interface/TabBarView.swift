//
//  TabBarView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/20.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
	private enum Tabs {
		case today, foryou, collection, search
	}
	
	@State private var selectedTab: Tabs = .today
	
	var body: some View {
		TabView(selection: $selectedTab){
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
			.tag(Tabs.today)
			.tabItem(image: self.selectedTab != Tabs.today
				? "square.grid.2x2"
				: "square.grid.2x2.fill", text: "Today")
			.onTapGesture { self.selectedTab = Tabs.today }
	}
	var foryou: some View {
		ForYouView()
			.tag(Tabs.foryou)
			.environmentObject(Store())
			.tabItem(image: self.selectedTab != Tabs.foryou
				? "heart"
				: "heart.fill", text: "For You")
			.onTapGesture { self.selectedTab = Tabs.foryou }
	}
	var collection: some View {
		CollectionView()
			.tag(Tabs.collection)
			.tabItem(image: self.selectedTab != Tabs.collection
				? "tray.full"
				: "tray.full.fill", text: "Collection")
			.onTapGesture { self.selectedTab = Tabs.collection }
	}
	var search: some View {
		SearchView()
			.tag(Tabs.search)
			.tabItem(image: self.selectedTab != Tabs.search
				? "magnifyingglass.circle"
				: "magnifyingglass.circle.fill", text: "Search")
			.onTapGesture { self.selectedTab = Tabs.search }
	}
}

fileprivate extension View {
	func tabItem(image: String, text: String) -> some View {
		self.tabItem {
			Image(systemName: image)
				.imageScale(.large)
				.font(Font.system(size: 17, weight: .light))
			Text(text)
		}
	}
}

struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView().environmentObject(Store())
	}
}
