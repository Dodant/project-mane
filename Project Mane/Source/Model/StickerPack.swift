//
//  StickerPack.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

struct StickerPack {
	let id: UUID = UUID()
	let name: String
	let packImageName: String
	let artist: String
	var isFavorite: Bool = false
	
//	let description: String
//	let liked: Int
//	let numberOfStickers: Int
//	let numberOfDownloaded: Int
//	let tags: [String]
}

extension StickerPack : Identifiable { }
extension StickerPack : Codable { }
extension StickerPack : Equatable { }

let stickerPackSamples = [
	StickerPack(name: "League of Legends Emote", packImageName: "teemo",
				artist: "Riot Games", isFavorite: true),
    StickerPack(name: "Baby Shark", packImageName: "baby shark",
				artist: "Smart Study"),
    StickerPack(name: "Pinkfong", packImageName: "pinkfong",
				artist: "Smart Study", isFavorite: true),
    StickerPack(name: "Rick and Morty", packImageName: "rick and morty",
				artist: "Adult Swim"),
    StickerPack(name: "Happy Tree Friends", packImageName: "happy tree friends",
				artist: "Mondo Media", isFavorite: true),
    StickerPack(name: "빵빵이의 일상", packImageName: "빵빵이", artist: "이주용"),
]
