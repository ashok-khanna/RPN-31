import SwiftUI

struct FunctionView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentFunctionPage: Bool
    @State var presentButtonConfigurator = false
    @State var presentGuidePage = false

    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.background(self.dataRouter.darkMode)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width  * CGFloat(0.2), height: geometry.size.height * CGFloat(0.02))
                        
                        Text("Advance Functions")
                            .foregroundColor(self.dataRouter.myColors.text(self.dataRouter.darkMode))
                            .font(.title)
                    
                    
                      Spacer()

                    AdvanceButton2(buttonText: "Button Configurator", width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.1), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.specialBackground(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.specialBackground(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                    .sheet(isPresented: self.$presentButtonConfigurator) {
                    ButtonConfiguratorView(presentButtonConfigurator: self.$presentButtonConfigurator).environmentObject(self.dataRouter)
                    }
                    
                    Spacer()
                    
                    
                    VStack(spacing: 0) {
                            
                        HStack(spacing: 0) {
                            
                            Spacer()
                            
                            AdvanceButton(index: 8, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                                
                            Spacer()
                            
                            AdvanceButton(index: 9, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            Spacer()
                            
                            AdvanceButton(index: 10, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            Spacer()
                            
                            AdvanceButton2(buttonText: "Copy", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            
                            Spacer()
                            
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                        HStack(spacing: 0) {
                            
                            Spacer()
                            
                            AdvanceButton(index: 11, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            Spacer()
                            
                            AdvanceButton(index: 12, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            Spacer()
                            
                            AdvanceButton(index: 13, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            Spacer()
                            
                            AdvanceButton2(buttonText: "Paste", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                            
                            Spacer()
                            
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                        HStack(spacing: 0) {
                        
                        Spacer()
                        
                            AdvanceButton(index: 14, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                        
                            AdvanceButton(index: 15, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                        
                            AdvanceButton(index: 16, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                            
                            AdvanceButton2(buttonText: "Guide", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
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
                        
                            AdvanceButton(index: 17, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                        
                            AdvanceButton(index: 18, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                        
                            AdvanceButton(index: 19, width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                        
                        Spacer()
                            
                            AdvanceButton2(buttonText: "ALT", width: geometry.size.width  * CGFloat(0.2), height: geometry.size.width  * CGFloat(0.2), presentFunctionPage: self.$presentFunctionPage, presentButtonConfigurator: self.$presentButtonConfigurator, presentGuidePage: self.$presentGuidePage, bgColor: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), bgColor1: self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode), highlightColor: self.dataRouter.myColors.advanceHighlight(self.dataRouter.darkMode))
                            
                        Spacer()
                            
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width:geometry.size.width, height: geometry.size.width * 0.04)
                        
                    }

                    
                    Spacer()
                    
                }
            }
            
            
        }
        
    }
}
