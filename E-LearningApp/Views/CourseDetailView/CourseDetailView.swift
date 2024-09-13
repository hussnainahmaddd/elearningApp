//
//  CourseDetailView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI






struct CourseDetailView: View {
    
   


   
    @State var selectedFrameIndex = 13
    @State private var categories : [String] = ["A3","50X70","70X100","100X140"]
    @State var categoriesIndex : [Int] = [1,0,0,0]
    let columns : [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    let catColumns : [GridItem] = [
        GridItem(.fixed(50), spacing: 30),
                GridItem(.fixed(50), spacing: 30),
        GridItem(.fixed(50), spacing: 30),
                GridItem(.fixed(50), spacing: 30),
        GridItem(.fixed(50), spacing: 30)


    ]
    @State var cartIncrement = 1
    @Binding var courseImage : UIImage
    @Binding var title : String
    @Binding var description : String
    @Binding var price :  String
    @Environment(\.managedObjectContext) var moc
    let width = UIScreen.screenWidth/2-20
    @State var enrollUser : Bool = false
    var body: some View {
        VStack{
            
        

            ScrollView(.vertical, showsIndicators: false)  {
    
                Group{
                    
                    
                    Image(uiImage: courseImage)
                        .resizable()
                        .frame(width: UIScreen.screenWidth-40,height: UIScreen.screenHeight*0.55)
                    
                    
                }
                
                //MARK: New stack
                Group{
                    LazyHGrid(
                        rows: columns,
                        spacing: UIScreen.screenWidth/1.7
                        
                    ) {
                        VStack{
                            Text(title)
                                .font(.headline)
                                .frame(maxWidth: 200, alignment: .leading)
                            
                            Spacer()
                                .frame(height:3)
                            Text("Learn \(title) with us")
                                .font(.caption)
                                .foregroundColor(Color.greyColor)
                                .frame(maxWidth: width-20, alignment: .leading)
                            
                        }
                        HStack{
                            Button{
                            }
                        label: {
                            Image("Like-active")
                        }
                        .frame( height: 53, alignment: .center)
                            Text("333")
                                .font(Font.caption)
                                .foregroundColor(Color.greyColor)
                                .frame(maxWidth: width-20, alignment: .leading)
                            
                        }
                        .padding(.top, -20)
                    }
                    .frame(width: UIScreen.screenWidth, alignment: .center)
                    Spacer()
                        .frame(height: 15)
                    LazyHGrid(
                        rows: columns,
                        spacing: UIScreen.screenWidth/1.6
                        
                    ) {
                        Text("\(price) $")
                            .font(Font.headline)
                        
                    
                        HStack{
                            if enrollUser{
                                Image("green-tick")
                                Text("Availible")
                                    .font(.caption)
                                    .foregroundColor(Color.greyColor)
                            }
                            else
                            {
                                Text("enroll user")
                                    .underline()
                                    .font(.caption)
                                    .foregroundColor(Color.black)
                                    .onTapGesture {
                                        self.enrollUser.toggle()
                                    }
                            }
                                
                        }
                    }
                    Spacer()
                        .frame(height: 10)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(Color.greyColor)
                        .frame(width: UIScreen.screenWidth-30)
                    
                }
                
                Spacer()
                    .frame(height: 40)
                
            
                    AccordianView(listOfAccordions: [
                        ["Outline 1",
                         "Course outline will come here"
                        ],
                        ["Outline 2",
                         "Course outline will come here"
                        ],
                        ["Outline 3",
                         "Course outline will come here"
                        ],
                        ["Outline 4",
                         "Course outline will come here"
                        ]
                        ,
                        ["Outline 5",
                         "Course outline will come here"
                        ]
                        ,
                        ["Outline 6",
                         "Course outline will come here"
                        ]
                        ,
                        ["Outline 7",
                         "Course outline will come here"
                        ]
                    ])
                    
                Rectangle()
                    .frame(width: UIScreen.screenWidth, height: 120)
                    .padding(.bottom,-40)
                    .background(Color.white)
                    .foregroundColor(.white)
                    .overlay(
                        LazyHGrid(
                            rows: columns,
                            spacing: UIScreen.screenWidth/6
                            
                        ) {                        HStack{
                                
                                Button(action:{
                                    if cartIncrement > 1
                                    {
                                        cartIncrement =  cartIncrement - 1
                                    }
                                },
                                       label:{
                                    Image("remove-item-icon")
                                })
                                
                                Text("\(cartIncrement)")
                                    .font(Font.body)
                                    .frame(width: 30)
                                
                               
                                Button(action:{
                                    cartIncrement =  cartIncrement + 1
                                },
                                       label:{
                                    Image("add-item-icon")
                                })
                            }
                            
                            Button(action:{
                                updateCourseInCart()
                            },
                                   label: {
                                       Text("Add to cart")
                                    .font(.caption)
                                           .fontWeight(.medium)
                                           .frame(width: 150,  alignment: .center)
                                   
                                   })
                            .buttonStyle(.borderedProminent)
                            .tint(Color.blackColor)
                            .controlSize(.large)
                            .frame( height: 60, alignment: .center)
                        }
                            .padding(.top)
                            
                        )
                }
                //MARK: scrollview ends here
                
            
        
            }
           
        }
    func updateCourseInCart() {
        
    
            let addFeed = Cart(context: self.moc)
        addFeed.name = self.title
            addFeed.courseName = self.title
        addFeed.price = self.price
        addFeed.courseDescription = self.description
        addFeed.quantity = String( self.cartIncrement)
        addFeed.courseImage = courseImage.jpegData(compressionQuality: 0.7)
            
            do {
                
                try self.moc.save()
                print("data Saved")
                
            } catch {
                print("whoops \(error.localizedDescription)")
                
                
            }
        
    }
    }
    func setupAppearance() {
       UIPageControl.appearance().currentPageIndicatorTintColor = .black
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
     }


