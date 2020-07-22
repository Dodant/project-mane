//
//  ResizedImage.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/22.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct ResizedImage: View {
	let imageName: String
	let contentMode: ContentMode
	let renderingMode: Image.TemplateRenderingMode?
	
	init(
		_ imageName: String,
		contentMode: ContentMode = .fill,
		renderingMode: Image.TemplateRenderingMode? = nil
	) {
		self.imageName = imageName
		self.contentMode = contentMode
		self.renderingMode = renderingMode
	}
	
	var body: some View {
		Image(imageName)
			.renderingMode(renderingMode)
			.resizable()
			.aspectRatio(contentMode: contentMode)
	}
}

struct ResizedImage_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ResizedImage("apple")
			ResizedImage("apple", contentMode: .fit)
			
			Button(action: {}) {
				ResizedImage("apple")
			}
			Button(action: {}) {
				ResizedImage("apple", renderingMode: .original)
			}
		}
	}
}
