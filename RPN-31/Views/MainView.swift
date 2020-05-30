//
//  ContentView.swift
//  TimeTracker
//
//  Created by Ashok Khanna on 8/5/20.
//  Copyright © 2020 Ashok Khanna. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Environment(\.presentationMode) var presentation
    @State var presentStackRegister = false

        var body: some View {

            GeometryReader { geometry in
                
                ZStack {
                    
                    self.dataRouter.myColors.primaryBackgroundColor
                       .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(spacing: 0) {
                    
                        Spacer()
                        
                        HStack(spacing: 0) {
                            
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.topLeftGapWidth, height: geometry.size.height * self.dataRouter.mySizes.stackHeight)
                            
                            VStack(spacing: 0) {
                                
                                Spacer()
                                                                
                                Text(self.dataRouter.calculator.stackRegisters.count > 1 ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[1]) : "0")
                                    .font(self.dataRouter.myFonts.yRegisterFont)
                                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    .lineLimit(1)
                                    .foregroundColor(self.dataRouter.myColors.mainTextColor)
                                    .frame(width: geometry.size.width * self.dataRouter.mySizes.yRegisterWidth, height: geometry.size.height * self.dataRouter.mySizes.yRegisterHeight, alignment: .leading)
                                .background(Color.black)
                                .onTapGesture {
                                    self.dataRouter.calculator.swapXY()
                                }
                                
                                Spacer()
                                                                
                                Text(self.dataRouter.calculator.lastRegister.displayText)
                                    .font(self.dataRouter.myFonts.lRegisterFont)
                                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    .lineLimit(1)
                                    .foregroundColor(self.dataRouter.myColors.lRegisterTextColor)
                                    .frame(width: geometry.size.width * self.dataRouter.mySizes.lRegisterWidth, height: geometry.size.height * self.dataRouter.mySizes.lRegisterHeight, alignment: .leading)
                                .background(Color.black)
                                .onTapGesture {
                                    self.dataRouter.calculator.reverseOperation()
                                }
                                
                                Spacer()
                                
                            }
                            .frame(width: geometry.size.width * self.dataRouter.mySizes.yRegisterWidth, height: geometry.size.height * self.dataRouter.mySizes.stackHeight)

                            Spacer()
                                                            
                            StackButton(width: geometry.size.width * self.dataRouter.mySizes.stackWidth, height: geometry.size.height * self.dataRouter.mySizes.stackHeight, bgColor1: Color.black, presentStackRegister: self.$presentStackRegister)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.stackWidth, height: geometry.size.height * self.dataRouter.mySizes.stackHeight)
                                    .sheet(isPresented: self.$presentStackRegister) {
                                StackView(presentStackRegister: self.$presentStackRegister).environmentObject(self.dataRouter)
                                }
                            
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth, height: geometry.size.height * self.dataRouter.mySizes.stackHeight)
                            

                        }
                        
                        Spacer()
                        
                        Spacer()
                                                
                        Text(self.dataRouter.calculator.showFunction ? self.dataRouter.calculator.functionText : (self.dataRouter.calculator.stackRegisters.count == 0 ? "" : (self.dataRouter.calculator.isNewNumberEntry ?  self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[0]) : self.dataRouter.calculator.xRegisterEntryFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[0]))!)))
                            .font(self.dataRouter.myFonts.xRegisterFont)
                            .fontWeight(self.dataRouter.calculator.showFunction ? .medium : .regular)
                            .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                            .lineLimit(1)
                            .foregroundColor(self.dataRouter.calculator.showFunction ? self.dataRouter.myColors.functionDisplayTextColor : self.dataRouter.myColors.mainTextColor)
                            .frame(width: geometry.size.width * self.dataRouter.mySizes.xRegisterWidth, height: geometry.size.height * self.dataRouter.mySizes.xRegisterHeight, alignment: .bottom)
                        .padding(0)
                        .onTapGesture {
                            self.dataRouter.calculator.deleteInput()
                        }
                        
                       // Spacer()
                                                                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: geometry.size.width, height: geometry.size.width / self.dataRouter.rowUnits * self.dataRouter.mySizes.gapWidth * CGFloat(1.75))

                        ButtonGridView()
                            .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.gridHeight)
                        
                        /* Rectangle()
                            .fill(Color.clear)
                            .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.bottomGap) */
                                        
                        Spacer()
                        
                    }.navigationBarTitle(Text(""), displayMode: .inline) // relates to bug: https://stackoverflow.com/questions/58512344/swiftui-navigation-bar-button-not-clickable-after-sheet-has-been-presented
                }
            }
            
}
}


/*

Dimension Calculator:

1. We will take a full width for buttons
2. We want each button to be a square
3. We want the space between each button to be consistent (both gaps between buttons on a row and between buttons on a column)
4. Grid of butons is 4 (rows) x 5 (columns) and there are 5 gaps for each row and 4 gaps for each column (we count the outer edges for the rows, but not for the columns, the latter only to reduce the number of views in ButtonGridView)
5. Let us set the gap width as 1/8th of a button
6. Therefore each screen width will have 4.625 "button widths" and each screen height will have 5.75 "button widths"
7. Therefore we set height to 5.75 / 4.625 of width
8. However, to allow us to change the gap width, let us set the gap width as a constant g, so that height = (5 + 6g)/(4 + 5g) of width
9. Of course we can also make the number of rows and columns constants, which we do in the above
10. But because Swift had some i


*/
