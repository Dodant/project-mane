//
//  TabBarView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/20.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
	@State var selected: Int = 0
	
	var body: some View {
		TabView(selection: $selected ){
			TodayView().tabItem {
				Image(systemName: "doc.plaintext").imageScale(.large)
				Text("Today")
			}
			ForYouView(store: Store()).tabItem {
				Image(systemName: "heart").imageScale(.large)
				Text("For You")
			}
			LiveView().tabItem {
				Image(systemName: "dot.radiowaves.left.and.right").imageScale(.large)
				Text("Live")
			}
			SearchView().tabItem {
				Image(systemName: "magnifyingglass").imageScale(.large)
				Text("Search")
			}
		}
	}
}


struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView()
	}
}
