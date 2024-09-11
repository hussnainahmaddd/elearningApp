//
//  HomeView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(
        entity: Feed.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Feed.courseName, ascending: true)]
    ) var items: FetchedResults<Feed>
    
    @State var showCourse : Bool = false

    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack{
                    Spacer()
                        .frame(height:30)
                    Text("Welcome to E-learning App")
                        .frame(width: UIScreen.screenWidth-30, alignment: .center)
                        .font(Font.title)
                        .foregroundColor(Color.darkGreyColor)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Spacer()
                        .frame(height:35)
                    
                    HStack {
                        Text("Learn Swift")
                            .font(Font.subheadline)
                        Spacer()
                        Button{
                            
                        } label:{
                            Text("View all")
                                .font(Font.caption)
                                .foregroundColor(Color.darkGreyColor)
                                .padding(.trailing, 7)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
                    ScrollView(.horizontal, showsIndicators: false)    {
                        HStack {
                            ForEach((items), id: \.self)
                            { value in
                                if let imageData = value.courseImage{
                                    if let uiImage = UIImage(data: imageData)
                                    {
                                        NavigationLink(destination: CourseDetailView(courseImage: .constant(uiImage), title: .constant(value.courseName ?? ""), description: .constant(value.courseDescription ?? "" ), price: .constant(value.coursePrice ?? "")), isActive: $showCourse) {
                                            
                                            CourseCardView(courseImage: .constant(uiImage), title: .constant(value.courseName ?? ""), description: .constant(value.courseDescription ?? ""), price: .constant("\(value.coursePrice ?? "") $"))
                                                .onTapGesture {
                                                    self.showCourse.toggle()
                                                }
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                        Spacer()
                        .frame(height:35)
                    
                    HStack {
                        Text("Learn SwiftUI")
                            .font(Font.subheadline)
                        Spacer()
                        Button{
                            
                        } label:{
                            Text("View all")
                                .font(Font.caption)
                                .foregroundColor(Color.darkGreyColor)
                                .padding(.trailing, 7)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false)    {
                        HStack {
                            ForEach((items), id: \.self)
                            { value in
                                if let imageData = value.courseImage{
                                    if let uiImage = UIImage(data: imageData)
                                    {
                                        NavigationLink(destination: CourseDetailView(courseImage: .constant(uiImage), title: .constant(value.courseName ?? ""), description: .constant(value.courseDescription ?? "" ), price: .constant(value.coursePrice ?? "")), isActive: $showCourse) {
                                            
                                            CourseCardView(courseImage: .constant(uiImage), title: .constant(value.courseName ?? ""), description: .constant(value.courseDescription ?? ""), price: .constant("\(value.coursePrice ?? "") $"))
                                                .onTapGesture {
                                                    self.showCourse.toggle()
                                                }
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                        
                        
                        
                        
                    }
              
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
