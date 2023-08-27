local colorE = {}
--[[
          _____                   _______                   _____           _______                   _____                    _____          
         /\    \                 /::\    \                 /\    \         /::\    \                 /\    \                  /\    \         
        /::\    \               /::::\    \               /::\____\       /::::\    \               /::\    \                /::\    \        
       /::::\    \             /::::::\    \             /:::/    /      /::::::\    \             /::::\    \              /::::\    \       
      /::::::\    \           /::::::::\    \           /:::/    /      /::::::::\    \           /::::::\    \            /::::::\    \      
     /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /      /:::/~~\:::\    \         /:::/\:::\    \          /:::/\:::\    \     
    /:::/  \:::\    \       /:::/    \:::\    \       /:::/    /      /:::/    \:::\    \       /:::/__\:::\    \        /:::/__\:::\    \    
   /:::/    \:::\    \     /:::/    / \:::\    \     /:::/    /      /:::/    / \:::\    \     /::::\   \:::\    \      /::::\   \:::\    \   
  /:::/    / \:::\    \   /:::/____/   \:::\____\   /:::/    /      /:::/____/   \:::\____\   /::::::\   \:::\    \    /::::::\   \:::\    \  
 /:::/    /   \:::\    \ |:::|    |     |:::|    | /:::/    /      |:::|    |     |:::|    | /:::/\:::\   \:::\____\  /:::/\:::\   \:::\    \ 
/:::/____/     \:::\____\|:::|____|     |:::|    |/:::/____/       |:::|____|     |:::|    |/:::/  \:::\   \:::|    |/:::/__\:::\   \:::\____\
\:::\    \      \::/    / \:::\    \   /:::/    / \:::\    \        \:::\    \   /:::/    / \::/   |::::\  /:::|____|\:::\   \:::\   \::/    /
 \:::\    \      \/____/   \:::\    \ /:::/    /   \:::\    \        \:::\    \ /:::/    /   \/____|:::::\/:::/    /  \:::\   \:::\   \/____/ 
  \:::\    \                \:::\    /:::/    /     \:::\    \        \:::\    /:::/    /          |:::::::::/    /    \:::\   \:::\    \     
   \:::\    \                \:::\__/:::/    /       \:::\    \        \:::\__/:::/    /           |::|\::::/    /      \:::\   \:::\____\    
    \:::\    \                \::::::::/    /         \:::\    \        \::::::::/    /            |::| \::/____/        \:::\   \::/    /    
     \:::\    \                \::::::/    /           \:::\    \        \::::::/    /             |::|  ~|               \:::\   \/____/     
      \:::\    \                \::::/    /             \:::\    \        \::::/    /              |::|   |                \:::\    \         
       \:::\____\                \::/____/               \:::\____\        \::/____/               \::|   |                 \:::\____\        
        \::/    /                 ~~                      \::/    /         ~~                      \:|   |                  \::/    /        
         \/____/                                           \/____/                                   \|___|                   \/____/      


Color3 Extended
]]

colorE.__index = colorE

function colorE.new(R:number | Color3 | Vector3,G:number?,B:number?)
	local color = {}
	setmetatable(color, colorE)
	
	if typeof(R) == "Color3" then
		color.R = R.R
		color.G = R.G
		color.B = R.B
		color.color = R
	elseif typeof(R) == "number" then
		color.R = R
		color.G = G
		color.B = B
		color.color = Color3.new(R,G,B)
	elseif typeof(R) == "Vector3" then
		color.R = R.X
		color.G = R.Y
		color.B = R.Z
		color.color = Color3.new(R.X,R.Y,R.Z)
	else
		return error("Color input is not valid!") -- Throw an error if it isn't a color
	end
	
	return color
end

function colorE.fromHSV(Hue:number | Color3 | Vector3,Saturation:number?,Value:number?)
	local color = {}
	setmetatable(color, colorE)

	if typeof(Hue) == "Color3" then
		color.color = Hue
	elseif typeof(Hue) == "number" then
		color.H = Hue
		color.S = Saturation
		color.V = Value
		color.color = Color3.fromHSV(Hue,Saturation,Value)
	elseif typeof(Hue) == "Vector3" then
		color.H = Hue.X
		color.S = Hue.Y
		color.V = Hue.Z
		color.color = Color3.fromHSV(Hue.X,Hue.Y,Hue.Z)
	else
		return error("Color input is not valid!") -- Throw an error if it isn't a color
	end

	return color
end

function colorE.fromRGB(R:number | Color3 | Vector3,G:number?,B:number?) -- Basically the same as colorE.new()
	local color = {}
	setmetatable(color, colorE)

	if typeof(R) == "Color3" then --Detect if first value is a number, if not, assume it's a Color3
		color.R = R.R
		color.G = G.G
		color.B = B.B
		color.color = R
	elseif typeof(R) == "number" then
		color.R = R/255
		color.G = G/255
		color.B = B/255
		color.color = Color3.fromRGB(R,G,B)
	elseif typeof(R) == "Vector3" then
		color.R = R.X/255
		color.G = R.Y/255
		color.B = R.Z/255
		color.color = Color3.fromRGB(R.X,R.Y,R.Z)
	else
		return error("Color input is not valid!") -- Throw an error if it isn't a color
	end

	return color
end

function colorE.fromHex(Hex:string | Color3) -- Basically the same as colorE.new()
	local color = {}
	setmetatable(color, colorE)

	if typeof(Hex) == "Color3" then -- Detect if first value is a number, if not, assume it's a Color3
		color.color = Hex
	elseif typeof(Hex) == "string" then
		color.code = Hex -- Got lazy :P
		color.color = Color3.fromHex(Hex)
	else
		return error("Color input is not valid!") -- Throw an error if it isn't a color
	end

	return color
end

function colorE.black()
	local color = {}
	setmetatable(color, colorE)
	
	color.R = 0
	color.G = 0
	color.B = 0
	
	color.color = Color3.new(0,0,0)

	return color
end

function colorE.white()
	local color = {}
	setmetatable(color, colorE)

	color.R = 1
	color.G = 1
	color.B = 1

	color.color = Color3.new(1,1,1)

	return color
end

function colorE.red()
	local color = {}
	setmetatable(color, colorE)

	color.R = 1
	color.G = 0
	color.B = 0

	color.color = Color3.new(1,0,0)

	return color
end

function colorE.green()
	local color = {}
	setmetatable(color, colorE)

	color.R = 0
	color.G = 1
	color.B = 0

	color.color = Color3.new(0,1,0)

	return color
end

function colorE.blue()
	local color = {}
	setmetatable(color, colorE)

	color.R = 0
	color.G = 0
	color.B = 1

	color.color = Color3.new(0,0,1)

	return color
end

function colorE.yellow()
	local color = {}
	setmetatable(color, colorE)

	color.R = 1
	color.G = 1
	color.B = 0

	color.color = Color3.new(1,1,0)

	return color
end

function colorE.cyan()
	local color = {}
	setmetatable(color, colorE)

	color.R = 0
	color.G = 1
	color.B = 1

	color.color = Color3.new(0,1,1)

	return color
end

function colorE.magenta()
	local color = {}
	setmetatable(color, colorE)

	color.R = 1
	color.G = 0
	color.B = 1

	color.color = Color3.new(1,0,1)

	return color
end

function colorE.random()
	local color = {}
	setmetatable(color, colorE)

	color.R = math.random(0,10000)/10000
	color.G = math.random(0,10000)/10000
	color.B = math.random(0,10000)/10000

	color.color = Color3.new(color.R,color.G,color.B)

	return color
end

function colorE:Lerp(Color:Color3 | 'ColorE', Alpha:number)
	local color
	if typeof(Color) == "Color3" then
		color = self.color:Lerp(Color, Alpha)
	elseif typeof(Color) == "table" then
		color = self.color:Lerp(Color.color, Alpha)
	else
		return error("Color input is not valid!")
	end
	return colorE.new(color)
end

function colorE:ToHSV()
	return self.color:ToHSV()
end

function colorE:ToHex()
	return self.color:ToHex()
end

function colorE:ToRGB()
	return self.color -- Color3 stores colors as rgbs automatically, so we just return the saved color
end

function colorE:getLuminance1()
	local L = 0
	local R = self.color.R
	local G = self.color.G
	local B = self.color.B
	L = (0.2126*R + 0.7152*G + 0.0722*B) -- majik numbers
	return L
end

function colorE:getLuminance2()
	local L = 0
	local R = self.color.R
	local G = self.color.G
	local B = self.color.B
	L = (0.299*R + 0.587*G + 0.114*B) -- even more majik numbers
	return L
end

function colorE:getLuminance3()
	local L = 0
	local R = self.color.R
	local G = self.color.G
	local B = self.color.B
	L = math.sqrt(0.299*R^2 + 0.587*G^2 + 0.114*B^2) -- MORE majik numbers
	return L
end

function colorE:mult(x:Color3 | Vector3 | 'ColorE')
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = self.R * x.R
		G = self.G * x.G
		B = self.B * x.B
	elseif t == "Vector3" then
		R = self.R * x.X
		G = self.G * x.Y
		B = self.B * x.Z
	elseif t == "number" then
		R = self.R * x
		G = self.G * x
		B = self.B * x
	elseif t == "table" then
		R = self.R * x.color.R
		G = self.G * x.color.G
		B = self.B * x.color.B
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:div(x:Color3 | Vector3 | 'ColorE')
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = self.R / x.R
		G = self.G / x.G
		B = self.B / x.B
	elseif t == "Vector3" then
		R = self.R / x.X
		G = self.G / x.Y
		B = self.B / x.Z
	elseif t == "number" then
		R = self.R / x
		G = self.G / x
		B = self.B / x
	elseif t == "table" then
		R = self.R / x.color.R
		G = self.G / x.color.G
		B = self.B / x.color.B
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:add(x:number | Color3 | Vector3 | 'ColorE')
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = self.R + x.R
		G = self.G + x.G
		B = self.B + x.B
	elseif t == "Vector3" then
		R = self.R + x.X
		G = self.G + x.Y
		B = self.B + x.Z
	elseif t == "number" then
		R = self.R + x
		G = self.G + x
		B = self.B + x
	elseif t == "table" then
		R = self.R + x.color.R
		G = self.G + x.color.G
		B = self.B + x.color.B
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:sub(x:number | Color3 | Vector3 | 'ColorE')
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = self.R - x.R
		G = self.G - x.G
		B = self.B - x.B
	elseif t == "Vector3" then
		R = self.R - x.X
		G = self.G - x.Y
		B = self.B - x.Z
	elseif t == "number" then
		R = self.R - x
		G = self.G - x
		B = self.B - x
	elseif t == "table" then
		R = self.R - x.color.R
		G = self.G - x.color.G
		B = self.B - x.color.B
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:invert(x:number | Color3 | Vector3 | 'ColorE')
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = 1 - x.R
		G = 1 - x.G
		B = 1 - x.B
	elseif t == "Vector3" then
		R = 1 - x.X
		G = 1 - x.Y
		B = 1 - x.Z
	elseif t == "table" then
		R = 1 - x.R
		G = 1 - x.G
		B = 1 - x.B
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:min(x:Color3 | Vector3 | 'ColorE',mn:number)
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = math.max(x.R,mn)
		G = math.max(x.G,mn)
		B = math.max(x.B,mn)
	elseif t == "Vector3" then
		R = math.max(x.X,mn)
		G = math.max(x.Y,mn)
		B = math.max(x.Z,mn)
	elseif t == "table" then
		R = math.max(x.R,mn)
		G = math.max(x.G,mn)
		B = math.max(x.B,mn)
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:max(x:Color3 | Vector3 | 'ColorE',mx:number)
	local R,G,B
	local t = typeof(x)
	if t == "Color3" then
		R = math.min(x.R,mx)
		G = math.min(x.G,mx)
		B = math.min(x.B,mx)
	elseif t == "Vector3" then
		R = math.min(x.X,mx)
		G = math.min(x.Y,mx)
		B = math.min(x.Z,mx)
	elseif t == "table" then
		R = math.min(x.R,mx)
		G = math.min(x.G,mx)
		B = math.min(x.B,mx)
	else
		return error("Color input is not valid!")
	end
	return colorE.new(R,G,B)
end

function colorE:range(x:Color3 | Vector3 | 'ColorE',mn:number,mx:number)
	return colorE:max(colorE:min(x,mn),mx)
end

return colorE
