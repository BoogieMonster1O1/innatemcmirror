//
// Copyright © 2022 Shrish Deshpande
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see &lt;http://www.gnu.org/licenses/&gt;.
//

import SwiftUI
import InnateKit

struct InstanceLogoView: View {
    let instance: Instance
    @State var logo: InstanceLogo? = nil
    
    var body: some View {
        ZStack {
            let logo = self.logo ?? instance.logo
            if logo.logoType == .file {
                AsynchronousImage(instance.getLogoPath())
            } else if logo.logoType == .symbol {
                Image(systemName: logo.string)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onReceive(instance.$logo) { value in
            logo = value
        }
    }
}
