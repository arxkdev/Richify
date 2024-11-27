local Richify = require(game:GetService("ReplicatedStorage").Richify);

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