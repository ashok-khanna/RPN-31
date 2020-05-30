import SwiftUI

struct FunctionView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentFunctionPage: Bool
    @State var presentButtonConfigurator = false
    @State var presentGuidePage = false

    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.primaryBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                 
                // Image("wallpaper2")
                  //   .resizable()
                 //    .aspectRatio(geometry.size, contentMode: .fill)
                  //   .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                      
                    Rectangle()
                        .fill(self.dataRouter.myColors.primaryBackgroundColor)
                          .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        ZStack {
                                                 
                            HStack(spacing: 0){
                                
                                AdvanceButton2(buttonText: "EXIT", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * (self.dataRouter.iPad ? self.dataRouter.mySizes.subPageMainButtonHeight : CGFloat(0.2)), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor)
                                .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width * (self.dataRouter.iPad ? self.dataRouter.mySizes.subPageMainButtonHeight : CGFloat(0.2)))
                                
                                Spacer()
                            }.frame(width: geometry.size.width * CGFloat(0.92))
                            
                            HStack(spacing: 0){

                                    
                                    Rectangle()
                                        .fill(Color.clear)
                                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * (self.dataRouter.iPad ? self.dataRouter.mySizes.subPageMainButtonHeight : CGFloat(0.2)))
                                    
                                
                                
                            
                            Spacer()
                            
                            Text("Advance Functions")
                                    .foregroundColor(self.dataRouter.myColors.primarySubPageTitleColor)
                                    .font(self.dataRouter.myFonts.subPageTitleFont)
                                    .fontWeight(.medium)
                                .frame(height: geometry.size.height * self.dataRouter.mySizes.subPageMainButtonHeight)
                            
                            Spacer()
                            
                            
                        }.frame(width: geometry.size.width * CGFloat(0.92))
                        
                        
                        }
                        
                        Spacer()
                        
                        
                    }.frame(width: geometry.size.width * CGFloat(0.92))
                    

                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)

                    Spacer()
                    
                    AdvanceButton2(buttonText: "Button Configurator", width: geometry.size.width * CGFloat(0.92), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight, presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.specialFillColor, bgColor1: self.dataRouter.myColors.specialFillColor, highlightColor: self.dataRouter.myColors.purpleButtonColor)
                        .frame(width: geometry.size.width * CGFloat(0.92), height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                    .sheet(isPresented: self.$presentButtonConfigurator) {
                    ButtonConfiguratorView(presentButtonConfigurator: self.$presentButtonConfigurator).environmentObject(self.dataRouter)
                    }
                    
                    Rectangle()
                        .fill(Color.clear)
                          .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                            
                        HStack(spacing: 0) {
                            
                            Spacer()
                            
                            AdvanceButton(index: 8, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                                .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))
                            
                            Spacer()
                            
                            AdvanceButton(index: 9, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            Spacer()
                            
                            AdvanceButton(index: 10, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            Spacer()
                            
                            AdvanceButton2(buttonText: "Copy", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            
                            Spacer()
                            
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                        HStack(spacing: 0) {
                            
                            Spacer()
                            
                            AdvanceButton(index: 11, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            Spacer()
                            
                            AdvanceButton(index: 12, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            Spacer()
                            
                            AdvanceButton(index: 13, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            Spacer()
                            
                            AdvanceButton2(buttonText: "Paste", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                            
                            Spacer()
                            
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                        HStack(spacing: 0) {
                        
                        Spacer()
                        
                            AdvanceButton(index: 14, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                        
                            AdvanceButton(index: 15, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                        
                            AdvanceButton(index: 16, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                            
                            AdvanceButton2(buttonText: "HELP", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor)
                                .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                                .sheet(isPresented: self.$presentGuidePage) {
                                    GuideView(presentGuidePage: self.$presentGuidePage).environmentObject(self.dataRouter)
                            }
                            
                        Spacer()
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                        HStack(spacing: 0) {
                        
                        Spacer()
                        
                            AdvanceButton(index: 17, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                        
                            AdvanceButton(index: 18, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                        
                            AdvanceButton(index: 19, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.mainButtonColor, bgColor1: self.dataRouter.myColors.mainButtonColor, highlightColor: self.dataRouter.myColors.mainShortPressColor)
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                            
                            AdvanceButton2(buttonText: "ALT", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.brightButtonColor, bgColor1: self.dataRouter.myColors.brightButtonColor, highlightColor: self.dataRouter.myColors.brightShortPressColor)
                            .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2))

                        Spacer()
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                    }

                        Spacer()
                    
                }.navigationBarTitle(Text(""), displayMode: .inline) // relates to bug: https://stackoverflow.com/questions/58512344/swiftui-navigation-bar-button-not-clickable-after-sheet-has-been-presented

            }
            
            
        }
        
    }
}
