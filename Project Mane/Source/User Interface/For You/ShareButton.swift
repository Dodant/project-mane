//
//  ShareButton.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/29.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI
import UIKit

struct ShareButton: View {
	@State private var isSharingSheetShowing = false
	
	var body: some View {
		Button(action: share ) {
			Image(systemName: "square.and.arrow.up")
				.imageScale(.large)
				.foregroundColor(Color.sky)
		}
	}
	
	func share(){
		isSharingSheetShowing.toggle()
		
		let url = URL(string: "https://apple.com")
		let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
		
		UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
	}
}

struct ShareButton_Previews: PreviewProvider {
	static var previews: some View {
		ShareButton()
	}
}
