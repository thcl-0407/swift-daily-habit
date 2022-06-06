import SwiftUI
import RealmSwift

struct MainView: View {
    var body: some View {
        NavigationView{
            VStack{
                HabitSummary()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
