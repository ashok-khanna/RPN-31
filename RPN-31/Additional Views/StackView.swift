/* Status: Completed */

import SwiftUI

struct StackView: View {
    @EnvironmentObject var dataRouter: DataRouter
    
    @Binding var presentStackRegister: Bool
    
    @State var rowsDeleted = false
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                self.dataRouter.myColors.secondaryBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    
                    VStack(spacing: 0) {
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageTopDivider)
                        
                        
                        HStack(spacing: 0){
                            
                            Spacer()
                            
                            Text("Stack View")
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
                            
                            Text("Reorder by touching down on the three gray lines to the right and then drag the row up or down. Dismiss this page when done (all changes are autosaved). Ignore the zeros that are added to the end whenever you delete a row (these will be removed when you dismiss the page)")
                                .foregroundColor(self.dataRouter.myColors.secondarySubPageTextColor)
                                .font(self.dataRouter.myFonts.subPageTextFont)
                                .minimumScaleFactor(self.dataRouter.mySizes.minimumScaleFactor)
                                .padding(0)
                            
                            Spacer()
                            
                        }.frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth)
                        
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageBodyGap)
                        
                        HStack(spacing: 0){
                            
                            Spacer()
                            
                            SimpleButton(buttonText: "Reset Stack Registers", width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight, bgColor: self.dataRouter.myColors.secondarySpecialFillColor, bgColor1: self.dataRouter.myColors.secondarySpecialFillColor, highlightColor: self.dataRouter.myColors.purpleButtonColor)
                                .frame(width: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonWidth, height: geometry.size.width * self.dataRouter.mySizes.subPageMainButtonHeight)
                                .onAppear() {
                                    self.dataRouter.defaults.set(self.dataRouter.calculator.stackRegisters, forKey: "tempStackRegisterStore")
                            }
                            
                            Spacer()
                            
                            
                        }
                        
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 0, height: geometry.size.height * self.dataRouter.mySizes.subPageEditableTableGap)
                        
                        
                    }
                                       
                    
                    ForEach(0..<self.dataRouter.calculator.stackRegisters.count) { i in
                        
                        Text(self.dataRouter.calculator.stackRegisters.count > i ? self.dataRouter.displayFormatter.string(self.dataRouter.calculator.stackRegisters[i]) : "Error")
                            .font(self.dataRouter.myFonts.subPageTextFont)
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    
                }
                    //.listStyle(GroupedListStyle())
                    .environment(\.editMode, .constant(.active))
                    .navigationBarTitle(Text(""), displayMode: .inline) // relates to bug: https://stackoverflow.com/questions/58512344/swiftui-navigation-bar-button-not-clickable-after-sheet-has-been-presented
                    .navigationBarHidden(true)
                
                Spacer()
                
            }
            
        }.onDisappear { self.clean() }
        
        
    }
    
    func generateRows() -> [String] {
        (0..<100).reduce([]) { $0 + ["Row \($1)"] }
    }
    
    func move(from source: IndexSet, to destination: Int) {
    self.dataRouter.calculator.stackRegisters.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
    self.dataRouter.calculator.stackRegisters.remove(atOffsets: offsets)
    self.dataRouter.calculator.stackRegisters.append(0.0)
    self.rowsDeleted = true
    }
    
    func clean(){
    
        if self.rowsDeleted {
    
            var cleaned = [Double]()
    
            var startFlag = false
    
            for i in self.dataRouter.calculator.stackRegisters.reversed() {
                if !startFlag {
    
                if i != 0.0 {
                    startFlag = true
                    cleaned.append(i)
                }
                } else {
                    cleaned.append(i)
                }
            }
        
            self.dataRouter.calculator.stackRegisters = cleaned.reversed()
    
    
    
    }
    }
    
}


