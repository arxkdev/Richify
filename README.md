# Richify

A simple function to richify your text.

## Example

```lua
local Richify = require(...);

-- Constants
local GEMS = "1,000 Gems!";
local RichifyExampleLabel = script.Parent.TextLabel;

-- Define our options
local GemOpts = {
	Stroke = {
		Thickness = 1,
		Transparency = 0.25,
		Color = Color3.fromRGB(0, 162, 255)
	},
	
	Font = {Color = Color3.fromRGB(255, 255, 255)},
	Bold = true,
};
local TextOps = {
	Font = {Color = Color3.fromRGB(255, 255, 255)},
}

-- Richify our text
local Text = "You have " .. Richify(GEMS, GemOpts);
RichifyExampleLabel.Text = Richify(Text, TextOps);
```

## Usage
Works pretty simple. All you need to do is check (https://create.roblox.com/docs/building-and-visuals/ui/rich-text) for TAGS and ATTRIBUTES. Find the ones you want & include in the richify options.

```lua
local Options = {
	Stroke = {
		Thickness = 1,
		Transparency = 0.25,
		Color = Color3.fromRGB(0, 162, 255)
	},
	
	Font = {Color = Color3.fromRGB(255, 255, 255)},
	Bold = true,
};
```

Set the options to the Richify function (make sure to keep elements/tags first in the options and attributes, nested)
```lua
local Text = "Hello World!";
local Richifed = Richify(Text, Options);
print(Richified);
-- Result: <font color="rgb(255,255,255)"><stroke thickness="1" transparency="0.25" color="rgb(0,162,255)"><b>Hello World!</b></stroke></font>
```

Available Elements:
```lua
{
	["Font"] = "font",
	["Stroke"] = "stroke",
	["Bold"] = "b",
	["Italic"] = "i",
	["Underline"] = "u",
	["Strikethrough"] = "s",
	["Uppercase"] = "uc",
	["SmallCaps"] = "sc"
}
```

Available Attributes:
```lua
{
	["Color"] = "color",
	["Size"] = "size",
	["Face"] = "face",
	["Family"] = "family",
	["Weight"] = "weight",
	["Transparency"] = "transparency",
	["Joins"] = "joins",
	["Thickness"] = "thickness"
}
```

Done.