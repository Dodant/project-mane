//
//  StickerPackDetailView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/19.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct StickerPackDetailView: View {
	@EnvironmentObject private var store: Store
	let stickerPack : StickerPack
	
	@State private var showingAlert: Bool = false
	@State private var showingPopup: Bool = false
	
	var body: some View {
		VStack(spacing: 0) {
			stickerPackImage
			detailView
		}
		.popup(isPresented: $showingPopup) { DownloadCompletedMessage() }
		.edgesIgnoringSafeArea(.top)
		.alert(isPresented: $showingAlert) { confirmAlert }
	}
}

private extension StickerPackDetailView {
	var stickerPackImage: some View {
		GeometryReader { _ in
			Image(self.stickerPack.packImageName)
				.resizable()
				.scaledToFill()
		}
	}
	
	var detailView: some View {
		GeometryReader {
			VStack(alignment: .leading){
				self.packDescription
				Spacer()
				self.placeDownload
			}
			.padding(27)
			.frame(height: $0.size.height + 10)
			.background(Color.white)
			.cornerRadius(25)
			.shadow(color: Color.black.opacity(0.33), radius: 10, x: 0, y: -5)
		}
	}
	
	var packDescription: some View {
		VStack(alignment: .leading, spacing: 16) {
			HStack {
				Text(stickerPack.name)
					.font(.largeTitle).fontWeight(.medium)
					.foregroundColor(.black)
				
				Spacer()
				
				FavoriteButton(stickerPack: stickerPack)
			}
			
			Text(stickerPack.artist)
				.foregroundColor(.secondaryText)
				.fixedSize()
		}
	}
	
	var placeDownload: some View {
		Button(action: { self.showingAlert = true }) {
			Capsule()
				.fill(Color.sky)
				.frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
				.overlay(Text("Download Pack")
					.font(.system(size:27)).fontWeight(.medium)
					.foregroundColor(Color.white))
				.padding(.vertical, 8)
		}
	}
	
	var confirmAlert: Alert {
		Alert(
			title: Text("Download"),
			message: Text("\(stickerPack.name)"),
			primaryButton: .default(Text("Confirm"), action: {
				self.placeCollection()
			}),
			secondaryButton: .cancel(Text("Cancle"))
		)
	}
	
	private func placeCollection() {
		store.placeCollection(stickerpack: stickerPack)
		showingPopup = true
	}
	
}

struct StickerPackDetailView_Previews: PreviewProvider {
	static var previews: some View {
		StickerPackDetailView(stickerPack: stickerPackSamples[0])
	}
}
