//
//  ViewModel.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/09/10.
//  Copyright © 2020 OJK. All rights reserved.
//

import Foundation

final class ViewModel: ObservableObject {
	private lazy var signInWithApple = SignInWithAppleCoordinator()
	@Published var user: User?
	
	func getRequest(){
		signInWithApple.getAppleRequest()
	}
	
	func getUserInfo(){
		if let userData = UserDefaults.standard.object(forKey: "user") as? Data,
			let userDecoded = try? JSONDecoder().decode(User.self, from: userData) {
			user = userDecoded
		}
	}
}
