import SwiftUI
import RealmSwift
import Realm

extension ReminderType {
    var getCaseName: String {
        switch(self.rawValue){
        case ReminderType.Daily.rawValue:
            return "Daily"
        default:
            return "Daily"
        }
    }
}

struct HabitDetail: View {
    @ObservedResults(HabitObject.self) var habits
    @ObservedRealmObject var habit: HabitObject
    let _gridItems: [GridItem] = HabitGridItem.init().BuildGridItems(numOfColumn: 5)
    @State var isOptionDialog = false
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack(spacing: 0){
                        Text("\(habit.reminderType.getCaseName) at \(ExtendDateFormatter.init().shortTime().string(from: habit.reminderDate)) ")
                        Text("from \(ExtendDateFormatter.init().shortDate().string(from: habit.startDate))")
                    }
                }
                Spacer()
            }
            .padding(.leading)
            .foregroundColor(.gray)
            
            ScrollView{
                LazyVGrid(columns: _gridItems){
                    ForEach(0..<habit.numOfDayToDo, id: \.self){ index in
                        Button(action: {
                            self.isOptionDialog = true
                        }, label: {
                            VStack{
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                Text("\(index + 1)")
                            }
                        })
                        .foregroundColor(.black)
                        .confirmationDialog("Change Status", isPresented: self.$isOptionDialog, actions: {
                            Button("Success"){
                                
                            }
                            Button("Fail", role: .destructive){
                                
                            }
                            Button("Clear"){
                                
                            }
                        })
                    }
                }
            }
            .navigationTitle(habit.habitName)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        $habits.remove(habit)
                    }, label: {
                        Image(systemName: "trash")
                            .imageScale(.large)
                            .foregroundColor(.red)
                    })
                })
            })
            
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Edit")
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
}
