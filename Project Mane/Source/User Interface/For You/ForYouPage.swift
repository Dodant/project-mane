//
//  ForYou.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct ForYouView: View {
	@EnvironmentObject private var store: Store
	@State private var quickDownload: StickerPack?
	
	var body: some View {
		NavigationView {
			ScrollView {
				ForEach (store.stickerPacks) { stickerPack in
					HStack {
						NavigationLink(destination: StickerPackDetailView(stickerPack: stickerPack)) {
							StickerPackRow(quickDownload: self.$quickDownload, stickerPack: stickerPack)
						}
					}
				}.navigationBarTitle("For You", displayMode: .automatic)
			}
		}.popup(item: $quickDownload, content: popupMessage(stickerPack:))
	}
	
	func popupMessage(stickerPack: StickerPack) -> some View {
		let name = stickerPack.name
		return VStack{
			Text(name)
				.font(.title).bold()
				.foregroundColor(.sky)
				.padding()
			DownloadCompletedMessage()
		}
	}
}

struct ForYouView_Previews: PreviewProvider {
	static var previews: some View {
		Preview(source: ForYouView())
			.environmentObject(Store())
	}
}
