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
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0){
                            
                            MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.oneButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                                .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))
                            
                            
                            MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.twoButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))

                            
                        }
                        .padding(0)
                        
                        Rectangle()
                            .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.mySizes.gapWidth), height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)
                        
                        
                        MainButton(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.mySizes.gapWidth), height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.zeroButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.mySizes.gapWidth), height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))
                    }
                    
                    
                    
                }
                .padding(0)
                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    VStack(spacing: 0){
                        
                            MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.threeButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))
                        
                        Rectangle()
                            .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)
                        
                        MainButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2), calculatorButton: self.dataRouter.decimalButton, presentFunctionPage: self.$presentFunctionPage, presentHelpPage: self.$presentHelpPage)
                           .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth)/CGFloat(2))                            .sheet(isPresented: self.$presentHelpPage) {
                                HelpView(presentHelpPage: self.$presentHelpPage).environmentObject(self.dataRouter)
                        }
                        
                    }
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                    
                    OperatorButton(operatorString: "ENTER", bgColor: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.brightButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode), highlightColor2: self.dataRouter.myColors.brightShortPress(self.dataRouter.darkMode), fontColor: self.dataRouter.myColors.brightButtonText(self.dataRouter.darkMode), font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)

                    
                }
                .padding(0)
                
                
                Rectangle()
                    .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height)
                
            }
            .padding(0)
            
            
        }
    }
}


