//
//  WeatherView.swift
//  WeatherApp
//
//  Created by A'zamjon Abdumuxtorov on 05/01/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment:.leading){
            VStack{
                VStack(alignment:.leading,spacing: 5){
                    Text(weather.name).bold()
                        .font(.title)
                    Text("Today \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            VStack(spacing:5){
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 40))
                                Text(weather.weather[0].main)
                            }.frame(width: 150,alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble()+"°")
                                .font(.system(size: 100)).bold()
                                .padding()
                        }
                        Spacer()
                            .frame(height: 80)
                        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:350)
                        } placeholder: {
                            ProgressView()
                        }
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
            }.padding()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment:.leading,spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble()+"°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble()+"°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind spind", value: (weather.wind.speed.roundDouble()+" m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()+"%"))
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding().padding(.bottom,20)
                .foregroundColor(Color(hue: 0.697, saturation: 0.979, brightness: 0.554))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,.topRight])
            }
            
        }.edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.697, saturation: 0.979, brightness: 0.554))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
