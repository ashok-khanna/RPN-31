import SwiftUI

struct FunctionView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentFunctionPage: Bool
    @State var presentButtonConfigurator = false

    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.background(self.dataRouter.darkMode)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.02))
                        
                        Text("Advance Functions")
                            .foregroundColor(self.dataRouter.myColors.text(self.dataRouter.darkMode))
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.05)
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[8])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[8])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[9])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[9])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[10])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[10])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.copyToClipboard()
                            self.presentFunctionPage = false
                            
                            }) {
                            Image(systemName:"doc.on.doc.fill")
                                .foregroundColor(.white)
                                .font(Font.title.weight(.regular))
                                
                            Text("Copy")
                                .foregroundColor(.white)
                                .font(.caption)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        
                    }
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.width * 0.02)
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[11])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[11])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[12])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[12])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.processOperation(self.dataRouter.buttonList[13])
                            self.presentFunctionPage = false
                            
                            }) {
                            Text(self.dataRouter.buttonList[13])
                                .font(self.dataRouter.operatorFont)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        Button(action: {

                            self.dataRouter.calculator.pasteFromClipboard()
                            self.presentFunctionPage = false
                            
                            }) {
                            Image(systemName:"doc.richtext")
                                .foregroundColor(.white)
                                .font(Font.title.weight(.regular))
                                
                            Text("Paste")
                                .foregroundColor(.white)
                                .font(.caption)
                                
                        }
                        .foregroundColor(self.dataRouter.myColors.advanceButtonText(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width * CGFloat(0.2), height: geometry.size.width * CGFloat(0.2))
                        .background(self.dataRouter.myColors.advanceButton(self.dataRouter.darkMode))
                        .cornerRadius(15)
                        
                        Spacer()
                        
                        
                    }

                    
                      Button(action: {

                        self.presentButtonConfigurator = true

                        
                        }) {
                        Text("Button Configurator")
                            .font(self.dataRouter.operatorFont)
                            
                    }
                    .foregroundColor(self.dataRouter.myColors.specialBackgroundText(self.dataRouter.darkMode))
                    .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.2))
                    .background(self.dataRouter.myColors.specialBackground(self.dataRouter.darkMode))
                    .cornerRadius(15)
                    .sheet(isPresented: self.$presentButtonConfigurator) {
                        ButtonConfiguratorView(presentButtonConfigurator: self.$presentButtonConfigurator).environmentObject(self.dataRouter)
                    }
                    Spacer()
                    
                }
            }
            
            
        }
        
    }
}
