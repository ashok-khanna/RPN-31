//
//  OperatorButton.swift
//  RPN-31
//
//  Created by Ashok Khanna on 24/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import Foundation
import SwiftUI

struct AdvanceButton2: View {

@EnvironmentObject var dataRouter: DataRouter
    
@State var buttonText: String
@State var width: CGFloat
@State var height: CGFloat
@Binding var presentFunctionPage: Bool
@Binding var presentButtonConfigurator: Bool
@Binding var presentGuidePage: Bool

@State var bgColor: Color
@State var bgColor1: Color
@State var highlightColor: Color
    
@GestureState var longPress = false
@GestureState var longDrag = false

var body: some View {
    
    let longPressGestureDelay = DragGesture(minimumDistance: 0)
        .updating($longDrag) { currentstate, gestureState, transaction in
                gestureState = true
        }
    .onEnded { value in
        print(value.translation) // We can use value.translation to see how far away our finger moved and accordingly cancel the action (code not shown here)
       
        if(abs(value.translation.width) < (self.width * CGFloat(0.75)) && abs(value.translation.height) < (self.height * CGFloat(0.75))) {
            
            switch self.buttonText {
            case "buttonConfig":
                self.presentButtonConfigurator = true
            case "guidePage":
                self.presentGuidePage = true
            case "ALT":
                self.dataRouter.altFunctions.toggle()
            case "Copy":
                self.dataRouter.calculator.copyToClipboard()
                self.presentFunctionPage = false
            case "Paste":
                self.dataRouter.calculator.pasteFromClipboard()
                self.presentFunctionPage = false
            default:
                break
            }
            
        }
        
        self.bgColor = self.bgColor1

        
    }
    
    let shortPressGesture = LongPressGesture(minimumDuration: 0)
    .onEnded { _ in
        
        switch self.buttonText {
        case "Button Configurator":
            self.presentButtonConfigurator = true
        case "Guide":
            self.presentGuidePage = true
        case "ALT":
            self.dataRouter.altFunctions.toggle()
        case "Copy":
            self.dataRouter.calculator.copyToClipboard()
            self.presentFunctionPage = false
        case "Paste":
            self.dataRouter.calculator.pasteFromClipboard()
            self.presentFunctionPage = false
        default:
            break
        }
        
    }
    
    let longTapGesture = LongPressGesture(minimumDuration: 0.25)
        .updating($longPress) { currentstate, gestureState, transaction in
            gestureState = true
    }
    .onEnded { _ in
        self.bgColor = self.highlightColor
    }
    
    let tapBeforeLongGestures = longTapGesture.sequenced(before:longPressGestureDelay).exclusively(before: shortPressGesture)
    
    return
        
        HStack {
            
            Spacer()
            
            if self.buttonText == "Copy" {
                Image(systemName:"doc.on.doc.fill")
                .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                .font(Font.title.weight(.regular))
            } else if self.buttonText == "Paste" {
                Image(systemName:"doc.richtext")
                    .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                    .font(Font.title.weight(.regular))
            } else if self.buttonText == "Guide" {
                Image(systemName:"book.fill")
                    .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                    .font(Font.title.weight(.regular))
            }
                        
            Text(self.buttonText)
                .font(self.dataRouter.operatorFont)
                .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                .fixedSize()
                .padding(0)
            
            Spacer()
                        
            }
        .frame(width: width, height: height)
        .background(self.longPress ? self.highlightColor : self.bgColor)
            .cornerRadius(15)
            .gesture(tapBeforeLongGestures)

    }
    
}

