//
//  AccordianView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct AccordianView:  View {
    
    var listOfAccordions: Array<Array<String>>
    
    var body: some View {
        VStack{
            ForEach(listOfAccordions, id: \.self){ accord in
                VStack(spacing: 15){
                    Divider()
                        .background(Color.greyFourColor)
                    DisclosureGroup(content: {
                        VStack(spacing: 15){
                            Spacer().frame(height: 10)
                            Text(accord[1]).font(.body)
                            Spacer().frame(height: 10)
                        }
                    }, label: {Text(accord[0]).font(.subheadline)}).accentColor(Color.greyColor).foregroundColor(Color.blackColor)
                }.padding([.leading,.trailing], 15).padding([.top,.bottom], 7)
            }
        }
    }
}
