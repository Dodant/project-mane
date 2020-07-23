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
	@Published var collections: [Collection] = [] {
		didSet { saveData(at: collectionsFilePath, data: collections) }
	}
	
	init(filename: String = "StickerPackData.json") {
		self.stickerPacks = Bundle.main.decode(filename: filename, as: [StickerPack].self)
		self.collections = loadData(at: collectionsFilePath, type: [Collection].self)
	}
}

extension Store {
	func toggleFavorite(of stickerPack: StickerPack) {
		guard let index = stickerPacks.firstIndex(of: stickerPack) else { return }
		stickerPacks[index].isFavorite.toggle()
	}
	
	func placeCollection(stickerpack: StickerPack) {
		let nextID = Collection.collectionSequence.next()!
		let collection = Collection(id: nextID, stickerPack: stickerpack)
		collections.append(collection)
		Collection.lastOrderID = nextID
	}
	
	func deleteCollection(at indexes: IndexSet) {
		guard let index = indexes.first else { return }
		collections.remove(at: index)
	}
	
	func moveCollection(from indexes: IndexSet, to destination: Int) {
		collections.move(fromOffsets: indexes, toOffset: destination)
	}
}

private extension Store {
	var collectionsFilePath: URL {
		let manager = FileManager.default
		let appSupportDir = manager.urls(for: .applicationSupportDirectory,
										 in: .userDomainMask).first!
		let bundleID = Bundle.main.bundleIdentifier ?? "Project-Mane"
		
		let appDir = appSupportDir.appendingPathComponent(bundleID, isDirectory: true)
		
		if !manager.fileExists(atPath: appDir.path) {
			try? manager.createDirectory(at: appDir, withIntermediateDirectories: true)
		}
		
		return appDir
			.appendingPathComponent("Collections")
			.appendingPathExtension("json")
	}
	
	func saveData<T>(at path: URL, data: T) where T: Encodable {
		do {
			let data = try JSONEncoder().encode(data)
			try data.write(to: path)
		} catch {
			print(error)
		}
	}
	
	func loadData<T>(at path: URL, type: [T].Type) -> [T] where T: Decodable {
		do {
			let data = try Data(contentsOf: path)
			let decodedData = try JSONDecoder().decode(type, from: data)
			return decodedData
		} catch {
			return []
		}
	}
}
