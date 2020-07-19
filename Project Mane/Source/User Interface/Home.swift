//
//  ContentView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/17.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct Home: View {

	let store: Store
	
	var body: some View {
		NavigationView {
			List {
				ForEach (store.stickerPacks) { stickerPack in
					HStack {
					  StickerPackRow(stickerPack: stickerPack)
						NavigationLink(destination: StickerPackDetailView(stickerPack: stickerPack)) {
						EmptyView()
					  }.frame(width: 0).hidden()
					}
				}.listRowBackground(Color.background)
			}
			.navigationBarTitle("Today", displayMode: .large)
			.navigationBarItems(trailing: Image(systemName: "person.crop.circle").imageScale(.large))
		}.onAppear {UITableView.appearance().separatorStyle = .none}
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home(store: Store())
	}
}
