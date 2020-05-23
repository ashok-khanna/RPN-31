//
//  ContentView.swift
//  RPN-31
//
//  Created by Ashok Khanna on 16/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct ThirdRowView: View {
@EnvironmentObject var dataRouter: DataRouter
@State var isPresented = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {

                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.fourButton, isPresented: self.$isPresented)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.fiveButton, isPresented: self.$isPresented)
                    .sheet(isPresented: self.$isPresented) {
                        AdvanceView(isPresented: self.$isPresented).environmentObject(self.dataRouter)
                }
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                
                AdvanceButton(width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height, bgColor: self.dataRouter.darkButtonColor, bgColor1: self.dataRouter.darkButtonColor, calculatorButton: self.dataRouter.sixButton, isPresented: self.$isPresented)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "+", bgColor: self.dataRouter.brightButtonColor, bgColor1: self.dataRouter.brightButtonColor, highlightColor: self.dataRouter.brightButtonHighlight, fontColor: self.dataRouter.brightTextColor, font: self.dataRouter.digitFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}



