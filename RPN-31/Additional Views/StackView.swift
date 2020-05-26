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
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)

                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageHeaderGap)
                    
                        Text("Stack View")
                            .foregroundColor(Color.black)
                            .font(.title)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                    
                        Text("Reorder by touching down on the three grey lines to the right and then drag the row up or down. Dismiss this page when done (all changes are autosaved).")
                            .foregroundColor(Color.black)
                            .font(.body)
                            .padding(self.dataRouter.mySizes.textPadding)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width:geometry.size.width, height: geometry.size.height * self.dataRouter.mySizes.subPageTableGap)
                    
                    NavigationView {
                            List {
                                ForEach(0..<self.dataRouter.calculator.stackRegisters.count) { i in
                                    
                                    Text(self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[i]))
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


