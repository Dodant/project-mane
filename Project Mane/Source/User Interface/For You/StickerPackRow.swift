//
//  StickerPackRow.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/19.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct StickerPackRow: View {
	@EnvironmentObject var store: Store
	@Binding var quickDownload: StickerPack?
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
		.contextMenu {contextMenu}
	}
}

private extension StickerPackRow {
	var packImage: some View {
		Image(stickerPack.packImageName)
			.renderingMode(.original)
			.resizable()
			.scaledToFit()
			.frame(width: 120)
			.clipped()
		
	}
	var packInfo: some View {
		VStack(alignment: .leading) {
			Spacer()
			
			Text(stickerPack.name)
				.foregroundColor(Color.black)
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
			
			FavoriteButton(stickerPack: stickerPack)
			
			Image(systemName: "plus.circle")
				.imageScale(.large)
				.foregroundColor(Color.sky)
				.frame(width: 35, height: 35)
				.onTapGesture { self.placeDownload() }
		}
	}
	var contextMenu: some View {
		VStack{
			Button(action: {self.toggleFavorite()}) {
				Text("Toggle Favorite")
				Image(self.stickerPack.isFavorite ? "heart.fill" : "heart")
			}
		}
	}
	func toggleFavorite(){
		store.toggleFavorite(of: stickerPack)
	}
	func placeDownload(){
		quickDownload = stickerPack
		store.placeCollection(stickerpack: stickerPack)
	}
}

struct StickerPackRow_Previews: PreviewProvider {
	static var previews: some View {
//		StickerPackRow(stickerPack: $0, quickDownload: .constant(nil))
		StickerPackRow(quickDownload: .constant(nil), stickerPack: stickerPackSamples[0])
	}
}


