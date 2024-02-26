local TweenService = game:GetService("TweenService")

local Library = {}
function Library:CreateWindow(WinName)
    if game.CoreGui:FindFirstChild("CerbUI") then
		game.CoreGui:FindFirstChild("CerbUI"):Destroy()
	end

	local CerbUI = Instance.new("ScreenGui")
	local Main_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UIStroke_1 = Instance.new("UIStroke")
	local TopBar_1 = Instance.new("Frame")
	local Title_1 = Instance.new("TextLabel")
	local ElementsHolder_1 = Instance.new("Frame")
	
	CerbUI.Name = "CerbUI"
	CerbUI.Parent = game.CoreGui

	Main_1.Name = "Main"
	Main_1.Parent = CerbUI
	Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
	Main_1.BackgroundTransparency = 0.6000000238418579
	Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Main_1.BorderSizePixel = 0
	Main_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Main_1.Size = UDim2.new(0, 539,0, 353)
    
    local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"));

local gui = Main_1

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
	return a + (b - a) * m
end;

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (8); -- // The speed of the UI darg.
function Update(dt)
	if not (startPos) then return end;
	if not (dragging) and (lastGoalPos) then
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
		return 
	end;

	local delta = (lastMousePos - UserInputService:GetMouseLocation())
	local xGoal = (startPos.X.Offset - delta.X);
	local yGoal = (startPos.Y.Offset - delta.Y);
	lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
	gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
end;

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		lastMousePos = UserInputService:GetMouseLocation()

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

runService.Heartbeat:Connect(Update)
    
	UICorner_1.Parent = Main_1
	UICorner_1.CornerRadius = UDim.new(0,12)

	UIStroke_1.Parent = Main_1
	UIStroke_1.Color = Color3.fromRGB(210,181,165)
	UIStroke_1.Thickness = 2

	TopBar_1.Name = "TopBar"
	TopBar_1.Parent = Main_1
	TopBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TopBar_1.BackgroundTransparency = 1
	TopBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TopBar_1.BorderSizePixel = 0
	TopBar_1.Size = UDim2.new(0, 539,0, 52)

	Title_1.Name = "Title"
	Title_1.Parent = TopBar_1
	Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Title_1.BackgroundTransparency = 1
	Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Title_1.BorderSizePixel = 0
	Title_1.Size = UDim2.new(0, 539,0, 52)
	Title_1.Font = Enum.Font.GothamBold
	Title_1.Text = WinName
	Title_1.TextColor3 = Color3.fromRGB(255,255,255)
	Title_1.TextSize = 22

	ElementsHolder_1.Name = "ElementsHolder"
	ElementsHolder_1.Parent = Main_1
	ElementsHolder_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ElementsHolder_1.BackgroundTransparency = 1
	ElementsHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ElementsHolder_1.BorderSizePixel = 0
	ElementsHolder_1.Position = UDim2.new(0, 0,0.147308782, 0)
	ElementsHolder_1.Size = UDim2.new(0, 539,0, 301)
	
	
	local Tabs = {}
	function Tabs:CreateTab()
		local Elements_1 = Instance.new("Frame")
		local UIListLayout_3 = Instance.new("UIListLayout")
		
		Elements_1.Name = "Elements"
		Elements_1.Parent = ElementsHolder_1
		Elements_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Elements_1.BackgroundTransparency = 1
		Elements_1.BorderColor3 = Color3.fromRGB(0,0,0)
		Elements_1.BorderSizePixel = 0
		Elements_1.Size = UDim2.new(0, 539,0, 301)
		
		UIListLayout_3.Parent = Elements_1
		UIListLayout_3.Padding = UDim.new(0,3)
		UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		
		local Sec = {}
		function Sec:CreateSec()
			local Section_1 = Instance.new("Frame")
			local Items_1 = Instance.new("ScrollingFrame")
			local UIListLayout_1 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")
			local UIPadding_3 = Instance.new("UIPadding")
			
			Section_1.Name = "Section"
			Section_1.Parent = Elements_1
			Section_1.Active = true
			Section_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Section_1.BackgroundTransparency = 1
			Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Section_1.BorderSizePixel = 0
			Section_1.Size = UDim2.new(0, 268,0, 301)
			Section_1.ClipsDescendants = true

			Items_1.Name = "Items"
			Items_1.Parent = Section_1
			Items_1.Active = true
			Items_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Items_1.BackgroundTransparency = 1
			Items_1.BorderColor3 = Color3.fromRGB(0,0,0)
			Items_1.BorderSizePixel = 0
			Items_1.Size = UDim2.new(0, 268,0, 301)
			Items_1.ClipsDescendants = true
			Items_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
			Items_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
			Items_1.CanvasPosition = Vector2.new(0, 0)
			Items_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
			Items_1.ElasticBehavior = Enum.ElasticBehavior.Never
			Items_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
			Items_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			Items_1.ScrollBarImageColor3 = Color3.fromRGB(210,181,165)
			Items_1.ScrollBarImageTransparency = 0
			Items_1.ScrollBarThickness = 5
			Items_1.ScrollingDirection = Enum.ScrollingDirection.Y
			Items_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
			Items_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
			Items_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
			
			UIListLayout_1.Parent = Items_1
			UIListLayout_1.Padding = UDim.new(0,1)
			UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
			
			UIPadding_2.Parent = Items_1
			UIPadding_2.PaddingLeft = UDim.new(0,9)

			UIPadding_3.Parent = Items_1
			UIPadding_3.PaddingLeft = UDim.new(0,15)
			
			local Elements = {}
			function Elements:CreateSection(SectionName)
				local Section_2 = Instance.new("Frame")
				local SectionText_1 = Instance.new("TextLabel")
				
				Section_2.Name = "Section"
				Section_2.Parent = Items_1
				Section_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Section_2.BackgroundTransparency = 1
				Section_2.BorderColor3 = Color3.fromRGB(0,0,0)
				Section_2.BorderSizePixel = 0
				Section_2.Size = UDim2.new(0, 242,0, 21)

				SectionText_1.Name = "SectionText"
				SectionText_1.Parent = Section_2
				SectionText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				SectionText_1.BackgroundTransparency = 1
				SectionText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SectionText_1.BorderSizePixel = 0
				SectionText_1.Size = UDim2.new(0, 242,0, 21)
				SectionText_1.Font = Enum.Font.Gotham
				SectionText_1.Text = SectionName
				SectionText_1.TextColor3 = Color3.fromRGB(210,181,165)
				SectionText_1.TextSize = 15
				SectionText_1.TextXAlignment = Enum.TextXAlignment.Left
			end
			function Elements:CreateLabel(LabelName)
				local Label_1 = Instance.new("Frame")
				local LabelText_1 = Instance.new("TextButton")
				local UIPadding_8 = Instance.new("UIPadding")
				
				Label_1.Name = "Label"
				Label_1.Parent = Items_1
				Label_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Label_1.BackgroundTransparency = 1
				Label_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Label_1.BorderSizePixel = 0
				Label_1.Size = UDim2.new(0, 242,0, 21)

				LabelText_1.Name = "LabelText"
				LabelText_1.Parent = Label_1
				LabelText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				LabelText_1.BackgroundTransparency = 1
				LabelText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				LabelText_1.BorderSizePixel = 0
				LabelText_1.Position = UDim2.new(-0.0660792962, 0,0, 0)
				LabelText_1.Size = UDim2.new(0, 241,0, 21)
				LabelText_1.Font = Enum.Font.Gotham
				LabelText_1.Text = LabelName
				LabelText_1.TextColor3 = Color3.fromRGB(210,181,165)
				LabelText_1.TextSize = 12

				UIPadding_8.Parent = Label_1
				UIPadding_8.PaddingLeft = UDim.new(0,15)
			end
			function Elements:CreateSeperator()
				local Seperator_1 = Instance.new("Frame")
				local SeperatorFrame_1 = Instance.new("Frame")
				local UICorner_6 = Instance.new("UICorner")
				
				Seperator_1.Name = "Seperator"
				Seperator_1.Parent = Items_1
				Seperator_1.BackgroundColor3 = Color3.fromRGB(210,181,165)
				Seperator_1.BackgroundTransparency = 1
				Seperator_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Seperator_1.BorderSizePixel = 0
				Seperator_1.Position = UDim2.new(0, 0,0.438538194, 0)
				Seperator_1.Size = UDim2.new(0, 242,0, 12)

				SeperatorFrame_1.Name = "SeperatorFrame"
				SeperatorFrame_1.Parent = Seperator_1
				SeperatorFrame_1.BackgroundColor3 = Color3.fromRGB(210,181,165)
				SeperatorFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
				SeperatorFrame_1.BorderSizePixel = 0
				SeperatorFrame_1.Position = UDim2.new(0, 0,0.5, 0)
				SeperatorFrame_1.Size = UDim2.new(0, 242,0, 1)

				UICorner_6.Parent = SeperatorFrame_1
				UICorner_6.CornerRadius = UDim.new(0,12)
			end
			function Elements:CreateButton(ButtonName, Callback)
			
				Callback = Callback or function()
				end
				
				local targetButtonColorOn = Color3.fromRGB(100,100,100)
				local targetButtonColorOff = Color3.fromRGB(255,255,255)
				
				local Button_1 = Instance.new("Frame")
				local UIPadding_6 = Instance.new("UIPadding")
				local ButtonBtn_1 = Instance.new("TextButton")
				

				Button_1.Name = "Button"
				Button_1.Parent = Items_1
				Button_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Button_1.BackgroundTransparency = 1
				Button_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Button_1.BorderSizePixel = 0
				Button_1.Size = UDim2.new(0, 242,0, 21)

				UIPadding_6.Parent = Button_1
				UIPadding_6.PaddingLeft = UDim.new(0,15)

				ButtonBtn_1.Name = "ButtonBtn"
				ButtonBtn_1.Parent = Button_1
				ButtonBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ButtonBtn_1.BackgroundTransparency = 1
				ButtonBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ButtonBtn_1.BorderSizePixel = 0
				ButtonBtn_1.Position = UDim2.new(-0.0660792962, 0,0, 0)
				ButtonBtn_1.Size = UDim2.new(0, 241,0, 21)
				ButtonBtn_1.Font = Enum.Font.Gotham
				ButtonBtn_1.Text = ButtonName
				ButtonBtn_1.TextColor3 = Color3.fromRGB(255,255,255)
				ButtonBtn_1.TextSize = 13
				ButtonBtn_1.TextXAlignment = Enum.TextXAlignment.Left
				
				local tweenInfo = TweenInfo.new(0.2)

				local tweenbon = TweenService:Create(ButtonBtn_1, tweenInfo, {TextColor3 = targetButtonColorOn})
				local tweenboff = TweenService:Create(ButtonBtn_1, tweenInfo, {TextColor3 = targetButtonColorOff})
				
				ButtonBtn_1.MouseButton1Click:Connect(function()
					tweenbon:Play()
					wait(0.1)
					tweenboff:Play()
					Callback()
				end)
			end
			function Elements:CreateToggle(ToggleName, Callback)
			
				Callback = Callback or function()
				end

				local toggled = false
				local debounce = false

				local targetToggleVisibilityOn = 0
				local targetToggleVisibilityOff = 1
				
				local Toggle_1 = Instance.new("Frame")
				local ToggleText_1 = Instance.new("TextLabel")
				local UIPadding_1 = Instance.new("UIPadding")
				local TogglerHolder_1 = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UIStroke_2 = Instance.new("UIStroke")
				local TogglerBtn_1 = Instance.new("TextButton")
				local Toggler_1 = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				
				Toggle_1.Name = "Toggle"
				Toggle_1.Parent = Items_1
				Toggle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Toggle_1.BackgroundTransparency = 1
				Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Toggle_1.BorderSizePixel = 0
				Toggle_1.Size = UDim2.new(0, 242,0, 21)

				ToggleText_1.Name = "ToggleText"
				ToggleText_1.Parent = Toggle_1
				ToggleText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				ToggleText_1.BackgroundTransparency = 1
				ToggleText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				ToggleText_1.BorderSizePixel = 0
				ToggleText_1.Position = UDim2.new(-0.0660792962, 0,0, 0)
				ToggleText_1.Size = UDim2.new(0, 192,0, 21)
				ToggleText_1.Font = Enum.Font.Gotham
				ToggleText_1.Text = ToggleName
				ToggleText_1.TextColor3 = Color3.fromRGB(255,255,255)
				ToggleText_1.TextSize = 13
				ToggleText_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_1.Parent = Toggle_1
				UIPadding_1.PaddingLeft = UDim.new(0,15)

				TogglerHolder_1.Name = "TogglerHolder"
				TogglerHolder_1.Parent = Toggle_1
				TogglerHolder_1.BackgroundColor3 = Color3.fromRGB(210,181,165)
				TogglerHolder_1.BackgroundTransparency = 1
				TogglerHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TogglerHolder_1.BorderSizePixel = 0
				TogglerHolder_1.Position = UDim2.new(0.845815003, 0,0.190476194, 0)
				TogglerHolder_1.Size = UDim2.new(0, 35,0, 12)

				UICorner_2.Parent = TogglerHolder_1
				UICorner_2.CornerRadius = UDim.new(0,12)

				UIStroke_2.Parent = TogglerHolder_1
				UIStroke_2.Color = Color3.fromRGB(210,181,165)
				UIStroke_2.Thickness = 1

				TogglerBtn_1.Name = "TogglerBtn"
				TogglerBtn_1.Parent = TogglerHolder_1
				TogglerBtn_1.Active = true
				TogglerBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TogglerBtn_1.BackgroundTransparency = 1
				TogglerBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TogglerBtn_1.BorderSizePixel = 0
				TogglerBtn_1.Size = UDim2.new(0, 35,0, 15)
				TogglerBtn_1.Font = Enum.Font.SourceSans
				TogglerBtn_1.Text = ""
				TogglerBtn_1.TextSize = 14

				Toggler_1.Name = "Toggler"
				Toggler_1.Parent = TogglerHolder_1
				Toggler_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Toggler_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Toggler_1.BorderSizePixel = 0
				Toggler_1.Size = UDim2.new(0, 13,0, 13)

				UICorner_3.Parent = Toggler_1
				UICorner_3.CornerRadius = UDim.new(0,12)
				
				local tweenInfo = TweenInfo.new(0.2)
				local tweentcon = TweenService:Create(TogglerHolder_1, tweenInfo, {BackgroundTransparency = targetToggleVisibilityOn})
				local tweentcoff = TweenService:Create(TogglerHolder_1, tweenInfo, {BackgroundTransparency = targetToggleVisibilityOff})



				TogglerBtn_1.MouseButton1Click:Connect(function()
    if debounce == false then
        if toggled == false then
            debounce = true
            tweentcon:Play()
            debounce = false
            toggled = true
            local toggleTween = TweenService:Create(Toggler_1, tweenInfo, {Position = UDim2.new(1, -13, 0.5, -6)})        
            toggleTween:Play()
            pcall(Callback, toggled)    
        elseif toggled == true then
            debounce = true
            tweentcoff:Play()
            debounce = false
            toggled = false
            local toggleTween = TweenService:Create(Toggler_1, tweenInfo, {Position = UDim2.new(0, 0, 0.5, -6)})    
            toggleTween:Play()
            pcall(Callback, toggled)      
        end
    end
end)

			end
			function Elements:CreateBox(BoxName, Callback)
				local Box_1 = Instance.new("Frame")
				local BoxText_1 = Instance.new("TextLabel")
				local UIPadding_5 = Instance.new("UIPadding")
				local TextBox_1 = Instance.new("TextBox")
				
				Box_1.Name = "Box"
				Box_1.Parent = Items_1
				Box_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				Box_1.BackgroundTransparency = 1
				Box_1.BorderColor3 = Color3.fromRGB(0,0,0)
				Box_1.BorderSizePixel = 0
				Box_1.Size = UDim2.new(0, 242,0, 21)

				BoxText_1.Name = "BoxText"
				BoxText_1.Parent = Box_1
				BoxText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				BoxText_1.BackgroundTransparency = 1
				BoxText_1.BorderColor3 = Color3.fromRGB(0,0,0)
				BoxText_1.BorderSizePixel = 0
				BoxText_1.Position = UDim2.new(-0.0660792962, 0,0, 0)
				BoxText_1.Size = UDim2.new(0, 192,0, 21)
				BoxText_1.Font = Enum.Font.Gotham
				BoxText_1.Text = BoxName
				BoxText_1.TextColor3 = Color3.fromRGB(255,255,255)
				BoxText_1.TextSize = 13
				BoxText_1.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_5.Parent = Box_1
				UIPadding_5.PaddingLeft = UDim.new(0,15)

				TextBox_1.Parent = Box_1
				TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
				TextBox_1.BackgroundTransparency = 1
				TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
				TextBox_1.BorderSizePixel = 0
				TextBox_1.CursorPosition = -1
				TextBox_1.Position = UDim2.new(0.845815003, 0,0, 0)
				TextBox_1.Size = UDim2.new(0, 35,0, 21)
				TextBox_1.Font = Enum.Font.Gotham
				TextBox_1.ClipsDescendants = true
				TextBox_1.PlaceholderColor3 = Color3.fromRGB(210,181,165)
				TextBox_1.PlaceholderText = "..."
				TextBox_1.Text = ""
				TextBox_1.TextColor3 = Color3.fromRGB(210,181,165)
				TextBox_1.TextSize = 12
				
				TextBox_1.FocusLost:Connect(function()
					Callback(TextBox_1.Text)
				end)
				
			end
local TweenService = game:GetService("TweenService")

function Elements:CreateDropdown(DropdownName, options, Callback)
    local Dropdown_1 = Instance.new("Frame")
    local UIPadding_7 = Instance.new("UIPadding")
    local DropdownText_1 = Instance.new("TextLabel")
    local DropdownBtn_1 = Instance.new("TextButton")
    local ItemHolderHolder_1 = Instance.new("Frame")
    local UICorner_99 = Instance.new("UICorner")
    local UIStroke_99 = Instance.new("UIStroke")
    local ItemHolder_1 = Instance.new("ScrollingFrame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    
    Dropdown_1.Name = "Dropdown"
    Dropdown_1.Parent = Items_1
    Dropdown_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Dropdown_1.BackgroundTransparency = 1
    Dropdown_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Dropdown_1.BorderSizePixel = 0
    Dropdown_1.Size = UDim2.new(0, 242,0, 21)

    UIPadding_7.Parent = Dropdown_1
    UIPadding_7.PaddingLeft = UDim.new(0,15)

    DropdownText_1.Name = "DropdownText"
    DropdownText_1.Parent = Dropdown_1
    DropdownText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    DropdownText_1.BackgroundTransparency = 1
    DropdownText_1.BorderColor3 = Color3.fromRGB(0,0,0)
    DropdownText_1.BorderSizePixel = 0
    DropdownText_1.Position = UDim2.new(-0.0660792962, 0,0, 0)
    DropdownText_1.Size = UDim2.new(0, 146,0, 21)
    DropdownText_1.Font = Enum.Font.Gotham
    DropdownText_1.Text = DropdownName
    DropdownText_1.TextColor3 = Color3.fromRGB(255,255,255)
    DropdownText_1.TextSize = 13
    DropdownText_1.TextXAlignment = Enum.TextXAlignment.Left

    DropdownBtn_1.Name = "DropdownBtn"
    DropdownBtn_1.Parent = Dropdown_1
    DropdownBtn_1.Active = true
    DropdownBtn_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    DropdownBtn_1.BackgroundTransparency = 1
    DropdownBtn_1.BorderColor3 = Color3.fromRGB(0,0,0)
    DropdownBtn_1.BorderSizePixel = 0
    DropdownBtn_1.Position = UDim2.new(0.845815003, 0,0, 0)
    DropdownBtn_1.Size = UDim2.new(0, 34,0, 21)
    DropdownBtn_1.Font = Enum.Font.Gotham
    DropdownBtn_1.Text = "Select"
    DropdownBtn_1.TextColor3 = Color3.fromRGB(210,181,165)
    DropdownBtn_1.TextSize = 12
    DropdownBtn_1.TextXAlignment = Enum.TextXAlignment.Right
    
    ItemHolderHolder_1.Name = "ItemHolderHolder"
    ItemHolderHolder_1.Parent = Dropdown_1
    ItemHolderHolder_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
    ItemHolderHolder_1.BackgroundTransparency = 0.8
    ItemHolderHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
    ItemHolderHolder_1.BorderSizePixel = 0
    ItemHolderHolder_1.Position = UDim2.new(0, 0,0, 25)
    ItemHolderHolder_1.Size = UDim2.new(0, 218,0, 45)
    ItemHolderHolder_1.Visible = false

    UICorner_99.Parent = ItemHolderHolder_1
    UICorner_99.CornerRadius = UDim.new(0,12)

    UIStroke_99.Parent = ItemHolderHolder_1
    UIStroke_99.Color = Color3.fromRGB(210,181,165)
    UIStroke_99.Thickness = 2

    ItemHolder_1.Name = "ItemHolder"
    ItemHolder_1.Parent = ItemHolderHolder_1
    ItemHolder_1.Active = true
    ItemHolder_1.AnchorPoint = Vector2.new(0.5, 0.5)
    ItemHolder_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
    ItemHolder_1.BackgroundTransparency = 1
    ItemHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
    ItemHolder_1.BorderSizePixel = 0
    ItemHolder_1.Position = UDim2.new(0.5,0,0.5,0)
    ItemHolder_1.Size = UDim2.new(0, 200,0, 45)
    ItemHolder_1.ClipsDescendants = true
    ItemHolder_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ItemHolder_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
    ItemHolder_1.CanvasPosition = Vector2.new(0, 0)
    ItemHolder_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
    ItemHolder_1.ElasticBehavior = Enum.ElasticBehavior.Never
    ItemHolder_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    ItemHolder_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    ItemHolder_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
    ItemHolder_1.ScrollBarImageTransparency = 1
    ItemHolder_1.ScrollBarThickness = 1
    ItemHolder_1.ScrollingDirection = Enum.ScrollingDirection.Y
    ItemHolder_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
    ItemHolder_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
    ItemHolder_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

    UIListLayout_2.Parent = ItemHolder_1
    UIListLayout_2.Padding = UDim.new(0,2)
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

    local function ToggleDropdown()
        local closedSize = UDim2.new(0, 242, 0, 21)
        local openedSize = UDim2.new(0, 242, 0, 75)
        local newSize = ItemHolderHolder_1.Visible and closedSize or openedSize
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(Dropdown_1, tweenInfo, {Size = newSize})
        tween:Play()
        if not ItemHolderHolder_1.Visible then
            wait(0.3) -- Add a delay before making ItemHolderHolder visible
        end
        ItemHolderHolder_1.Visible = not ItemHolderHolder_1.Visible
    end

    DropdownBtn_1.MouseButton1Click:Connect(ToggleDropdown)

    for _, option in ipairs(options) do
        local DropdownOption_1 = Instance.new("TextButton")
        DropdownOption_1.Name = "DropdownOption"
        DropdownOption_1.Parent = ItemHolder_1
        DropdownOption_1.Active = true
        DropdownOption_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        DropdownOption_1.BackgroundTransparency = 1
        DropdownOption_1.BorderColor3 = Color3.fromRGB(0,0,0)
        DropdownOption_1.BorderSizePixel = 0
        DropdownOption_1.Size = UDim2.new(0, 200,0, 18)
        DropdownOption_1.Font = Enum.Font.Gotham
        DropdownOption_1.Text = option
        DropdownOption_1.TextColor3 = Color3.fromRGB(210,181,165)
        DropdownOption_1.TextSize = 13

        DropdownOption_1.MouseButton1Click:Connect(function()
            Callback(option)
            local closedSize = UDim2.new(0, 242, 0, 21)
            local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(Dropdown_1, tweenInfo, {Size = closedSize})
            tween:Play()
            ItemHolderHolder_1.Visible = false
            DropdownBtn_1.Text = option
        end)
    end
end

			return Elements
		end
		return Sec
	end
	return Tabs
end
return Library