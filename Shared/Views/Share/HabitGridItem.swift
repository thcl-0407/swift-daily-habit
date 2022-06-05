import Foundation
import SwiftUI

class HabitGridItem{
    private var _numOfColumn: Int
    private var _flexMin: CGFloat
    private var _flexMax: CGFloat
    
    init(){
        _numOfColumn = 3
        _flexMin = 0
        _flexMax = 0
    }
    
    init(numOfColumn: Int){
        _numOfColumn = numOfColumn
        _flexMin = 5
        _flexMax = 5
    }
    
    init(numOfColumn: Int, flexMin: CGFloat, flexMax: CGFloat){
        _numOfColumn = numOfColumn
        _flexMin = flexMin
        _flexMax = flexMax
    }
    
    func BuildGridItems() -> [GridItem]{
        var result: [GridItem] = [GridItem].init()
        
        for _ in 0..<_numOfColumn{
            result.append(GridItem(.flexible()))
        }
        
        return result
    }
    
    func BuildGridItems(numOfColumn: Int, flexMin: CGFloat, flexMax: CGFloat) -> [GridItem]{
        var result: [GridItem] = [GridItem].init()
        
        for _ in 0..<numOfColumn{
            result.append(GridItem(.flexible(minimum: flexMin, maximum: flexMax)))
        }
        
        return result
    }
}
