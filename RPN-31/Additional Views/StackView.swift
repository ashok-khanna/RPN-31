import SwiftUI

struct StackView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentStackRegister: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.secondaryBackgroundColor
                .edgesIgnoringSafeArea(.all)
                
                List {
                
                VStack(spacing: 0) {
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.secondarySubPageHeaderColor)
                        .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)
                    
                        Text("Stack View")
                            .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                            .font(self.dataRouter.myFonts.subPageTitleFont)
                            .fontWeight(.medium)
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                        .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                        Text("Reorder by touching down on the three grey lines to the right and then drag the row up or down. Dismiss this page when done (all changes are autosaved).")
                            .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                            .font(self.dataRouter.myFonts.subPageTextFont)
                            .minimumScaleFactor(0.01)
                            .padding(0)
                    
                    Rectangle()
                    .fill(Color.clear)
                    .frame(width:0, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                    SimpleButton(buttonText: "Reset Stack Registers", width: geometry.size.width * self.dataRouter.mySizes.subPageSecondaryButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageSecondaryButtonHeight, bgColor: self.dataRouter.myColors.secondarySpecialFillColor, bgColor1: self.dataRouter.myColors.secondarySpecialFillColor, highlightColor: self.dataRouter.myColors.brightButtonColor)
                    .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageSecondaryButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageSecondaryButtonHeight)
                        .onAppear() {
                            self.dataRouter.defaults.set(self.dataRouter.calculator.stackRegisters, forKey: "tempStackRegisterStore")
                    }
                    
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                        .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                    }
                    
                    
                    ForEach(0..<self.dataRouter.calculator.stackRegisters.count) { i in
                                    
                                    Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[i]))
                                        .font(self.dataRouter.myFonts.subPageTextFont)
                                }
                                .onMove(perform: self.move)
                            }
                            //.listStyle(GroupedListStyle())
                            .environment(\.editMode, .constant(.active))
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
            
                    Spacer()

                    }
                        
                    }

                    
                }
            
            func move(from source: IndexSet, to destination: Int) {
                self.dataRouter.calculator.stackRegisters.move(fromOffsets: source, toOffset: destination)
        }
        
}


