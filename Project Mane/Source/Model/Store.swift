//
//  Store.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/19.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

final class Store {
	var stickerPacks: [StickerPack]
	
	init(filename: String = "StickerPackData.json") {
		self.stickerPacks = Bundle.main.decode(filename: filename, as: [StickerPack].self)
	}
}
