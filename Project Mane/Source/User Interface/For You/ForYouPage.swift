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
							StickerPackRow(stickerPack: stickerPack, quickDownload: self.$quickDownload)
						}
					}
				}
				.navigationBarTitle("For You", displayMode: .automatic)
				.padding()
			}
		}.popupOverContext(item: $quickDownload, content: popupMessage(stickerPack:))
	}
	
	
}

private extension ForYouView {
	func popupMessage(stickerPack: StickerPack) -> some View {
		return VStack{
			Text(stickerPack.name)
				.font(.title).bold()
				.foregroundColor(.sky)
				.padding()
			DownloadCompletedMessage()
		}
	}
}

struct ForYouView_Previews: PreviewProvider {
	static var previews: some View {
		Preview(source: ForYouView()).environmentObject(Store())
	}
}
