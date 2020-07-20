//
//  FavoriteButton.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/20.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
	@EnvironmentObject private var store: Store
	let stickerPack : StickerPack
	
	private var imageName: String {
		stickerPack.isFavorite ? "heart.fill" : "heart"
	}
	
	var body: some View {
		Button(action: {
			self.store.toggleFavorite(of: self.stickerPack)
		}) {
			Image(systemName: imageName)
				.imageScale(.large)
				.foregroundColor(.sky)
				.frame(width: 35, height: 35)
				.onTapGesture { self.store.toggleFavorite(of: self.stickerPack) }
		}
	}
}
