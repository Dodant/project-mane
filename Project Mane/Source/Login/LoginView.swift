//
//  LoginView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/09/10.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct LoginView: View {
	@ObservedObject var viewModel = ViewModel()
	var body: some View {
		VStack {
			if viewModel.user != nil {
				VStack(alignment: .leading){
					Text("User Name: \n\(viewModel.user!.fullName)")
					Text("User Email: \n\(viewModel.user!.email)")
					Text("User State: \n\(viewModel.user!.authState)")
						.foregroundColor(viewModel.user?.authState == "authorized" ? .green : .primary)
				}.padding(.horizontal)
					.font(.custom("Apple SD Gothix Neo", size: 40))
			} else {
				Button(action: {self.viewModel.getRequest()}) {
					AppleIdButton().background(Color.primary)
						.clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
						.padding(7)
						.frame(width: UIScreen.main.bounds.width * 0.9, height: 76)
				}
			}
		}.onAppear {
			self.viewModel.getUserInfo()
		}.shadow(color: Color.secondary.opacity(0.5), radius: 10, y: 8)
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
