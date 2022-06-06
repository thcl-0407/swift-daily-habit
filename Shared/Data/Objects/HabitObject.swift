import Foundation
import RealmSwift

class HabitObject : Object, Identifiable{
    @Persisted(primaryKey: true) var habitId: ObjectId
    @Persisted var habitName: String
    @Persisted var startDate: Date = Date.now
    @Persisted var createdDate: Date = Date.now
    @Persisted var numOfDayToDo: Int = 1
    @Persisted var reminderType: ReminderType = .Daily
    @Persisted var reminderDate: Date = ExtendDateFormatter.init().getTime(strDate: "09:00").unsafelyUnwrapped
    @Persisted var habitDetails: RealmSwift.List<HabitDetailObject> = List<HabitDetailObject>()
}
