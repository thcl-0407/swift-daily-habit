import SwiftUI

struct HabitSummary: View {
    @State var isPresentingAddHabit = false
    
    var body: some View {
        let _gridItems: [GridItem] = HabitGridItem.init().BuildGridItems()
        
        VStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns: _gridItems){
                        ForEach(0..<10){ i in
                            NavigationLink(destination: {
                                Text("Open")
                            }, label: {
                                VStack{
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                    Text("Habit \(i + 1)")
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
                            })
                            .foregroundColor(.black)
                            .padding(5)
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
}

struct HabitSummary_Previews: PreviewProvider {
    static var previews: some View {
        HabitSummary()
            .previewInterfaceOrientation(.portrait)
    }
}
