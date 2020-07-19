//
//  StickerPackRow.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/19.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct StickerPackRow: View {
	let stickerPack: StickerPack
	
	var body: some View {
		HStack(spacing: 0) {
			packImage
			packInfo
		}
		.frame(height: 120)
		.background(Color.primary.colorInvert())
		.cornerRadius(20)
		.shadow(color: Color.primary.opacity(0.5), radius: 3, x: 2, y: 2)
		.padding(.vertical, 4)
	}
}

private extension StickerPackRow {
	var packImage: some View {
		Image(stickerPack.packImageName)
			.resizable()
			.scaledToFit()
			.frame(width: 120)
			.clipped()
	}
	var packInfo: some View {
		VStack(alignment: .leading) {
			Spacer()
			
			Text(stickerPack.name)
				.font(.headline)
				.fontWeight(.medium)
				.padding(.bottom, 6)
			
			
			Text(stickerPack.artist)
				.font(.footnote)
				.foregroundColor(.secondary)
			
			Spacer()
			
			footerView
			
		}
		.padding([.leading, .bottom], 11)
		.padding([.top, .trailing])
	}
	var footerView: some View {
		HStack(spacing: 5) {
			Spacer()
			
			Image(systemName: "heart")
				.imageScale(.large)
				.foregroundColor(Color("sky"))
				.frame(width: 35, height: 35)
			
			Image(systemName: "plus.circle")
				.imageScale(.large)
				.foregroundColor(Color("sky"))
				.frame(width: 35, height: 35)
			
		}
	}
}

struct StickerPackRow_Previews: PreviewProvider {
	static var previews: some View {
		StickerPackRow(stickerPack: stickerPackSamples[0])
	}
}


