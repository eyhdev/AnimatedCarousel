//
//  Home.swift
//  AnimatedCarousel
//
//

import SwiftUI

struct Home: View {
    @State var currentTab: Tab = .House
    @Namespace var animation
    @State var currentIndex: Int = 0
    var body: some View {
        VStack(spacing: 15){
            HeaderView()
            SearchBar()
           
            Text("Welcome To Order Cake")
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            CustomCarousel(index: $currentIndex, Items: movies, cardPadding: 150, id: \.id) { movie,cardsize  in
                
                 Image(movie.artwork)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: cardsize.width, height: cardsize.height)
                     .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
             .padding(.horizontal, -15)
             .padding(.vertical)
            TabBar()
        }
        .padding([.horizontal,.top], 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            
            GeometryReader{proxy in
                let size = proxy.size
                TabView(selection: $currentIndex){
                    ForEach(movies.indices, id: \.self){index in
                        Image(movies[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                        
                    }
                 }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentIndex)
                Rectangle()
                    .fill(.ultraThinMaterial)
                
            LinearGradient(colors: [
                Color.black.opacity(0.3)
            
               ], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
    
    }
    @ViewBuilder
    func TabBar()->some View{
        HStack(spacing: 0){
            ForEach(Tab.allCases, id: \.rawValue){tab in
                VStack(spacing: -2){
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 29)
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab{
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                    
                 }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){currentTab = tab}
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
   @ViewBuilder
    func SearchBar()->some View{
        HStack(spacing: 15){
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(.gray)
                
                TextField("Search", text: .constant(""))
                    .padding(.vertical, 10)
                Image(systemName: "mic")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(.gray)
                
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.12))
        )
        .padding(.top, 20)
    }
    @ViewBuilder
    func HeaderView()->some View{
        HStack{
            VStack(alignment: .leading, spacing: 6){
                (Text("Hi")
                    .fontWeight(.semibold) +
                Text("Metin"))
                .font(.title2)
                
                Text("Welcome")
                    .font(.callout)
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button{
            }label: {
                Image("Logo")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
