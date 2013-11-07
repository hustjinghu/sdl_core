/**
 * @file ClimateControlView.qml
 * @brief Screen view of climat menu.
 * Copyright (c) 2013, Ford Motor Company
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided with the
 * distribution.
 *
 * Neither the name of the Ford Motor Company nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

import QtQuick 2.0
import "../controls"

GeneralView {
    Item {
        id: climatMenu
        anchors.fill: parent

        Item {
            // 3/4 top screen
            height: parent.height
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left

            Column {
                id: leftItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 1/4*parent.width - useThisToGetButtonSize.width

                Row {
                    ClimateControlBtn {name: "heated_seat"}
                    ClimateControlBtn {name: "heated_wheel"}
                }
                Row {
                    ClimateControlBtn {name: "AC"}
                    ClimateControlBtn {name: "headed_dash"}
                }
            }

            Column {
                id: centralItem
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                ClimateControlBtn {id: useThisToGetButtonSize; name: "defrost"; state: "on"}
                ClimateControlBtn {name: "face"; state: "on"}
                ClimateControlBtn {name: "feet"}
            }

            Row {
                id: rightItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 1/4*parent.width - useThisToGetButtonSize.width

                ClimateControlBtn {
                    anchors.verticalCenter: parent.verticalCenter
                    txt: "Dual"
                    state: "on"
                }

                Column {
                    ClimateControlBtn { name: "heated_seat" }
                    ClimateControlBtn { name: "AC" }
                }
            }
        }
        // bottom 1\4 of screen doesnt use now
    }
}
