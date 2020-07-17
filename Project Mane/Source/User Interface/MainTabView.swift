//
//  ContentView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/17.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
	private enum Tabs {
		case today, forYou, live, search 
	}
	
	var body: some View {
		Text("Hello SwiftUI")
			.font(.largeTitle)
			.background(Color.yellow)
			.padding()
	}
}

struct MainTabView_Previews: PreviewProvider {
	static var previews: some View {
		MainTabView()
	}
}
