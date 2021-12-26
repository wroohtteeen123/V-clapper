import SwiftUI
import AudioToolbox



func getDeviceTime () -> String{
    while true {
        return "\(Date())"
    }
}


func systemSound(_ sender: Any) {
    //建立的SystemSoundID对象
    var soundID:SystemSoundID = 0
    //获取声音地址
    let path = Bundle.main.path(forResource: "msg", ofType: "wav")
    //地址转换
    let baseURL = NSURL(fileURLWithPath: path!)
    //赋值
    AudioServicesCreateSystemSoundID(baseURL, &soundID)
    //播放声音
    AudioServicesPlaySystemSound(soundID)
}




let timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()


struct MainBoard: View {
    
    @State var timeNow = ""
    
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    
    var dateFormatter: DateFormatter {
        
        let fmtr = DateFormatter()
        
        fmtr.dateFormat = "yy年MM月dd日 HH时mm分ss秒+SSS"
        
        return fmtr
        
    }
            
    var body: some View {
        
        VStack(alignment: .center){
            
//            Button("检查电量"){
//                //SystemSoundID()
//            }
            
            Text("现在的时间是：")
                .font(.title)
                .fontWeight(.light)
            
            Text(timeNow).font(.custom("Avenir Next Condensed", size: 40)).fontWeight(.black).multilineTextAlignment(.leading).lineLimit(/*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/).frame(width: 7000.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/).onReceive(timer) {
                _ in self.timeNow = dateFormatter.string(from: Date())
            }
        }
        .padding()
        
    }
    
}





struct MainBoard_Previews: PreviewProvider {
    static var previews: some View {
            MainBoard()
.previewInterfaceOrientation(.landscapeLeft)
        }
}

