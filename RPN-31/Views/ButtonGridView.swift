//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct ButtonGridView: View {
    @EnvironmentObject var dataRouter: DataRouter
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(alignment: .leading, spacing: 0) {
                
                FirstRowView()
                    .frame(width: geometry.size.width, height: (geometry.size.height - CGFloat(4) * self.dataRouter.mySizes.gapWidth * geometry.size.width / self.dataRouter.rowUnits)/self.dataRouter.numRows)
                
                Rectangle()
                    .fill(Color.clear)
                .frame(width: geometry.size.width, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth) // The gap between each row should be equal to the gap width
                
                SecondRowView()
                    .frame(width: geometry.size.width, height: (geometry.size.height - CGFloat(4) * self.dataRouter.mySizes.gapWidth * geometry.size.width / self.dataRouter.rowUnits)/self.dataRouter.numRows)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth) // The gap between each row should be equal to the gap width
                
                ThirdRowView()
                    .frame(width: geometry.size.width, height: (geometry.size.height - CGFloat(4) * self.dataRouter.mySizes.gapWidth * geometry.size.width / self.dataRouter.rowUnits)/self.dataRouter.numRows)
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth) // The gap between each row should be equal to the gap width
                
                FinalRowView()
                    .frame(width: geometry.size.width, height: CGFloat(2) * (geometry.size.height - CGFloat(4) * self.dataRouter.mySizes.gapWidth * geometry.size.width / self.dataRouter.rowUnits)/self.dataRouter.numRows + geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)
                
                
            }
            .padding(0)
        }
    }
}


/*
 
 Refer to the notes we had at the bottom of ContentView that described the overall button set up and how we determined total height in terms of width
 
 
 
 */
