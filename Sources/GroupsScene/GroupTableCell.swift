//
//  GroupTableCell.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import SwiftUI
import Avatar

@available(iOS 13.0, *)
struct GroupTableCell: View {
    let rowHeight: CGFloat
    let color: Color
    let groupName: String
    let logo: Image
    
    init(groupName: String, logo: Data, rowHeight: CGFloat = 80, cellBackGround: Color = .gray)  {
        self.groupName = groupName
        if let image = UIImage(data: logo) {
            self.logo = Image(uiImage: image)
        } else {
            self.logo = Image(systemName: "image")
        }
        self.rowHeight = rowHeight
        self.color = cellBackGround
    }
    
    var body: some View {
        
        HStack {
            Avatar {
                logo
            }
            .padding(.leading, 10)
            Text(groupName)
                .padding(.leading,15)
            Spacer()
        }
        .frame(height: rowHeight)
        .background(Color.gray.opacity(0.2))
    }
}
