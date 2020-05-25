import SwiftUI

struct ButtonConfiguratorView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentButtonConfigurator: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.white
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.02))
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.03)
                        
                        Text("Button Configurator")
                            .foregroundColor(Color.black)
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.03)
                    
                        Text("Reorder the below list of functions by moving each row (long press on the three grey lines to the right and then drag the row up or down). Dismiss this page when done (all changes are autosaved).")
                            .foregroundColor(Color.black)
                            .font(.body)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.01)
                    
                    Button(action: {

                       self.dataRouter.buttonList = self.dataRouter.defaultButtonList
                       self.dataRouter.defaults.set(self.dataRouter.buttonList, forKey: "SavedButtonList")
                                           

                                          
                                          }) {
                                          Text("Reset to Defaults")
                                              .font(self.dataRouter.operatorFont)
                                              
                                      }
                                      .foregroundColor(self.dataRouter.myColors.specialBackgroundText(self.dataRouter.darkMode))
                                      .frame(width: geometry.size.width * CGFloat(0.9), height: geometry.size.width * CGFloat(0.1))
                                      .background(self.dataRouter.myColors.deleteHighlight(self.dataRouter.darkMode))
                                      .cornerRadius(15)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.03)
                    
                    NavigationView {
                            List {
                                ForEach(self.dataRouter.buttonList, id: \.self) { user in
                                    Text(user)
                                }
                                .onMove(perform: self.move)
                            }
                            //.listStyle(GroupedListStyle())
                            .environment(\.editMode, .constant(.active))
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }

   
                    
                    }
                    
                    
                        
                    }

                    Spacer()
                    
                }
            }
            
            func move(from source: IndexSet, to destination: Int) {
                self.dataRouter.buttonList.move(fromOffsets: source, toOffset: destination)
                self.dataRouter.defaults.set(self.dataRouter.buttonList, forKey: "SavedButtonList")
        }
        
}

