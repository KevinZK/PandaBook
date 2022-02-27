//
//  ContentView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2021/10/14.
//

import SwiftUI
import MapKit

struct HomeRootView: View {
    @State private var datas: [ListMode] = [ListMode(id: 1), ListMode(id: 2), ListMode(id: 3), ListMode(id: 4)]
    var body: some View {
        
            ScrollView(.vertical) {
                VStack {
                    MapView()
                        .frame(height: 300)
                    HeaderView()
                        .offset(y: -80)
                        .padding(.bottom, -80)
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Kevin!")
                            .foregroundColor(.green)
                            .font(.title)
                        HStack {
                            Text("whats new in SwiftUI")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Shanghai")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Divider()
                        Text("About This Book")
                            .font(.title2)
                        Text("zuookunn")
                            .font(.subheadline)
                    }
                    .padding()
                    ForEach($datas, id: \.self) { _ in
                        AssetsRecodsRow()
                    }
                }
                
                
            }
            
            
            
        
        
        
    }
}

/// 头部View
struct HeaderView: View {
    var body: some View {
        
        Image(systemName: "person")
            .font(.system(size: 95))
            .foregroundColor(.red)
            .frame(width: 160, height: 160, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
            .shadow(radius: 7)
        
    }
}
/// 地图view
struct MapView: View{
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

/// 资产记录
struct AssetsRecodsRow: View {
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .font(.system(size: 25))
                .foregroundColor(.red)
            Text("sad")
                .font(.subheadline)
            Spacer()
        }
        .padding()
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}


struct ListMode: Hashable, Identifiable {
    var id: Int
    
}
