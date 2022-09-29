//
//  ControlImageView.swift
//  pinch-zoom (iOS)
//
//  Created by Lucas Portella on 29/09/22.
//

import SwiftUI

struct ControlImageView: View {
    var body: some View {
        Button {} label: {
            Image(systemName: "minus.magnifyingglass")
                .font(.system(size: 36))
        }
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
