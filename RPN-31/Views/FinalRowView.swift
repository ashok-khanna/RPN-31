//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct FinalRowView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @State var presentFunctionPage = false
    @State var presentHelpPage = false

    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0){
                            
                            DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.oneButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                            
                            Rectangle()
                                .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2))
                            
                            
                            DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.twoButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                            
                        }
                        .padding(0)
                        
                        Rectangle()
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.gapWidth), height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)
                        
                        
                        DigitButton(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.gapWidth), height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.zeroButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                    }
                    
                    
                    
                }
                .padding(0)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    VStack(spacing: 0){
                        
                            DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.threeButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                        
                        Rectangle()
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)
                        
                        DigitButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.decimalButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                            .sheet(isPresented: self.$presentHelpPage) {
                                HelpView(presentHelpPage: self.$presentHelpPage).environmentObject(self.dataRouter)
                        }
                        
                    }
                    
                    Rectangle()
                        .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                    
                    OperatorButton(operatorString: "ENTER", bgColor: self.dataRouter.brightButtonColor, bgColor1: self.dataRouter.brightButtonColor, highlightColor: self.dataRouter.brightButtonHighlight, fontColor: self.dataRouter.brightTextColor, font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                    
                }
                .padding(0)
                
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
            }
            .padding(0)
            
            
        }
    }
}


