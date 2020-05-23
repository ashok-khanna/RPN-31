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
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "CLR", bgColor: self.dataRouter.lightButtonColor, bgColor1: self.dataRouter.lightButtonColor, highlightColor: self.dataRouter.clearAllHighlight, fontColor: self.dataRouter.lightTextColor, font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "CHS", bgColor: self.dataRouter.lightButtonColor, bgColor1: self.dataRouter.lightButtonColor, highlightColor: self.dataRouter.lightButtonHighlight, fontColor: self.dataRouter.lightTextColor, font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "DIV", bgColor: self.dataRouter.lightButtonColor, bgColor1: self.dataRouter.lightButtonColor, highlightColor: self.dataRouter.lightButtonHighlight, fontColor: self.dataRouter.lightTextColor, font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
                OperatorButton(operatorString: "X", bgColor: self.dataRouter.brightButtonColor, bgColor1: self.dataRouter.brightButtonColor, highlightColor: self.dataRouter.brightButtonHighlight, fontColor: self.dataRouter.brightTextColor, font: self.dataRouter.operatorFont, width: geometry.size.width / self.dataRouter.rowUnits, height: geometry.size.height)
                
                Rectangle()
                    .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.gapWidth, height: geometry.size.height)
                
            }
        .padding(0)
            
            
        }
    }
}


