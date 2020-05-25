//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct SecondRowView: View {
@EnvironmentObject var dataRouter: DataRouter
@State var presentFunctionPage = false
@State var presentHelpPage = false


    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {

                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.sevenButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.eightButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.nineButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "-", bgColor: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode),highlightColor2: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.brightButtonText(self.dataRouter.darkMode),  font: self.dataRouter.digitFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}


