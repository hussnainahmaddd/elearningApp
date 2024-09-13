//
//  CourseCardView'.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI



struct CourseCardView: View {
    
    @Binding var courseImage : UIImage
    @Binding var title : String
    @Binding var description : String
    @Binding var price : String
    
    let height = UIScreen.screenHeight*0.415165
    let width = (UIScreen.screenWidth*0.6384)
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.whiteColor)
                .frame(width: width, height: height)
                .shadow(color: Color.blackColor.opacity(0.09), radius: 1, x: 0, y: 0)
            
            VStack(spacing: 0) {
                Image(uiImage: courseImage)
                    .resizable()
                    .frame(height: UIScreen.screenHeight * 0.26)
                
                Spacer()
                    .frame(height: 8)
                
                VStack {
                    HStack{
                        Text(title)
                            .font(Font.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(1)
                        Text(price)
                            .font(Font.subheadline)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                        .frame(height:2)
                    HStack{
                        Text(description)
                            .font(Font.body)
                            .foregroundColor(Color.greyColor)
                            .lineLimit(10)
                            .multilineTextAlignment(.leading)
                       
                        
                    }
                   
                }
              
                    
                ShareLink(item: URL(string: "https://meet.google.com/wks-ipxe-vph")!)
                {
                    Label("Share", systemImage: "green-tick")
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .frame(width: width, height: height)
        }
        
        
    }
    
    func shareAURL()
    {
        guard let someURL = URL(string: "https://meet.google.com/wks-ipxe-vph") else {
            print("if no url found")
            return
        }
        if UIApplication.shared.canOpenURL(someURL)
        {
            UIApplication.shared.open(someURL)
        }
        else
        {
            print("didn't work")
        }
    }
}
    



