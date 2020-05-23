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
    @State var isPresented = false

    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0){
                            
                            AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.oneButton, isPresented: self.$isPresented)
                            
                            Rectangle()
                                .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2))
                            
                            
                            AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.twoButton, isPresented: self.$isPresented)
                            
                        }
                        .padding(0)
                        
                        Rectangle()
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.gapWidth), height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)
                        
                        
                        AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits * (CGFloat(2) + self.dataRouter.gapWidth), height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.zeroButton, isPresented: self.$isPresented)
                    }
                    
                    
                    
                }
                .padding(0)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                HStack(spacing: 0) {
                    
                    VStack(spacing: 0){
                        
                        AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.threeButton, isPresented: self.$isPresented)
                        
                        Rectangle()
                            .frame(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)
                        
                        AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: (geometry.size.height - geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth)/CGFloat(2), bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.decimalButton, isPresented: self.$isPresented)
                        
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


