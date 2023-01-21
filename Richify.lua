local Richify = { };

Richify.ElementTags = {
	["Font"] = "font",
	["Stroke"] = "stroke",
	["Bold"] = "b",
	["Italic"] = "i",
	["Underline"] = "u",
	["Strikethrough"] = "s",
	["Uppercase"] = "uc",
	["SmallCaps"] = "sc"
};
Richify.AttributeTags = {
	["Color"] = "color",
	["Size"] = "size",
	["Face"] = "face",
	["Family"] = "family",
	["Weight"] = "weight",
	["Transparency"] = "transparency",
	["Joins"] = "joins",
	["Thickness"] = "thickness"
};

function Richify:__call(str, options)
	local Final = str;
	Final = tostring(Final);

	for ElementName, ElementValue in pairs(options) do
		local Tag = self.ElementTags[ElementName];
		if (Tag == nil) then 
			continue;
		end;

		local OpeningTag = Tag;
		
		if (type(ElementValue) == "table") then
			if (next(ElementValue) == nil) then 
				continue;
			end;

			for AttributeName, AttributeValue in pairs(ElementValue) do
				local AttributeTag = self.AttributeTags[AttributeName];
				if (AttributeTag == nil) then 
					continue;
				end;

				local AttributeValueString = "";
				
				if (typeof(AttributeValue) == "Color3") then
					AttributeValueString = 'rgb(' .. tostring(math.round(AttributeValue.R * 255)) .. ',' .. tostring(math.round(AttributeValue.G * 255)) .. ',' .. tostring(math.round(AttributeValue.B * 255)) .. ')';
				else
					AttributeValueString = tostring(AttributeValue);
				end;

				OpeningTag = OpeningTag .. " " .. AttributeTag .. '="' .. AttributeValueString .. '"';
			end;
		elseif (ElementValue == false) then
			continue;
		end;

		Final = "<" .. OpeningTag .. ">" .. Final .. "</".. Tag ..">";
	end;
	
	return tostring(Final);
end

Richify.LineBreak = '<br />';
Richify.LessThan = '&lt;';
Richify.GreaterThan = '&gt;';
Richify.Quote = '&quot;';
Richify.Apostrophe = '&apos;';
Richify.Ampersand = '&amp;';

setmetatable(Richify, {__call = Richify.__call});
return Richify;