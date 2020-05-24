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

        var body: some View {

            GeometryReader { geometry in
                
                ZStack {
                    
                    // self.dataRouter.myColors.background(self.dataRouter.darkMode)
                       // .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(spacing: 0) {
                    
                        Spacer()
                        
                        HStack(spacing: 0) {
                            
                            VStack(spacing: 0) {
                                
                                Spacer()
                                
                                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[1]))
                                    .font(.title)
                                    .foregroundColor(self.dataRouter.myColors.text(self.dataRouter.darkMode))
                                    .frame(width: geometry.size.width * CGFloat(0.6), alignment: .leading)
                                .onTapGesture {
                                    self.dataRouter.calculator.swapXY()
                                }
                                                                
                                Text(self.dataRouter.calculator.lastRegister.displayText)
                                    .font(.headline)
                                    .foregroundColor(self.dataRouter.myColors.lText(self.dataRouter.darkMode))
                                    .frame(width: geometry.size.width * CGFloat(0.6), alignment: .leading)
                                .onTapGesture {
                                    self.dataRouter.calculator.reverseOperation()
                                }
                                
                                Spacer()
                                
                            }

                            
                            
                            VStack {
                                                               
                                Spacer()
                                
                                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[4]))
                                    .font(.footnote)
                                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()
                                
                                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[3]))
                                     .font(.footnote)
                                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()
                                
                                Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[2]))
                                    .font(.footnote)
                                    .foregroundColor(self.dataRouter.myColors.stackText(self.dataRouter.darkMode))
                                    .fixedSize()
                                    .padding(0)
                                
                                Spacer()

                            }
                            .frame(width: geometry.size.width * CGFloat (0.3), height: geometry.size.height * CGFloat(0.125))
                            .background(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                            .cornerRadius(7.5)

                            
 

                            
                        }
                        
                        
                        Spacer()
                        
                        Text(self.dataRouter.calculator.showFunction ? self.dataRouter.calculator.functionText : (self.dataRouter.calculator.isNewNumberEntry ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[0]) : self.dataRouter.calculator.xRegisterEntryFormatter.string(from: NSNumber(value: self.dataRouter.calculator.stackRegisters[0]))!))
                            .font(.system(.largeTitle, design: self.dataRouter.calculator.showFunction ? .default : .default))
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                            .foregroundColor(self.dataRouter.calculator.showFunction ? self.dataRouter.myColors.brightButton(self.dataRouter.darkMode) : self.dataRouter.myColors.text(self.dataRouter.darkMode))
                            .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.height * CGFloat(0.0875))
                        .onTapGesture {
                            self.dataRouter.calculator.deleteInput()
                        }
                        
                        Rectangle()
                            .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                            .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.035))

                        ButtonGridView()
                           .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.gridHeight)
                        
                        Rectangle()
                            .fill(self.dataRouter.myColors.background(self.dataRouter.darkMode))
                            .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.015))
                                        
                        
                    }
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
