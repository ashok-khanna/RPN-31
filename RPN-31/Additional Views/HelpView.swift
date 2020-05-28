/* Status: Completed */

import SwiftUI

struct HelpView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentHelpPage: Bool
    var myHelp = MyHelp()
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.secondaryBackgroundColor
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 0) {
                    
                    List {
                        
                        VStack(alignment: .center, spacing: 0) {
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                            
                            
                            
                            HStack(spacing: 0) {
                                
                            Spacer()
                            
                            HStack(spacing: 0) {
                                                                    
                                FormatButton(operatorString: "DECIMAL", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                    .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                
                                Spacer()
                                
                                FormatButton(operatorString: "SCIENCE", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                    .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                Spacer()
                                
                                FormatButton(operatorString: "SPECIAL", font: self.dataRouter.myFonts.textFont, width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                    .frame(width: geometry.size.width * CGFloat(0.25), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                                                    
                            }
                            .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, alignment: .center)
                            
                            Spacer()
                                
                            }
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width:self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            HStack(spacing: 0) {
                                
                                Spacer()
                                
                                SliderView()
                                    .accentColor(.red)
                                    .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight, alignment: .center)
                                
                                Spacer()
                                
                            }
                            

    
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                            
                            
                        }
                        
                        ForEach(self.myHelp.helpList) { helpEntry in
                            Section(header: Text(helpEntry.title)) {
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(helpEntry.description)
                                        .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                        .font(self.dataRouter.myFonts.subPageTextFont)
                                        .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    
                                    Rectangle()
                                        .fill(self.dataRouter.myColors.secondarySubPageHeaderColor)
                                        .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageListTableDivider)
                                }
                                
                                
                                
                            }
                        }
                    }
                    
                    Spacer()
                    
                }
            }
        }
    }
}





struct HelpEntry: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    
    init(_ name: String, _ description: String){
        self.title = name
        self.description = description
    }
}

struct MyHelp {
    
    var helpList = [HelpEntry]()
    
    init(){
        
        helpList = [HelpEntry("Step 1", "This is an RPN calculator, which means you enter numbers first and then the operator"), HelpEntry("Step 2", "For example, to calculate 3 + 9, you will press 3, ENTER, 9 and then +"), HelpEntry("Step 3", "Hold down on any of the digit keys to access additional functions"), HelpEntry("Step 4", "Swipe down on any popup page (like ths help page) to close it"), HelpEntry("Step 5", "Tap the main display to delete the digit you entered"), HelpEntry("Step 6", "Tap the small gray text in the top left to reverse your last operation (last x)"), HelpEntry("Step 7", "Tap the white text in the top right to swap the last two numbers entered (swap x, y)"), HelpEntry("Step 8", "Long press on STORE/RECALL then press on any digit key (that is not blue) to store its value"), HelpEntry("Step 9", "Long press on STORE/RECALL then press on any digit key that is blue to recall its value"), HelpEntry("Step 10", "Long press on STORE/RECALL then long press on any digit key that is blue to clear its value"), HelpEntry("Step 11", "Tap the stack register in the top right to roll down values"), HelpEntry("Step 12", "Long press on the stack register in the top right to re-order the register"), HelpEntry("Step 13", "Long press on the 5 key to bring up additional functions and to re-order the functions"), HelpEntry("Step 14", "Hold down on the CLR key to clear all registers"), HelpEntry("Step 15", "Select your number format with the options at the top of this page")]
        
    }
}
