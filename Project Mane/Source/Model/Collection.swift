//
//  Collection.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/21.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

struct Collection: Identifiable {
	static var collectionSequence = sequence(first: 1) { $0 + 1 }
	
	let id: Int
	let stickerPack: StickerPack
}
