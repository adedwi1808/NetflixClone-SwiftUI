//
//  ButtonStyle+Extension.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 10/09/24.
//

import SwiftUI

struct CustomBorderedButton: ButtonStyle {
    var backgroundColor: Color = .pictonBlue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, style: .init(lineWidth: borderWidth))
            }
    }
}
