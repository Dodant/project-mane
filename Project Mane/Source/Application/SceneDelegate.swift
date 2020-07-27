//
//  SceneDelegate.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/17.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		configureAppearance()
		
		let contentView = TabBarView().environmentObject(Store())
		
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			window.rootViewController = UIHostingController(rootView: contentView)
			self.window = window
			window.makeKeyAndVisible()
		}
	}
	
	private func configureAppearance() {
		UINavigationBar.appearance().largeTitleTextAttributes = [
			.foregroundColor: UIColor(named: "sky")!
		]
		UINavigationBar.appearance().titleTextAttributes = [
			.foregroundColor: UIColor(named: "sky")!
		]
		UITableView.appearance().backgroundColor = .clear
		UISlider.appearance().thumbTintColor = UIColor(named: "sky")
	}
}

