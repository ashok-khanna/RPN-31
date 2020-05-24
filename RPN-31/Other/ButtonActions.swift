
/*
 
 
 @objc func zeroButtonLongAction(gesture: UILongPressGestureRecognizer){
     
     let longPressEndTime = NSDate.timeIntervalSinceReferenceDate - zeroButton.longPressStartTime
     
     switch gesture.state {
         
     case .began:
         zeroButton.longPressStartTime = NSDate.timeIntervalSinceReferenceDate
         
         zeroButton.highlightColor = .lightGray
         zeroButton.isHighlighted = true
         
     case .changed:
         if longPressEndTime > longPressRequiredTime {
             zeroButton.highlightColor = longHighlightColor
             zeroButton.isHighlighted = true
             storeBalance = true
             changeFunctionLabelToOrange("zero")
             
         } else {
             zeroButton.highlightColor = .lightGray
             zeroButton.isHighlighted = true
         }
         
     case .ended:
         changeFunctionLabelToLightGray("zero")
         if longPressEndTime > longPressRequiredTime {
             storeBalance = false
             zeroButton.isHighlighted = false
             zeroButton.highlightColor = .lightGray

             return
         }
         else {
             zeroButton.isHighlighted = false
             processDigit(zeroButton)
             clearLastRegisters()
             updateXRegisterDisplay(resultMode: false)
         }
         
     default:
         break
     }
     
 }
 
 @objc func decimalButtonLongAction(gesture: UILongPressGestureRecognizer){
        
        let longPressEndTime = NSDate.timeIntervalSinceReferenceDate - decimalButton.longPressStartTime
        
        switch gesture.state {
            
        case .began:
            decimalButton.longPressStartTime = NSDate.timeIntervalSinceReferenceDate
            decimalButton.highlightColor = .lightGray
            decimalButton.isHighlighted = true
            
        case .changed:
            if longPressEndTime > longPressRequiredTime {
                decimalButton.highlightColor = longHighlightColor
                decimalButton.isHighlighted = true
                recallBalance = true
                changeFunctionLabelToOrange("decimal")
            } else {
                decimalButton.isHighlighted = true
            }
            
        case .ended:
            changeFunctionLabelToLightGray("decimal")
            if longPressEndTime > longPressRequiredTime {
                recallBalance = false
                decimalButton.isHighlighted = false
                decimalButton.highlightColor = .lightGray

                return
            }
            else {
                decimalButton.isHighlighted = false
                decimalInput()
            }
            
        default:
            break
        }
        
    }
    
    

    
    func completeOperation(button: CalculatorButton, gesture: UILongPressGestureRecognizer) {
        let longPressEndTime = NSDate.timeIntervalSinceReferenceDate - button.longPressStartTime
        let buttonOperation = button.operationString ?? ""
        
        switch gesture.state {
            
        case .began:
            button.longPressStartTime = NSDate.timeIntervalSinceReferenceDate
            
            button.isHighlighted = true
            
        case .changed:
            if longPressEndTime > longPressRequiredTime {
                button.highlightColor = longHighlightColor
                button.isHighlighted = true
                changeFunctionLabelToOrange(button.digitString!)
                
                if !(storeBalance || recallBalance){
                    
                    updateXRegisterDisplayForFunction(buttonOperation)
                    
                } else {

                    button.isHighlighted = true
                }
            }
            
            
        case .ended:
            updateLastDisplayToNil()
            changeFunctionLabelToLightGray(button.digitString!)
            if longPressEndTime > longPressRequiredTime {

                if !(storeBalance || recallBalance){
                    
                    button.isHighlighted = false
                    button.highlightColor = .lightGray
                    processOperation(buttonOperation)
                    updateDisplays(afterOperation: true)
                    
                    return
                } else {
                    button.isHighlighted = false
                    button.highlightColor = .lightGray
                    processStoreRecall(button)
                    updateXRegisterDisplay(resultMode: false)
                }
            } else {
                button.isHighlighted = false
                
                if !(storeBalance || recallBalance){
                    processDigit(button)
                    updateXRegisterDisplay(resultMode: false)
                } else {
                    processStoreRecall(button)
                    clearLastRegisters()
                    updateXRegisterDisplay(resultMode: false)
                }
                
            }
            
        default:
            break
        }
    }
    
 
    }
    
    

    
 
 */
