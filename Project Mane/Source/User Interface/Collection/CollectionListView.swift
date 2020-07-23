//
//  CollectionListView.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/22.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct CollectionListView: View {
	@EnvironmentObject var store: Store
	
	var body: some View {
		ZStack {
//			if store.collections.isEmpty {
				emptyOrders
//			} else {
//				collectionList
//			}
		}
		.animation(.default)
		.navigationBarTitle("Downloaded")
//		.navigationBarItems(trailing: editButton)
	}
}

private extension CollectionListView {
	var collectionList: some View {
		List {
			ForEach(store.collections) {
				CollectionRow(collection: $0)
			}
//			.onDelete(perform: store.deleteCollection(at:))
//			.onMove(perform: store.moveCollection(from:to:))
		}
	}
	
	var emptyOrders: some View {
		VStack(spacing: 25){
			Image(systemName: "cube.box")
				.resizable()
				.frame(width: 100.0, height: 100.0)
				.imageScale(.large)
				.foregroundColor(Color.gray.opacity(0.4))
			Text("You Haven't Downloaded Yet")
				.font(.headline).fontWeight(.medium)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.background)
	}
	
	var editButton: some View {
		!store.collections.isEmpty
			? AnyView(EditButton())
			: AnyView(EmptyView())
	}
}

struct CollectionListView_Previews: PreviewProvider {
	static var previews: some View {
		 CollectionListView()
	}
}
