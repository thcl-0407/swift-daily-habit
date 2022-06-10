import SwiftUI
import Realm
import RealmSwift

struct AddHabitPresent: View {
    @Binding var isPresentingSheet: Bool
    @ObservedResults(HabitObject.self) var habits
    @State var startDate = Date.now
    @State var habitName = String.init()
    @State var numOfDay = 1
    @State var isDailyReminder = false
    @State var isEditStartDate = false
    @State var reminderTime = ExtendDateFormatter.init().getTime(strDate: "09:00").unsafelyUnwrapped
    var shortDateFormatter: DateFormatter = ExtendDateFormatter.init().shortDate()
    var shortTimeFormatter: DateFormatter = ExtendDateFormatter.init().shortTime()
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Button(action: {
                    isPresentingSheet = false
                }, label: {
                    Image(systemName: "arrow.left.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 38, height: 38)
                        .foregroundColor(.gray)
                })
                Text("Add Habit")
                    .font(.system(size: 38))
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 32, leading: 15, bottom: 15, trailing: 15))
            
            ScrollView{
                VStack(spacing: 20){
                    VStack(spacing: 2){
                        HStack{
                            Text("Name")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        TextField("Example: Swin, Gym,...", text: self.$habitName)
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(spacing: 2){
                        HStack{
                            Text("Number Of Days")
                                .fontWeight(.semibold)
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("1", value: self.$numOfDay, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(spacing: 2){
                        HStack{
                            Text("Start Date")
                                .fontWeight(.semibold)
                                .padding(0)
                            Spacer()
                            Text("\(self.shortDateFormatter.string(from: self.startDate))")
                            Toggle("", isOn: self.$isEditStartDate)
                                .fixedSize()
                                .frame(alignment: .leading)
                        }
                        if(self.isEditStartDate){
                            DatePicker("", selection: self.$startDate, displayedComponents: .date)
                                .datePickerStyle(.wheel)
                                .fixedSize()
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    VStack(spacing: 2){
                        HStack{
                            Text("Reminder")
                                .fontWeight(.semibold)
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack{
                            HStack{
                                Text("Daily")
                                Spacer()
                                if(!self.isDailyReminder){
                                    Text("\(self.shortTimeFormatter.string(from: self.reminderTime))")
                                }
                                if(self.isDailyReminder){
                                    DatePicker("", selection: self.$reminderTime, displayedComponents: .hourAndMinute)
                                        .datePickerStyle(.automatic)
                                        .fixedSize()
                                        .frame(alignment: .leading)
                                }
                                Toggle("", isOn: self.$isDailyReminder)
                                    .fixedSize()
                                    .frame(alignment: .leading)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                Spacer()
            }
        }
        
        Button(action: {
            let habit = HabitObject()
            habit.habitName = habitName
            habit.numOfDayToDo = numOfDay
            habit.startDate = startDate
            habit.reminderType = .Daily
            habit.reminderDate = reminderTime
            habit.habitDetails = RealmSwift.List<HabitDetailObject>()
            for index in 0..<numOfDay {
                let habitDetail = HabitDetailObject()
                habitDetail.createdDate = Date.now
                habitDetail.status = .New
                habitDetail.index = index
                habit.habitDetails.append(habitDetail)
            }
            $habits.append(habit)
            isPresentingSheet = false
        }, label: {
            Text("OK")
                .frame(width: 220, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                        .green
                    )
                )
                .foregroundColor(.white)
                .font(.system(size: 16))
        })
        Spacer()
    }
}
