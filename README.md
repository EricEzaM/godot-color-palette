# Godot Color Palette Plugin
Manage color palettes from within Godot to make coloring and theming easier!

[Watch the feature demo](https://streamable.com/gw4n99)

![Sample](sample.png "Sample")

# Quick Reference Docs

To install the plugin, download the repository and put the folder `addons/godot-color-palette` into your project directory (res://). Or download directly from the asset library within the Godot editor.

Go to Project -> Settings -> Plugins, and activate the plugin. A new "Color Palette" tab should appear at the bottom, near "Output", "Debugger", etc. 

In this tab you can view and manage your colors and palettes.

## Basic Usage

#### Palette management
* Set the palette directory to where palette files (GIMP Palettes, .gpl files) should be stored. This is where palettes are saved to. Also, if you download palettes online or bring existing ones from GIMP or Aseprite, they should go here.
* Add new palettes by giving them a name and clicking the plus button next to the text box.
* Click the reload button to reload all palette files and refresh the list.

#### Color Management
* To add a new color to a palette, select the palette by clicking on it's name. You can then choose a color with the color picker and press the plus button above the picker to add it to the color list.
* To edit a color, click on the color in the palettes color list. Edit the color in the color picker, and then click the override button above the picker (it's to the left of the Add button)
* Click and drag colors in the list to rearrange them
* These actions have undo-redo ability.

#### Integration with Editor Color Picker
* Click "Load into Picker" to load the palette into the editor's color picker presets. *NOTE: Sometimes the picker may not refresh immediately. To resolve this, change scene tabs or go to Scene > Revert Scene. This is due to the logic of when the editor refreshes the presets from the editor settings, and cannot be resolved in this plugin.*
* Click "Load from Picker" to get the colors currently in the color picker presets into this palette. **This overrides the current palette, and cannot currently be undone**
