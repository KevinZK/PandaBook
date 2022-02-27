//
//  CBRecordView.swift
//  CowBookkeeper
//
//  Created by Zuo.Kevin on 2022/2/16.
//

import SwiftUI

struct CBRecordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: RecordDeploy
    @State private var remarkContent = ""
    
    /// 头部view
    var headSection: some View {
        VStack(spacing: 30) {
            ZStack(alignment: .center) {
                Circle()
                    .fill(Color(hex: viewModel.currentColor.content))
                    .frame(width: 100, height: 100)
                
                Image(systemName: viewModel.currentSymbol.content)
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(Color.white)
            }
            HStack(alignment: .firstTextBaseline) {
                TextField("填写备注", text: $remarkContent)
                    .font(.system(size: 18))
                    .frame(height: 44)
                    .padding(.leading, 5)
                Spacer()
                Text("￥")
                    .font(.system(size: 18, weight: .bold))
                Text(viewModel.keyboardOutput)
                    .frame(height: 44)
                    .multilineTextAlignment(.trailing)
                    .font(.custom(FontFamily.HN.rawValue, size: 18))
                    .padding(.trailing, 5)
                    .fixedSize()
                
            }
            .overlay {
                RoundedRectangle(cornerRadius: 6, style: .continuous).stroke(.gray.opacity(0.3), lineWidth: 1)
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.top, -15)
            
            
        }
        .frame(width: ScreenW - 40, height: 200)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 1)
        .padding()
    }
    
    var colorSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 40))], alignment: .center, spacing: 20) {
                ForEach(viewModel.colors) { palette in
                    Color(hex: palette.content)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding(4)
                        .if(palette.isSelected){
                            $0.overlay{
                                Circle().stroke(.gray.opacity(0.5), lineWidth: 2)
                            }
                        }
                        .onTapGesture {
                            viewModel.choose(palette)
                        }
                    
                }
            }
            .padding()
            
        }
        .frame(width: ScreenW - 40, height: 70)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 1)
        .padding()
    }
    
    var syRows: [GridItem] =
    [GridItem(.adaptive(minimum: 40)),
     GridItem(.adaptive(minimum: 40)),
     GridItem(.adaptive(minimum: 40))]
    
    
    var symbolSection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: syRows, alignment: .center, spacing: 6) {
                ForEach(viewModel.symbols) { palette in
                    
                    ZStack{
                        Circle()
                            .foregroundColor(Color(hex: 0xdbe7e4))
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: palette.content)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .padding(5)
                    .if(palette.isSelected){
                        $0.overlay{
                            Circle().stroke(.gray.opacity(0.5), lineWidth: 2)
                        }
                        
                    }
                    .onTapGesture {
                        viewModel.choose(palette)
                    }
                }
            }
            .padding()
            
        }
        .frame(width: ScreenW - 40, height: 220)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 1)
        .padding()
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    headSection
                    colorSection.padding(.top, -28)
                    symbolSection.padding(.top, -28)
                }
                .navigationTitle(viewModel.moduleType.navTitle)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarColor(UIColor(Color(hex: 0xF2F1F6)))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("取消")
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("取消")
                                .foregroundColor(Color(hex: 0x3d405b))
                        }
                    }
                }
                NumberKeyboardWidget(viewModel: viewModel).padding(.top ,-10)
            }
            .background(Color(hex: 0xF2F1F6))
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CBRecordView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CBRecordView(viewModel: RecordDeploy())
        
    }
}


struct NumberKeyboardWidget: View {
    @ObservedObject var viewModel: RecordDeploy
    var body: some View {
        
        KeyboardButtonPad(viewModel: viewModel)
            .frame(width: ScreenW, height: 270)
            .background(Color(hex: 0x54478c, alpha: 0.8))
        
        
    }
}
let scale = UIScreen.main.bounds.width / 414
struct KeyboardButton : View {
    
    let fontSize: CGFloat = 35
    let title: String
    let size: CGSize
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize * scale, weight: .bold))
                .foregroundColor(foregroundColor)
                .frame(width: size.width * scale, height: size.height * scale)
                .background(backgroundColor)
                .cornerRadius(15)
        }
    }
}

struct KeyboardButtonRow : View {
    let row: [KeyboardItem]
    let action: (KeyboardItem) -> Void
    var body: some View {
        
        HStack {
            ForEach(row, id: \.self) { item in
                KeyboardButton(
                    title: item.title,
                    size: item.size,
                    backgroundColor: item.backgroundColorName,
                    foregroundColor: item.foregroundColor)
                {
                    action(item)
                }
            }
        }
        
        
    }
}

struct KeyboardButtonPad: View {
    
    @ObservedObject var viewModel: RecordDeploy
    var body: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.keys, id: \.self) { row in
                KeyboardButtonRow(row: row){ item in
                    
                    print("Button: \(item.title)")
                    switch item {
                    case .option(let opt):
                        if opt == .sure {
                            print("确定")
                        }else{
                            print("支出/收入")
                        }
                    default: viewModel.apply(item)

                    }
                }
            }
        }
        .padding(.bottom,10)
    }
}


