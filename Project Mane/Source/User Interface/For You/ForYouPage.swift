//
//  ForYou.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct ForYouView: View {
	let store: Store
	
	var body: some View {
		//		NavigationView {
		//			List {
		//				ForEach (store.stickerPacks) { stickerPack in
		//					HStack {
		//						StickerPackRow(stickerPack: stickerPack)
		//						NavigationLink(destination: StickerPackDetailView(stickerPack: stickerPack)) {
		//							EmptyView()
		//						}.frame(width: 0).hidden()
		//					}
		//				}
		//			}
		//			.navigationBarTitle("For You", displayMode: .large)
		//		}.onAppear {UITableView.appearance().separatorStyle = .none}
		
		ScrollView {
			VStack(alignment: .leading) {
				HStack {
					VStack(alignment: .leading) {
						Text("For You")
							.font(Font.largeTitle).bold()
					}
					Spacer()
				}
				.padding([.leading, .trailing, .top])
				
				ForEach (store.stickerPacks) { stickerPack in
					HStack {
						StickerPackRow(stickerPack: stickerPack)
						NavigationLink(destination: StickerPackDetailView(stickerPack: stickerPack)) {
							EmptyView()
						}.frame(width: 0).hidden()
					}
				}
			}
		}
	}
}

struct ForYouView_Previews: PreviewProvider {
	static var previews: some View {
		ForYouView(store: Store())
	}
}
