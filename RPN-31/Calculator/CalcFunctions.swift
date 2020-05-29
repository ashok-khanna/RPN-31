import Foundation

extension Calculator {
    
    mutating func processOperation(_ operation: String){
        
        clearMode = false
        
        if operation == "MAG8" {
            clearLastRegisters()
            
            let quoteList = ["As I see it, yes.", "Ask again later.", "Better not tell you now.", "Cannot predict now.", "Concentrate and ask again.", "Don't count on it.", "It is certain.", "It is decidedly so.", "Most likely.", "My reply is no.", "My sources say no.", "Outlook not so good.", "Outlook good.", "Reply hazy, try again.", "Signs point to yes.", "Very doubtful.", "Without a doubt.", "Yes.", "Yes - definitely.", "You may rely on it."].shuffled()
            
            clearLastRegisters()
            lastRegister.displayText = quoteList[0]
            return
        }
        
        
        stackAutoLift = true
        
        var unaryAction = false
        
        var xRegister = 0.0
        var yRegister = 0.0
        
        
        if stackRegisters.count > 0 {
            xRegister = stackRegisters[0]
        } else {
            stackRegisters.append(0.0)
        }
        
        if stackRegisters.count > 1 {
            yRegister = stackRegisters[1]
        }
        
        var xRegisterNew: Double
        
        switch operation {
            
        case "+":
            xRegisterNew = yRegister + xRegister
        case "-":
            xRegisterNew = yRegister - xRegister
        case "X":
            xRegisterNew = yRegister * xRegister
        case "DIV":
            xRegisterNew = yRegister / xRegister
        case "CHS":
            xRegisterNew = -1 * xRegister
            stackAutoLift = true // CHS is not an operation that should trigger stackautolift (removed this)
            unaryAction = true
            
        case "EE":
            xRegisterNew = yRegister * pow(10.0, Double(xRegister))
        case "√x":
            xRegisterNew = sqrt(xRegister)
            unaryAction = true
        case "x√y":
            xRegisterNew = pow(yRegister, 1.0 / xRegister)
        case "1/x":
            xRegisterNew = 1 / xRegister
            unaryAction = true
        case "%":
            xRegisterNew = yRegister * xRegister / 100
        case "% ∆":
            xRegisterNew = (xRegister - yRegister) / yRegister
        case "% T":
            xRegisterNew = xRegister / (yRegister + xRegister)
        case "e ᵡ":
            xRegisterNew = exp(xRegister)
            unaryAction = true
            
        case "e":
            xRegisterNew = exp(1)
            unaryAction = true
            
        case "ln x":
            xRegisterNew = log(xRegister)
            unaryAction = true
        case "y ᵡ":
            xRegisterNew = pow(yRegister, xRegister)
            
        case "x!":
            xRegisterNew = tgamma(xRegister + 1)
            unaryAction = true
        case "log10 x":
            xRegisterNew = log(xRegister)/log(10.0)
            unaryAction = true
        case "log2 x":
            xRegisterNew = log(xRegister)/log(2.0)
            unaryAction = true
        case "10 ᵡ":
            xRegisterNew = pow(10.0, xRegister)
            unaryAction = true
        case "2 ᵡ":
            xRegisterNew = pow(2.0, xRegister)
            unaryAction = true
        case "NCR":
            xRegisterNew = tgamma(yRegister + 1)/tgamma(yRegister - xRegister + 1)
        case "NPR":
            xRegisterNew = tgamma(yRegister + 1)/(tgamma(xRegister + 1) * tgamma(yRegister - xRegister + 1))
        case "SIN":
            xRegisterNew = sin(yRegister)
            unaryAction = true
        case "COS":
            xRegisterNew = cos(yRegister)
            unaryAction = true
        case "TAN":
            xRegisterNew = tan(yRegister)
            unaryAction = true
        case "ASIN":
            xRegisterNew = asin(yRegister)
            unaryAction = true
        case "ACOS":
            xRegisterNew = acos(yRegister)
            unaryAction = true
        case "ATAN":
            xRegisterNew = atan(yRegister)
            unaryAction = true
        case "π":
            xRegisterNew = Double.pi
            unaryAction = true
        case "D→R":
            xRegisterNew = Double.pi * yRegister / 180.0
            unaryAction = true
        case "R→D":
            xRegisterNew = 180.0 * yRegister / Double.pi
            unaryAction = true
        case "SINH":
            xRegisterNew = sinh(yRegister)
            unaryAction = true
        case "COSH":
            xRegisterNew = cosh(yRegister)
            unaryAction = true
        case "TANH":
            xRegisterNew = tanh(yRegister)
            unaryAction = true
        case "MEAN":
            xRegisterNew = stackRegisters.avg()
            unaryAction = true
        case "SDEV":
            xRegisterNew = stackRegisters.std()
            unaryAction = true
        case "RAND":
            xRegisterNew = Double.random(in: 0 ... 1)
            unaryAction = true
        case "DICE":
            xRegisterNew = Double(Int.random(in: 1 ... 6))
            unaryAction = true
        case "CASHF":
            
            if stackRegisters.count > 2 {
                let cashflow = stackRegisters[2]
                let frequency = stackRegisters[1]
                
                stackRegisters.removeFirst()
                stackRegisters.removeFirst()
                stackRegisters.removeFirst()
                
                var tempArray = [Double]()
                
                for i in (0 ... Int(xRegister)) {
                    
                    tempArray.append(cashflow)
                    tempArray.append(frequency + frequency * Double(i))
                    
                }
                
                stackRegisters.append(contentsOf: tempArray.reversed())
            }
            
            xRegisterNew = 0.0
            unaryAction = true
        case "NPV":
            xRegisterNew = stackRegisters.npv()
            unaryAction = true
        case "IRR":
            xRegisterNew = stackRegisters.irr()
            unaryAction = true
        case "PDF":
            xRegisterNew = (1.0/sqrt(2.0 * Double.pi)) * exp(-xRegister * xRegister / 2.0)
            unaryAction = true
        case "CDF":
            xRegisterNew = 0.5 * (erf(xRegister/sqrt(2.0)) + 1.0)
            unaryAction = true
        default:
            return
        }
        
        lastRegister.lastX = xRegister
        lastRegister.lastY = yRegister
        lastRegister.lastOperator = operation
        lastRegister.unaryAction = unaryAction
        lastRegister.updateLastDisplayAfterOperation()
        
        if !unaryAction {
            dropStackRegistersAfterBinaryOperation()
            stackRegisters.insert(xRegisterNew, at: 0)
        } else {
            stackRegisters[0] = xRegisterNew
        }
        
        
        if operation != "CHS" {
            xRegisterDecimals = 0
        }
        
        isNewNumberEntry = true
        

        
    }
    
    
    
}




extension Array where Element == Double {
    
    func sum() -> Element {
        return self.reduce(0, +)
    }
    
    func avg() -> Element {
        
        return self.sum() / Element(self.count)
    }
    
    func std() -> Element {
        let mean = self.avg()
        let v = self.reduce(0, { $0 + ($1-mean)*($1-mean) })
        return sqrt(v / (Element(self.count) - 1))
    }
    
    func npv() -> Element {
        
        if self.count < 2 { // Need at least three data points - value at zero, cashflow and cashflow period
             return 0.0
         }
         
         let rate = self.first!
         
         var tempCashflowArray = self
         
         tempCashflowArray.removeFirst()
         
         // Check that we have even number of flows
         
         if tempCashflowArray.count % 2 == 1 {
             return 0.0
             
         }
         
         var cashflowArray = [(Double, Double)]()
         
         for i in stride(from: 0, to: tempCashflowArray.count, by: 2) {
             
             cashflowArray.append((tempCashflowArray[i+1], tempCashflowArray[i]))
             
         }
        
        
        var NPV = 0.0
        
        for tuple in cashflowArray {
            
            NPV += tuple.0 / (pow(1.0 + rate, tuple.1))
            
        }
        
        return NPV
    }
    
    
    func irr() -> Element {
        
        if self.count < 2 { // Need at least three data points - value at zero, cashflow and cashflow period
            return 0.0
        }
        
        let NPV = self.first!
        
        var tempCashflowArray = self
        
        tempCashflowArray.removeFirst()
        
        // Check that we have even number of flows
        
        if tempCashflowArray.count % 2 == 1 {
            return 0.0
            
        }
        
        var cashflowArray = [(Double, Double)]()
        
        for i in stride(from: 0, to: tempCashflowArray.count, by: 2) {
            
            cashflowArray.append((tempCashflowArray[i+1], tempCashflowArray[i]))
            
        }
        
        // Complete IRR calculation
        
        //const
        let LOW_RATE = 0.0001 // 1bps
        let HIGH_RATE = 10.0 // 1000%
        let MAX_ITERATION = 1000 //iteration
        let PRECISION_REQ = 0.01 //percision
        
        
        var old: Double = 0.00;
        var new: Double = 0.00;
        var npv: Double = 0.00;
        var oldguessRate: Double = LOW_RATE;
        var newguessRate: Double = LOW_RATE;
        var guessRate: Double = LOW_RATE;
        var lowGuessRate: Double = LOW_RATE;
        var highGuessRate: Double = HIGH_RATE;
        
        for i in 0 ..< MAX_ITERATION {
            
            var tempNPV = 0.0
            
            for tuple in cashflowArray {
                
                tempNPV += tuple.0 / (pow(1.0 + guessRate, tuple.1))
                
            }
            
            npv = tempNPV - NPV
            
            if((npv > 0) && (npv < PRECISION_REQ)){break;}
            
            if(old == 0){
                old = npv;
            }else{
                old = new;
            }
            new = npv;
            
            if(i > 0)
            {
                if(old < new)
                {
                    if(old < 0 && new < 0){
                        highGuessRate = newguessRate;
                    }else{
                        lowGuessRate = newguessRate;
                    }
                }
                else
                {
                    if(old > 0 && new > 0){
                        lowGuessRate = newguessRate;
                    }else{
                        highGuessRate = newguessRate;
                    }
                }
            }
            oldguessRate = guessRate;
            guessRate = (lowGuessRate + highGuessRate) / 2;
            newguessRate = guessRate;
            
        }
        
        return guessRate
        
        
    }
    
}



struct Magic8 {
    


}
