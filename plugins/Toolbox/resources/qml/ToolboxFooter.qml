// Copyright (c) 2018 Ultimaker B.V.
// Toolbox is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import UM 1.1 as UM

Item
{
    id: footer
    width: parent.width
    anchors.bottom: parent.bottom
    height: visible ? Math.floor(UM.Theme.getSize("base_unit").height * 5.5) : 0
    Label
    {
        visible: toolbox.restartRequired
        text: "You will need to restart Cura before changes in plugins have effect."
        height: Math.floor(UM.Theme.getSize("base_unit").height * 2.5)
        verticalAlignment: Text.AlignVCenter
        anchors
        {
            top: restartButton.top
            left: parent.left
            leftMargin: UM.Theme.getSize("double_margin").width
            right: restartButton.right
            rightMargin: UM.Theme.getSize("default_margin").width
        }
    }
    Button
    {
        id: restartButton
        text: "Quit Cura"
        anchors
        {
            top: parent.top
            topMargin: UM.Theme.getSize("default_margin").height
            right: parent.right
            rightMargin: UM.Theme.getSize("double_margin").width
        }
        visible: toolbox.restartRequired
        iconName: "dialog-restart"
        onClicked: toolbox.restart()
        style: ButtonStyle
        {
            background: Rectangle
            {
                implicitWidth: UM.Theme.getSize("base_unit").width * 8
                implicitHeight: Math.floor(UM.Theme.getSize("base_unit").height * 2.5)
                color: control.hovered ? UM.Theme.getColor("primary_hover") : UM.Theme.getColor("primary")
            }
            label: Text
            {
                color: UM.Theme.getColor("button_text")
                font: UM.Theme.getFont("default_bold")
                text: control.text
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
    ToolboxShadow
    {
        visible: toolbox.restartRequired
        anchors.bottom: footer.top
        reversed: true
    }
}
