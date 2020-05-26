import SwiftUI

struct ButtonConfiguratorView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentButtonConfigurator: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.secondaryBackgroundColor  
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    List {
                        
                        VStack(spacing: 0) {
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondarySubPageHeaderColor)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)
                            
                            Text("Button Configurator")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTitleColor)
                                .font(self.dataRouter.myFonts.subPageTitleFont)
                                .fontWeight(.medium)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                            
                            Text("Reorder by touching down on the three grey lines to the right and then drag the row up or down. Dismiss this page when done (all changes are autosaved).")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                .font(self.dataRouter.myFonts.subPageTextFont)
                                .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                            
                            SimpleButton(buttonText: "Reset to Defaults", width: geometry.size.width * self.dataRouter.mySizes.subPageSecondaryButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageSecondaryButtonHeight, bgColor: self.dataRouter.myColors.secondarySpecialFillColor, bgColor1: self.dataRouter.myColors.secondarySpecialFillColor, highlightColor: self.dataRouter.myColors.brightButtonColor)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.height * self.dataRouter.mySizes.subPageSecondaryButtonHeight)
                            
                            Rectangle()
                                .fill(self.dataRouter.myColors.secondaryBackgroundColor)
                                .frame(width: self.dataRouter.mySizes.nilSize, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                            
                        }
                        

                        
                        ForEach(self.dataRouter.buttonList, id: \.self) { user in
                            Text(user)
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
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
    }
    
    func move(from source: IndexSet, to destination: Int) {
        self.dataRouter.buttonList.move(fromOffsets: source, toOffset: destination)
        self.dataRouter.defaults.set(self.dataRouter.buttonList, forKey: "SavedButtonList")
    }
    
}

