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
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.sevenButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.eightButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, calculatorButton: self.dataRouter.nineButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "-", bgColor: self.dataRouter.brightButtonColor, bgColor1: self.dataRouter.brightButtonColor, highlightColor: self.dataRouter.brightButtonHighlight, fontColor: self.dataRouter.brightTextColor, font: self.dataRouter.digitFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}


