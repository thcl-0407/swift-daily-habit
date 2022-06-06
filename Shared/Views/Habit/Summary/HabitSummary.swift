import SwiftUI
import Foundation
import Realm
import RealmSwift

struct HabitSummary: View {
    @State var isPresentingAddHabit = false
    @State var isActive = false
    @State var selection: ObjectId?
    @ObservedResults(HabitObject.self, sortDescriptor: SortDescriptor(keyPath: "createdDate", ascending: false)) var habits
    
    var body: some View {
        let _gridItems: [GridItem] = HabitGridItem.init().BuildGridItems()
        
        VStack{
            if(habits.isEmpty){
                Spacer()
                Image("Breakable")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                Text("Not Thing Here")
                    .foregroundColor(.init(.sRGB, red: 190/255, green: 190/255, blue: 190/255, opacity: 1))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }else{
                ScrollView{
                    LazyVGrid(columns: _gridItems){
                        ForEach(self.habits, id: \.self){ habit in
                            NavigationLink(destination: HabitDetail(habit: habit), tag: habit.habitId, selection: self.$selection, label: {
                                VStack{
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                    Text("\(habit.habitName)")
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                .frame(width: 68, height: 68)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(.gray, lineWidth: 1)
                                )
                                .padding(0)
                                .onTapGesture(perform: {
                                    self.selection = habit.habitId
                                })
                            })
                            .foregroundColor(.black)
                            .padding(5)
                        }
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                isPresentingAddHabit = true
            }, label: {
                Text("Add Habit")
                    .frame(width: 220, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(
                            .green
                        )
                    )
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            })
            .sheet(isPresented: $isPresentingAddHabit, content: {
                AddHabitPresent(isPresentingSheet: $isPresentingAddHabit)
            })
        }
    }
}
