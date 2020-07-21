//
//  DownloadCompletedMessage.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/21.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct DownloadCompletedMessage: View {
	var body: some View {
		Text("Download Complete!")
			.font(.system(size: 24))
			.bold()
			.kerning(1)
	}
}

struct DownloadCompletedMessage_Previews: PreviewProvider {
	static var previews: some View {
		DownloadCompletedMessage()
	}
}
