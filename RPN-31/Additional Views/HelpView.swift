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
                
                VStack(spacing: 0) {
                    
                    List {
                        
                        VStack(spacing: 0) {
                            
                            HStack(spacing: 0){
                                
                                Spacer()
                                
                                Text("Help Page")
                                    .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                                    .font(self.dataRouter.myFonts.subPageTitleFont)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                            }.frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            HStack(spacing: 0){
                                
                                Spacer()
                                
                                Text("E-mail me at ashok.khanna@hotmail.com for any bugs, functions you would like added (it is easy to do) or anything in general")
                                    .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                    .font(self.dataRouter.myFonts.subPageTextFont)
                                    .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                    .padding(0)
                                
                                Spacer()
                                
                            }.frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                            
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
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
                            .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                            
                            Spacer()
                            
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width:self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            HStack(spacing: 0) {
                                
                                Spacer()
                                
                                SliderView()
                                    .accentColor(.red)
                                    .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                
                                Spacer()
                                
                            }
                            

    
                            Rectangle()
                                .fill(Color.clear)
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
        
        helpList = [HelpEntry("Step 1", "This is an RPN calculator, which means you enter numbers first and then the operator"), HelpEntry("Step 2", "For example, to calculate 3 + 9, you will press 3, ENTER, 9 and then +"), HelpEntry("Step 3", "Hold down on any of the digit keys to access additional functions"), HelpEntry("Step 4", "Long press on the five key to bring up 24 additional functions and to map the functions to each digit as to your liking"), HelpEntry("Step 5", "Swipe down on any popup page (like ths help page) to close it"), HelpEntry("Step 6", "Tap the main display to delete the last digit you entered"), HelpEntry("Step 7", "Tap the small gray text in the top left to reverse your last operation (last x)"), HelpEntry("Step 8", "Tap the white text in the top left to swap the last two numbers entered (swap x, y)"), HelpEntry("Step 9", "Long press on STORE/RECALL then press on any digit key (that is not blue) to store its value"), HelpEntry("Step 10", "Long press on STORE/RECALL then press on any digit key that is blue to recall its value"), HelpEntry("Step 11", "Long press on STORE/RECALL then long press on any digit key that is blue to clear its value"), HelpEntry("Step 12", "Tap the stack register to repeat the last action"), HelpEntry("Step 13", "Long press on the stack register in the top right to re-order the register and delete entries"),  HelpEntry("Step 14", "Hold down on the CLR key to clear all registers"), HelpEntry("Step 15", "Select your number format with the options at the top of this page"), HelpEntry("Step 16", "A guide on how to use the various functions is accessible by accessing the Advance Function Page (long press on 5 digit) and then clicking Help. This covers some of the more complicated functions such as NPV, IRR, CASHF, MEAN and SDEV")]
        
    }
}
