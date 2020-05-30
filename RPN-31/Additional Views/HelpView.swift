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
                                
                                Text("E-mail me at ashok.khanna@hotmail.com for any bugs, functions you would like added (it is easy to do) or anything in general. If you enjoy this calculator, please kindly leave a review as it would really help me in getting more visibility in the App Store and also help me as this is part of my IT portfolio. My sincerest thanks and credits to Michael Ash, UMass Amherst who made significant contributions to improvements in this calculator.")
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
        
        helpList = [HelpEntry("Note on the Stack Registers", "It takes a bit of time to get the hang of how the stack registers work as you do calculations. In general, note the following. \n \n(1) Pressing ENTER pushes a number from the xRegister to the yRegister and all numbers in the stack are pushed up\n \n(2) You will only need to press ENTER when pushing numbers up to the yRegister for calculations that use both x and y, or if you want to fill up the stack with values for complex calcualtions such as NPV, IRR, MEAN and SDEV\n \n(3) Calculations that only use the x register (or complex calculations such as NPV, IRR, MEAN, SDEV) do not need the ENTER key to be pressed before pressing the operation or function key - it is incorrect to press the ENTER key here because it will have the effect of pushing the value of the xRegister up into the yRegister, which results in the x value being stored in both x and y registers (unless that is what you want)\n \n(4) After a result is calculated by the calculator, it enters into 'Autolift' mode. If you start typing a new number, the previous result will automatically be pushed up to the yRegister without having to press ENTER. If you do not want this effect, press CLR after a result to clear its value. The reason for 'Autolift' is to allow for very quick additions and subtractions to be done"), HelpEntry("Step 1", "This is an RPN calculator, which means you enter numbers first and then the operator"), HelpEntry("Step 2", "For example, to calculate 3 + 9, you will press 3, ENTER, 9 and then +"), HelpEntry("Step 3", "Hold down on any of the digit keys to access additional functions"), HelpEntry("Step 4", "Long press on the five key to bring up 24 additional functions and to map the functions to each digit as to your liking"), HelpEntry("Step 5", "Swipe down on any popup page (like ths help page) to close it"), HelpEntry("Step 6", "Tap the main display to delete the last digit you entered"), HelpEntry("Step 7", "Tap the small gray text in the top left to reverse your last operation (last x)"), HelpEntry("Step 8", "Tap the white text in the top left to swap the last two numbers entered (swap x, y)"), HelpEntry("Step 9", "Long press on STORE/RECALL then press on any digit key (that is not blue) to store its value"), HelpEntry("Step 10", "Long press on STORE/RECALL then press on any digit key that is blue to recall its value"), HelpEntry("Step 11", "Long press on STORE/RECALL then long press on any digit key that is blue to clear its value"), HelpEntry("Step 12", "Tap the stack register to repeat the last action"), HelpEntry("Step 13", "Long press on the stack register in the top right to re-order the register and delete entries"),  HelpEntry("Step 14", "Hold down on the CLR key to clear all registers"), HelpEntry("Step 15", "Select your number format with the options at the top of this page"), HelpEntry("Step 16", "A guide on how to use the various functions is accessible by accessing the Advance Function Page (long press on 5 digit) and then clicking Help. This covers some of the more complicated functions such as NPV, IRR, CASHF, MEAN and SDEV"), HelpEntry("Bug", "Please note that there is a small bug in the application where not every tap on the stack register, yRegister or lRegister is recognized by the calculator. In particular, after navigating to the advance function or stack register pages and then dismissing them, you may need to press once on the screen to reactivate the tapping of the aforementiond registers. My very sincerest apologies for this minor inconvenience, once I/Apple get a solution for this, we will rectify")]
        
    }
}
