//
//  Store.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/19.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

final class Store: ObservableObject {
	@Published var stickerPacks: [StickerPack]
	@Published var collections: [Collection] = []
	
	init(filename: String = "StickerPackData.json") {
		self.stickerPacks = Bundle.main.decode(filename: filename, as: [StickerPack].self)
	}
	
	func placeCollection(stickerpack: StickerPack) {
		let nextID = Collection.collectionSequence.next()!
		let collection = Collection(id: nextID, stickerPack: stickerpack)
		collections.append(collection)
	}
}

extension Store {
	func toggleFavorite(of stickerPack: StickerPack) {
		guard let index = stickerPacks.firstIndex(of: stickerPack) else { return }
		stickerPacks[index].isFavorite.toggle()
	}
}
