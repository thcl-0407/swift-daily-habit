import Foundation
import RealmSwift

class HabitDetailObject : Object, Identifiable{
    @Persisted(primaryKey: true) var habitDetailId: ObjectId
    @Persisted var createdDate: Date = Date.now
    @Persisted var index: Int = 0
    @Persisted var status: HabitDetailStatus
}
