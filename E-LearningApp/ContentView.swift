//
//  ContentView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  
    let courseArray : [String] = ["CourseImage-0","CourseImage-1", "CourseImage-2", "CourseImage-3"]

    @Environment(\.managedObjectContext) var moc
    @State  var name:  [String] = ["Swift","SwiftUI", "Swift 5.2", "SwiftUI"]
    @State var courseName: String = "SwiftUI"
    @State  var coursePrice: String = "2.99"
    @State var courseDescription: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    @State var isActive : Bool = false
    @State var userSettings = UserSettings()
    let persistenceController = PersistenceController.shared



    var body: some View {
        
        if isActive{
            TabBarView(tabSelection: 0)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
        else
        {
            Text("Loading Data....")
                .onAppear{
                    self.prepareApp()
                }
        }
        
       
    }
    
    
    func prepareApp()
    {
    
            
        for i in 0..<courseArray.count {
                let addFeed = Feed(context: self.moc)
                let image = UIImage(named: courseArray[i])
                addFeed.course = self.courseName
                addFeed.courseName = self.name[i]
                addFeed.coursePrice = self.coursePrice
                addFeed.courseDescription = self.courseDescription
                addFeed.courseImage = image?.jpegData(compressionQuality: 0.7)
                
                do {
                    
                    try self.moc.save()
                    print("data Saved")
                    
                } catch {
                    print("whoops \(error.localizedDescription)")
                    
                    
                }
            }
        
        self.isActive.toggle()
        
        
        
        

        
    }


}

#Preview {
    ContentView()
}
