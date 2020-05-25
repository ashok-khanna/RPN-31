import SwiftUI

struct StackView: View {
    @EnvironmentObject var dataRouter: DataRouter
    @Binding var presentStackRegister: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                Color.white
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Rectangle()
                        .fill(self.dataRouter.myColors.stackRegisters(self.dataRouter.darkMode))
                        .frame(width: geometry.size.width, height: geometry.size.height * CGFloat(0.02))
                        
                        Text("Stack View")
                            .foregroundColor(Color.black)
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.02)
                    
                        Text("Reorder by touching down on the three grey lines to the right and then drag the row up or down. Dismiss this page when done (all changes are autosaved).")
                            .foregroundColor(Color.black)
                            .font(.body)
                    
                    
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * 0.03)
                    
                    NavigationView {
                            List {
                                ForEach(self.dataRouter.calculator.stackRegisters, id: \.self) { user in
                                    Text(self.dataRouter.displayFormatter.string(user))
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
                self.dataRouter.calculator.stackRegisters.move(fromOffsets: source, toOffset: destination)
        }
        
}


