//
//  ControlImageView.swift
//  pinch-zoom (iOS)
//
//  Created by Lucas Portella on 29/09/22.
//

import SwiftUI

struct ControlImageView: View {
    var icon: String
    
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
