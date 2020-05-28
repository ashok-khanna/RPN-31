//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct FirstRowView: View {
@EnvironmentObject var dataRouter: DataRouter
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                
                OperatorButton(operatorString: "CLR", bgColor: self.dataRouter.myColors.secondaryButtonColor, bgColor1: self.dataRouter.myColors.secondaryButtonColor, highlightColor: self.dataRouter.myColors.secondaryShortPressColor, highlightColor2: self.dataRouter.myColors.deleteHighlightColor, fontColor: self.dataRouter.myColors.secondaryButtonTextColor, font: self.dataRouter.myFonts.textFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "CHS", bgColor: self.dataRouter.myColors.secondaryButtonColor, bgColor1: self.dataRouter.myColors.secondaryButtonColor, highlightColor: self.dataRouter.myColors.secondaryShortPressColor, highlightColor2: self.dataRouter.myColors.secondaryShortPressColor, fontColor: self.dataRouter.myColors.secondaryButtonTextColor, font: self.dataRouter.myFonts.textFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "DIV", bgColor: self.dataRouter.myColors.secondaryButtonColor, bgColor1: self.dataRouter.myColors.secondaryButtonColor, highlightColor: self.dataRouter.myColors.secondaryShortPressColor, highlightColor2: self.dataRouter.myColors.secondaryShortPressColor, fontColor: self.dataRouter.myColors.secondaryButtonTextColor, font: self.dataRouter.myFonts.textFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "X", bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor, highlightColor2: self.dataRouter.myColors.brightShortPressColor, fontColor: self.dataRouter.myColors.brightButtonTextColor, font: self.dataRouter.myFonts.textFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}


