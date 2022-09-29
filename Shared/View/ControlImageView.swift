//
//  ControlImageView.swift
//  pinch-zoom (iOS)
//
//  Created by Lucas Portella on 29/09/22.
//

import SwiftUI

struct ControlImageView: View {
    var icon: String
    var completion: () -> Void
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                completion()
            }
        } label: {
            Image(systemName: icon)
                .font(.system(size: 36))
        }
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass", completion: {})
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
