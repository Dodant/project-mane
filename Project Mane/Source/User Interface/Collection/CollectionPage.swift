//
//  CollectionPage.swift
//  Project Mane
//
//  Created by Junggyun Oh on 2020/07/18.
//  Copyright © 2020 OJK. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
	var body: some View {
		NavigationView {
			Form {
				downloadInfoSection
			}
			.navigationBarTitle("Collection")
		}
	}
	
	var downloadInfoSection: some View {
		Section(header: Text("Info").fontWeight(.medium)){
			NavigationLink(destination: CollectionListView()) {
				Text("Downloaded")
			}
			.frame(height: 44)
		}
	}
}

struct CollectionView_Previews: PreviewProvider {
	static var previews: some View {
		 CollectionView()
	}
}
