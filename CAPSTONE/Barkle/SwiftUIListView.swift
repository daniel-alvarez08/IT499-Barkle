//
//  SwiftUIListView.swift
//  Barkle
//
//  Created by Foxy Roxy on 11/15/22.
//

import SwiftUI

struct SwiftUIListView: View {
    var body: some View {
        VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    Image("kaneki")
                        .clipShape(Circle())
                    HStack {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                }
                .padding()    }
}

struct SwiftUIListView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIListView()
    }
}
