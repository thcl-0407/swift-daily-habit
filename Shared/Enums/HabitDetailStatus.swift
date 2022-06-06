import Foundation
import RealmSwift

enum HabitDetailStatus : Int, PersistableEnum{
    case New = 1
    case Success = 2
    case Fail = 3
}
