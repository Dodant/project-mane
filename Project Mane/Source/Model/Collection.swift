//
//  Collection.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/21.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

struct Collection: Identifiable {
	static var collectionSequence = sequence(first: lastOrderID + 1) { $0 &+ 1 }
	static var lastOrderID: Int {
	  get { UserDefaults.standard.integer(forKey: "LastOrderID") }
	  set { UserDefaults.standard.set(newValue, forKey: "LastOrderID") }
	}
	
	let id: Int
	let stickerPack: StickerPack
}

extension Collection: Codable{}
