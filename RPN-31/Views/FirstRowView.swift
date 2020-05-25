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
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                
                OperatorButton(operatorString: "CLR", bgColor: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.topRowShortPress(self.dataRouter.darkMode), highlightColor2: self.dataRouter.myColors.deleteHighlight(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.topRowButtonText(self.dataRouter.darkMode), font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "CHS", bgColor: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.topRowShortPress(self.dataRouter.darkMode), highlightColor2: self.dataRouter.myColors.topRowShortPress(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.topRowButtonText(self.dataRouter.darkMode), font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "DIV", bgColor: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.topRowButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.topRowShortPress(self.dataRouter.darkMode), highlightColor2: self.dataRouter.myColors.topRowShortPress(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.topRowButtonText(self.dataRouter.darkMode), font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "X", bgColor: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode), highlightColor2: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.brightButtonText(self.dataRouter.darkMode), font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}


