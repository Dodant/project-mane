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
				.scaledToFill()
				.frame(width: 70, height: 70)
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

struct CollectionRow_Previews: PreviewProvider {
	static var previews: some View {
		List(stickerPackSamples.indices) { index in
			CollectionRow(collection:
				Collection(id: index,stickerPack: stickerPackSamples[index]))
		}
	}
}
