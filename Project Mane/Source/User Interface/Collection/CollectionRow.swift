//
//  CollectionRow.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/22.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct CollectionRow: View {
	let collection: Collection
	
	var body: some View {
		HStack {
			ResizedImage(collection.stickerPack.packImageName)
				.frame(width: 60, height: 60)
				.clipShape(Circle())
				.padding()
			
			VStack(alignment: .leading, spacing: 10) {
				Text(collection.stickerPack.name)
					.font(.headline).fontWeight(.medium)
				Text(collection.stickerPack.artist)
					.font(.footnote)
					.foregroundColor(.secondary)
			}
		}
		.frame(height: 70)
	}
}
