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
	
	var body: some View {
		NavigationView {
			ScrollView {
				ForEach (store.stickerPacks) { stickerPack in
					HStack {
						NavigationLink(destination: StickerPackDetailView(stickerPack: stickerPack)) {
							StickerPackRow(stickerPack: stickerPack)
						}
					}
				}.navigationBarTitle("For You", displayMode: .automatic)
			}
		}
	}
}

struct ForYouView_Previews: PreviewProvider {
	static var previews: some View {
		Preview(source: ForYouView())
			.environmentObject(Store())
	}
}
