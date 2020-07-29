//
//  Search.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct SearchView: View {
	let keywords = ["Welcome to the Final Show", "Adult Swim", "Riot Games", "HTF", "Kakao Friends", "BTS", "Simpsons", "♥︎ Econovation ♥︎"]
	@State private var searchText : String = ""
	
	var body: some View {
		NavigationView {
			VStack {
				SearchBar(text: $searchText, placeholder: "Search Artist, Pack")
				List {
					ForEach(self.keywords.filter {
						self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
					}, id: \.self) { car in
						Text(car)
					}
				}.navigationBarTitle(Text("Search"))
			}
		}
	}
}

struct SearchBar: UIViewRepresentable {
	
	@Binding var text: String
	var placeholder: String
	
	class Coordinator: NSObject, UISearchBarDelegate {
		@Binding var text: String
		
		init(text: Binding<String>) {
			_text = text
		}
		
		func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
			text = searchText
		}
	}
	
	func makeCoordinator() -> SearchBar.Coordinator {
		return Coordinator(text: $text)
	}
	
	func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
		let searchBar = UISearchBar(frame: .zero)
		searchBar.delegate = context.coordinator
		searchBar.placeholder = placeholder
		searchBar.searchBarStyle = .minimal
		searchBar.autocapitalizationType = .none
		return searchBar
	}
	
	func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
		uiView.text = text
	}
}


struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}
