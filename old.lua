local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local CoreGui = game:GetService("CoreGui")
	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local HttpService = game:GetService("HttpService")

	local Mouse = Players.LocalPlayer:GetMouse(Players.LocalPlayer)
	
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local function Tween(object, goal)
		TweenService:Create(object, tweenInfo, goal):Play()
	end

	-- variables
	local library = { Toggles = {}, Options = {}, Labels = {} }
	local signals = {} 

	-- scripting
	function library.new(settings)
		local GUI = {}

		-- create window
		do 
			GUI.Moonlight = Instance.new("Folder")
			GUI.ScreenGui = Instance.new("ScreenGui")
            GUI.Notifications = Instance.new("Folder")
			GUI.Application = Instance.new("Frame")
			GUI.Outline2 = Instance.new("Frame")
			GUI.Scale = Instance.new("UIScale")
			GUI.Constraint = Instance.new("UISizeConstraint")
			GUI.Components = Instance.new("Folder")
			GUI.Drag = Instance.new("Frame")
			GUI.Container_2 = Instance.new("Frame")
			GUI.Sidebar = Instance.new("Frame")
			GUI.Header = Instance.new("TextLabel")
			GUI.Constraint_2 = Instance.new("UISizeConstraint")
			GUI.Outline = Instance.new("Folder")
			GUI.Frame = Instance.new("Frame")
			GUI.Container = Instance.new("Frame")
			GUI.Tabulate = Instance.new("TextButton")
			GUI.Text = Instance.new("TextLabel")
			GUI.Icon = Instance.new("ImageLabel")
			GUI.UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			GUI.Layout = Instance.new("UIListLayout")
			GUI.Padding = Instance.new("UIPadding")
			GUI.Layout_2 = Instance.new("UIListLayout")
			GUI.Tabulate_2 = Instance.new("TextButton")
			GUI.Text_2 = Instance.new("TextLabel")
			GUI.Icon_2 = Instance.new("ImageLabel")
			GUI.UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			GUI.Layout_3 = Instance.new("UIListLayout")
			GUI.Styling = Instance.new("Folder")

			GUI.Moonlight.Name = "Moonlight"
			GUI.Moonlight.Parent = RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui

			GUI.ScreenGui.Parent = GUI.Moonlight
			GUI.ScreenGui.DisplayOrder = 15
			GUI.ScreenGui.ResetOnSpawn = false

            GUI.Notifications.Name = "Notifications"
            GUI.Notifications.Parent = GUI.ScreenGui

			GUI.Application.Name = "Application"
			GUI.Application.Parent = GUI.ScreenGui
			GUI.Application.AnchorPoint = Vector2.new(0.5, 0.5)
			GUI.Application.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			GUI.Application.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Application.BorderSizePixel = 0
			GUI.Application.Position = UDim2.new(0.5, 0, 0.5, 0)
			GUI.Application.Size = UDim2.new(1, 0, 1, 0)
			GUI.Application.ZIndex = 0

			GUI.Drag.Name = "Drag"
			GUI.Drag.Parent = GUI.Application
			GUI.Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			GUI.Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Drag.BorderSizePixel = 0
			GUI.Drag.Size = UDim2.new(0, 150, 0, 55)
			GUI.Drag.BackgroundTransparency = 1

			GUI.Outline2.Name = "Outline"
			GUI.Outline2.Parent = GUI.Application
			GUI.Outline2.BackgroundColor3 = Color3.fromRGB(29, 24, 31)
			GUI.Outline2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Outline2.BorderSizePixel = 0
			GUI.Outline2.Position = UDim2.new(0, 0, 0.121428572, 0)
			GUI.Outline2.Size = UDim2.new(0, 150, 0, 1)

			GUI.Scale.Name = "Scale"
			GUI.Scale.Parent = GUI.Application

			GUI.Constraint.Name = "Constraint"
			GUI.Constraint.Parent = GUI.Application
			GUI.Constraint.MaxSize = Vector2.new(660, 420)

			GUI.Components.Name = "Components"
			GUI.Components.Parent = GUI.Application

			GUI.Sidebar.Name = "Sidebar"
			GUI.Sidebar.Parent = GUI.Components
			GUI.Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			GUI.Sidebar.BackgroundTransparency = 1.000
			GUI.Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Sidebar.BorderSizePixel = 0
			GUI.Sidebar.Size = UDim2.new(1, 0, 1, 0)

			GUI.Constraint_2.Name = "Constraint"
			GUI.Constraint_2.Parent = GUI.Sidebar
			GUI.Constraint_2.MaxSize = Vector2.new(150, 9e9)

			GUI.Outline.Name = "Outline"
			GUI.Outline.Parent = GUI.Sidebar

			GUI.Frame.Parent = GUI.Outline
			GUI.Frame.BackgroundColor3 = Color3.fromRGB(29, 24, 31)
			GUI.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Frame.BorderSizePixel = 0
			GUI.Frame.Position = UDim2.new(1, 0, 0, 0)
			GUI.Frame.Size = UDim2.new(0, 1, 1, 0)

			GUI.Container.Name = "Container"
			GUI.Container.Parent = GUI.Sidebar
			GUI.Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			GUI.Container.BackgroundTransparency = 1.000
			GUI.Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Container.BorderSizePixel = 0
			GUI.Container.Size = UDim2.new(1, 0, 1, 0)

			GUI.Padding.Name = "Padding"
			GUI.Padding.Parent = GUI.Container
			GUI.Padding.PaddingBottom = UDim.new(0, 25)
			GUI.Padding.PaddingLeft = UDim.new(0, 25)
			GUI.Padding.PaddingRight = UDim.new(0, 25)
			GUI.Padding.PaddingTop = UDim.new(0, 64)

			GUI.Layout_2.Name = "Layout"
			GUI.Layout_2.Parent = GUI.Container
			GUI.Layout_2.SortOrder = Enum.SortOrder.LayoutOrder
			GUI.Layout_2.Padding = UDim.new(0, 12)

			GUI.Header.Name = "Header"
			GUI.Header.Parent = GUI.Sidebar
			GUI.Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			GUI.Header.BackgroundTransparency = 1.000
			GUI.Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
			GUI.Header.BorderSizePixel = 0
			GUI.Header.Position = UDim2.new(0, 25, 0, 25)
			GUI.Header.Size = UDim2.new(1, -50, 0, 14)
			GUI.Header.Font = Enum.Font.Montserrat
			GUI.Header.Text = "Moonlight"
			GUI.Header.TextColor3 = Color3.fromRGB(217, 213, 219)
			GUI.Header.TextSize = 14.000
			GUI.Header.TextXAlignment = Enum.TextXAlignment.Left

			GUI.Styling.Name = "Styling"
			GUI.Styling.Parent = GUI.Moonlight

			-- drag the ui time
			local dragging = false
			local pos = nil

			table.insert(signals, GUI.Drag.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					pos = GUI.Application.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
				end
			end))

			table.insert(signals, GUI.Drag.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end))

			table.insert(signals, UserInputService.InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local mousePos = input.Position 
					GUI.Application.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y) + pos
				end
			end))
		end

		-- now for the copy shit 
		local function CopyButton()
			local TextButton = Instance.new("TextButton")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")

			TextButton.Text = ""
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 460, 0, 57)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.TextSize = 14.000

			Border.Name = "Border"
			Border.Parent = TextButton
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = TextButton
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description.Name = "Description"
			Description.Parent = TextButton
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 14, 0, 30)
			Description.Size = UDim2.new(1, -14, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description.TextSize = 12.000
			Description.TextXAlignment = Enum.TextXAlignment.Left

			return TextButton
		end

		local function CopyToggle()
			local MainFrame = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local Border2 = Instance.new("UIStroke")
			local Toggle = Instance.new("Frame")
			local Vector = Instance.new("ImageButton")

			MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainFrame.BackgroundTransparency = 1.000
			MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainFrame.BorderSizePixel = 0
			MainFrame.Size = UDim2.new(0, 460, 0, 57)

			Border.Name = "Border"
			Border.Parent = MainFrame
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = MainFrame
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description.Name = "Description"
			Description.Parent = MainFrame
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 14, 0, 30)
			Description.Size = UDim2.new(1, -14, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.TextColor3 = Color3.fromRGB(62, 61, 63) -- Color3.fromRGB(62, 61, 63)
			Description.TextSize = 12.000
			Description.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = MainFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(106, 106, 119)
			Toggle.BorderSizePixel = 0
			Toggle.BackgroundTransparency = 1
			Toggle.Position = UDim2.new(0, 417, 0, 20)
			Toggle.Size = UDim2.new(0, 15, 0, 15)
			
			Border2.Name = "Border"
			Border2.Parent = Toggle
			Border2.ApplyStrokeMode = "Border"
			Border2.Color = Color3.fromRGB(79,74,71)
			Border2.LineJoinMode = "Round"
			Border2.Thickness = 1
			
			Vector.Name = "Vector"
			Vector.Parent = Toggle
			Vector.BackgroundTransparency = 1.000
			Vector.Position = UDim2.new(0, 0, 0, 0)
			Vector.Size = UDim2.new(0, 15, 0, 15)
			Vector.ZIndex = 2
			Vector.Image = "rbxassetid://3926305904"
			Vector.ImageColor3 = Color3.fromRGB(98, 94, 91)
			Vector.ImageRectOffset = Vector2.new(312, 4)
			Vector.ImageRectSize = Vector2.new(24, 24)

			return MainFrame
		end

		local function CopyBind()
			local MainFrame = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local Toggle = Instance.new("Frame")
			local Text = Instance.new("TextLabel")

			MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			MainFrame.BackgroundTransparency = 1.000
			MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainFrame.BorderSizePixel = 0
			MainFrame.Size = UDim2.new(0, 460, 0, 57)

			Border.Name = "Border"
			Border.Parent = MainFrame
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Heading.Name = "Heading"
			Heading.Parent = MainFrame
			Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Heading.BackgroundTransparency = 1.000
			Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Heading.BorderSizePixel = 0
			Heading.Position = UDim2.new(0, 14, 0, 14)
			Heading.Size = UDim2.new(1, -14, 0, 12)
			Heading.Font = Enum.Font.Montserrat
			Heading.TextColor3 = Color3.fromRGB(147, 140, 150)
			Heading.TextSize = 12.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left

			Description.Name = "Description"
			Description.Parent = MainFrame
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 14, 0, 30)
			Description.Size = UDim2.new(1, -14, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description.TextSize = 12.000
			Description.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = MainFrame
			Toggle.BackgroundColor3 = Color3.fromRGB(98, 94, 91) --Color3.fromRGB(116, 118, 118)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0, 417, 0, 20)
			Toggle.Size = UDim2.new(0, 15, 0, 15)

			Text.Name = "Text"
			Text.Parent = MainFrame
			Text.RichText = true
			Text.BackgroundTransparency = 1.000
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0, 421, 0, 22)
			Text.Size = UDim2.new(0, 15, 0, 15)
			Text.Font = Enum.Font.Montserrat
			Text.TextColor3 = Color3.fromRGB(28, 24, 31)
			Text.TextSize = 10.000
			Text.TextXAlignment = Enum.TextXAlignment.Right
			Text.SizeConstraint = Enum.SizeConstraint.RelativeXY
			Text.TextXAlignment = Enum.TextXAlignment.Left
			Text.TextYAlignment = Enum.TextYAlignment.Top

			return MainFrame
		end

		local function CopyInput()
			local Input = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local Textbox = Instance.new("Frame")
			local UIStroke  = Instance.new("UIStroke")
			local Text = Instance.new("TextBox")

			Input.Name = "Input"
			Input.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Input.BorderSizePixel = 0
			Input.Size = UDim2.new(0, 460, 0, 99)

			Border.Name = "Border"
			Border.Parent = Input
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Content.Name = "Content"
			Content.Parent = Input
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 1.000
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Heading.Name = "Heading"
			Heading.Parent = Content
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = "Input"
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description.Name = "Description"
			Description.Parent = Content
			Description.BackgroundTransparency = 1.000
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 0, 0, 17)
			Description.Size = UDim2.new(0, 432, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.Text = "Description"
			Description.TextColor3 = Color3.fromRGB(31, 31, 33)
			Description.TextSize = 10.000
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.TextYAlignment = Enum.TextYAlignment.Top

			Textbox.Name = "Textbox"
			Textbox.Parent = Input
			Textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Textbox.BackgroundTransparency = 1.000
			Textbox.BorderSizePixel = 0
			Textbox.Position = UDim2.new(0, 14, 0, 53)
			Textbox.Size = UDim2.new(0, 432, 0, 32)

			Text.Name = "Text"
			Text.Parent = Textbox
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1.000
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.0162037034, 0, 0, 0)
			Text.Size = UDim2.new(0, 414, 0, 30)
			Text.Font = Enum.Font.SourceSans
			Text.PlaceholderText = "Enter Text"
			Text.Text = ""
			Text.ClearTextOnFocus = false
			Text.TextColor3 = Color3.fromRGB(162, 162, 162)
			Text.TextSize = 14.000
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left

			UIStroke.Name = "UIStroke"
			UIStroke.Parent = Textbox
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke.Color = Color3.fromRGB(28,24,31)
			UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
			UIStroke.Thickness = 1 

			return Input
		end

		local function CopyDropdown()
			local Dropdown = Instance.new("Frame")
			local Register = Instance.new("Frame")

			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Title = Instance.new("Frame")
			local Frame = Instance.new("Frame")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local expand_less = Instance.new("ImageButton")

			local Popup = Instance.new("Frame")
			local Border2 = Instance.new("UIStroke")
			local Scale = Instance.new("UIScale")
			local Constraint = Instance.new("UISizeConstraint")
			local Options = Instance.new("Frame")
			local UIPadding = Instance.new("UIPadding")
			local UIListLayout = Instance.new("UIListLayout")

			Dropdown.Name = "Dropdown"
			Dropdown.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Dropdown.BorderSizePixel = 0
			Dropdown.Size = UDim2.new(0, 460, 0, 57)

			Register.Name = "Register"
			Register.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Register.Size = UDim2.new(0, 460, 0, 57)
			Register.Parent = Dropdown

			Border.Name = "Border"
			Border.Parent = Register
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Content.Name = "Content"
			Content.Parent = Register
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 1.000
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Title.Name = "Title"
			Title.Parent = Content
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0, 432, 0, 29)

			Frame.Parent = Title
			Frame.BackgroundTransparency = 1
			Frame.BackgroundColor3 = Color3.fromRGB(53, 54, 58)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 417, 0, 7)
			Frame.Size = UDim2.new(0, 15, 0, 15)

			Heading.Name = "Heading"
			Heading.Parent = Title
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = "Bind"
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundTransparency = 1.000
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 0, 0, 17)
			Description.Size = UDim2.new(0, 432, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.Text = "Description"
			Description.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description.TextSize = 10.000
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.TextYAlignment = Enum.TextYAlignment.Top

			expand_less.Name = "expand_less"
			expand_less.Parent = Title
			expand_less.BackgroundTransparency = 1.000
			expand_less.Position = UDim2.new(0.959259331, 0, 0.137023926, 0)
			expand_less.Size = UDim2.new(0, 20, 0, 20)
			expand_less.ZIndex = 2
			expand_less.Rotation = 180
			expand_less.Image = "rbxassetid://3926305904"
			expand_less.ImageRectOffset = Vector2.new(44, 404)
			expand_less.ImageRectSize = Vector2.new(36, 36)

			Popup.Name = "Pop-up"
			Popup.Parent = Title
			Popup.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Popup.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Popup.BorderSizePixel = 0
			Popup.Position = UDim2.new(0, 346, 0, 52)
			Popup.Size = UDim2.new(0, 100, 0, 52)

			Border2.Name = "Border"
			Border2.Parent = Popup
			Border2.ApplyStrokeMode = "Border"
			Border2.Color = Color3.fromRGB(29,24,31)
			Border2.LineJoinMode = "Round"
			Border2.Thickness = 1

			Scale.Name = "Scale"
			Scale.Parent = Popup

			Constraint.Name = "Constraint"
			Constraint.Parent = Popup
			Constraint.MaxSize = Vector2.new(660, 420)

			Options.Name = "Options"
			Options.Parent = Popup
			Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Options.BackgroundTransparency = 1.000
			Options.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Options.BorderSizePixel = 0
			Options.Size = UDim2.new(1, 0, 1, 0)

			UIPadding.Parent = Options
			UIPadding.PaddingBottom = UDim.new(0, 12)
			UIPadding.PaddingLeft = UDim.new(0, 12)
			UIPadding.PaddingRight = UDim.new(0, 12)
			UIPadding.PaddingTop = UDim.new(0, 12)

			UIListLayout.Parent = Popup
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 4)
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left

			return Dropdown
		end

		local function CopyDivider()
			local Divider = Instance.new("Frame")
			local Looks = Instance.new("Frame")

			Divider.Name = "Divider"
			Divider.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			Divider.BackgroundTransparency = 1.000
			Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Divider.BorderSizePixel = 0
			Divider.Position = UDim2.new(-0.00217391294, 0, 0.170270264, 0)
			Divider.Size = UDim2.new(0, 460, 0, 15)

			Looks.Name = "Looks"
			Looks.Parent = Divider
			Looks.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			Looks.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Looks.BorderSizePixel = 0
			Looks.Position = UDim2.new(0, 0, 0.413793117, 0)
			Looks.Size = UDim2.new(0, 460, 0, 3)

			return Divider
		end
		
		local function CopyLabel(txt)
			local Divider = Instance.new("Frame")
			local TextLabel = Instance.new("TextLabel")

			Divider.Name = "Divider"
			Divider.BackgroundColor3 = Color3.fromRGB(28, 24, 31)
			Divider.BackgroundTransparency = 1.000
			Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Divider.BorderSizePixel = 0
			Divider.Position = UDim2.new(-0.00217391294, 0, 0.170270264, 0)
			Divider.Size = UDim2.new(0, 460, 0, 29)

			TextLabel.Parent = Divider
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.0218477994, 0, 0.206896558, 0)
			TextLabel.Size = UDim2.new(0, 446, 0, 15)
			TextLabel.Font = Enum.Font.Montserrat
			TextLabel.Text = txt
			TextLabel.TextColor3 = Color3.fromRGB(162, 162, 162)
			TextLabel.TextSize = 12.000
			TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			
			return Divider
		end
		
		local function CopyColor()
			local Switch = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Title = Instance.new("Frame")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local Toggle = Instance.new("TextButton")
			local Frame = Instance.new("Frame")
			local Border2 = Instance.new("UIStroke")
			
			Switch.Name = "ColorPicker"
			Switch.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Switch.BorderSizePixel = 0
			Switch.Size = UDim2.new(0, 460, 0, 57)
			
			Border.Name = "Border"
			Border.Parent = Switch
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1
			
			Content.Name = "Content"
			Content.Parent = Switch
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 1.000
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Title.Name = "Title"
			Title.Parent = Content
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0, 432, 0, 29)

			Heading.Name = "Heading"
			Heading.Parent = Title
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = "Color"
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11.000
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundTransparency = 1.000
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 0, 0, 17)
			Description.Size = UDim2.new(0, 432, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.Text = "Description"
			Description.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description.TextSize = 10.000
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.TextYAlignment = Enum.TextYAlignment.Top

			Toggle.Name = "Toggle"
			Toggle.TextTransparency = 1 
			Toggle.AutoButtonColor = false
			Toggle.Parent = Title
			Toggle.Text = ''
			Toggle.BackgroundColor3 = Color3.fromRGB(124, 169, 255)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0, 417, 0, 7)
			Toggle.Size = UDim2.new(0, 15, 0, 15)
			
			Frame.BackgroundTransparency = 1
			Frame.Parent = Title
			Frame.Position = UDim2.new(0, 417, 0, 7)
			Frame.Size = UDim2.new(0, 15, 0, 15)
			
			Border2.Parent = Frame
			Border2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			Border2.Color = Color3.fromRGB(51,51,51)
			Border2.LineJoinMode = Enum.LineJoinMode.Miter
			Border2.Thickness = 2
			return Switch
		end
		
		local function CopySlider()
			local Slider = Instance.new("Frame")
			local Border = Instance.new("UIStroke")
			local Content = Instance.new("Frame")
			local Title = Instance.new("Frame")
			local Current = Instance.new("TextLabel")
			local Maximum = Instance.new("TextLabel")
			local Heading = Instance.new("TextLabel")
			local Description = Instance.new("TextLabel")
			local Frame1 = Instance.new("Frame")
			local Border2 = Instance.new("UIStroke")
			local Frame2 = Instance.new("Frame")
			
			Slider.Name = "Slider"
			Slider.BackgroundColor3 = Color3.fromRGB(14, 12, 15)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 460, 0, 67)
			Slider.ZIndex = 1
			
			Border.Name = "Border"
			Border.Parent = Slider
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1

			Content.Name = "Content"
			Content.Parent = Slider
			Content.BackgroundTransparency = 1
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 14, 0, 14)
			Content.Size = UDim2.new(0, 432, 0, 29)

			Title.Name = "Title"
			Title.Parent = Content
			Title.BackgroundTransparency = 1.000
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0, 432, 0, 29)

			Current.Name = "Current"
			Current.Parent = Title
			Current.BackgroundTransparency = 1.000
			Current.BorderSizePixel = 0
			Current.Position = UDim2.new(0, 418, 0, 0)
			Current.Size = UDim2.new(0, 14, 0, 13)
			Current.Font = Enum.Font.Montserrat
			Current.Text = "50"
			Current.TextColor3 = Color3.fromRGB(147, 140, 149)
			Current.TextSize = 10
			Current.TextXAlignment = Enum.TextXAlignment.Left
			Current.TextYAlignment = Enum.TextYAlignment.Top

			Maximum.Name = "Maximum"
			Maximum.Parent = Title
			Maximum.BackgroundTransparency = 1.000
			Maximum.BorderSizePixel = 0
			Maximum.Position = UDim2.new(0, 414, 0, 17)
			Maximum.Size = UDim2.new(0, 18, 0, 12)
			Maximum.Font = Enum.Font.Montserrat
			Maximum.Text = "100"
			Maximum.TextColor3 = Color3.fromRGB(62, 61, 63)
			Maximum.TextSize = 10
			Maximum.TextXAlignment = Enum.TextXAlignment.Left
			Maximum.TextYAlignment = Enum.TextYAlignment.Top

			Heading.Name = "Heading"
			Heading.Parent = Title
			Heading.BackgroundTransparency = 1.000
			Heading.BorderSizePixel = 0
			Heading.Size = UDim2.new(0, 264, 0, 13)
			Heading.Font = Enum.Font.Montserrat
			Heading.Text = "Slider"
			Heading.TextColor3 = Color3.fromRGB(147, 140, 149)
			Heading.TextSize = 11
			Heading.TextXAlignment = Enum.TextXAlignment.Left
			Heading.TextYAlignment = Enum.TextYAlignment.Top

			Description.Name = "Description"
			Description.Parent = Title
			Description.BackgroundTransparency = 1.000
			Description.BorderSizePixel = 0
			Description.Position = UDim2.new(0, 0, 0, 17)
			Description.Size = UDim2.new(0, 432, 0, 12)
			Description.Font = Enum.Font.Montserrat
			Description.Text = "Description"
			Description.TextColor3 = Color3.fromRGB(62, 61, 63)
			Description.TextSize = 11
			Description.TextXAlignment = Enum.TextXAlignment.Left
			Description.TextYAlignment = Enum.TextYAlignment.Top

			Frame1.Name = "Frame 1"
			Frame1.Parent = Slider
			Frame1.BackgroundColor3 = Color3.fromRGB(19, 15, 20)
			Frame1.BorderSizePixel = 0
			Frame1.Position = UDim2.new(0, 14, 0, 49)
			Frame1.Size = UDim2.new(0, 432, 0, 8)
			
			Frame2.Name = "Frame 2"
			Frame2.Parent = Frame1
			Frame2.BackgroundColor3 = Color3.fromRGB(120, 82, 255)
			Frame2.BorderSizePixel = 0
			Frame2.Size = UDim2.new(0.01, 0, 0, 8)

			Border2.Name = "Border"
			Border2.Parent = Frame1
			Border2.ApplyStrokeMode = "Border"
			Border2.Color = Color3.fromRGB(29,24,31)
			Border2.LineJoinMode = "Round"
			Border2.Thickness = 1
			
			return Slider
		end

		local function CopyText(text)
			local TextLabel = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local Border = Instance.new("UIStroke")

			Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.BackgroundTransparency = 1 
			Frame.Position = UDim2.new(0.0218477994, 0, 0.206896558, 0)
			Frame.Size = UDim2.new(0, 460, 0, 32)

			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.Parent = Frame
			TextLabel.Name = "Text"
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.02, 1, 0, 1)
			TextLabel.Size = UDim2.new(0, 460, 0, 32)
			TextLabel.Font = Enum.Font.Montserrat
			TextLabel.TextColor3 = Color3.fromRGB(162, 162, 162)
			TextLabel.TextSize = 12.000
			TextLabel.Text = text
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

			Border.Name = "Border"
			Border.Parent = Frame
			Border.ApplyStrokeMode = "Border"
			Border.Color = Color3.fromRGB(29,24,31)
			Border.LineJoinMode = "Round"
			Border.Thickness = 1
			
			return Frame
		end
		
        local function NewNotification(title, description, duration)
            local ScreenGui = Instance.new("ScreenGui")
            local Main = Instance.new("Frame")
            local Border = Instance.new("UIStroke")
            local UICorner = Instance.new("UICorner")
            local Line = Instance.new("Frame")
            local close = Instance.new("ImageButton")
            local Title = Instance.new("TextLabel")
            local Description = Instance.new("TextLabel")

            ScreenGui.Parent = GUI.Notifications
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            Main.Name = "Main"
            Main.Parent = ScreenGui
            Main.ClipsDescendants = false 
            Main.BackgroundColor3 = Color3.fromRGB(0, 12, 15)
            Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Main.BorderSizePixel = 0
            if #GUI.Notifications:GetChildren() == 1 then 
                Main.Position = UDim2.new(0.00813008193, 0, 0.853932559, 0)
            else 
                Main.Position = UDim2.new(0.00813008193, 0, 0.853932559 - (0.1 * (#GUI.Notifications:GetChildren() - 1)) , 0)
            end

            Main.Size = UDim2.new(0, 0, 0, 77)
            
            UICorner.CornerRadius = UDim.new(0, 3)
            UICorner.Parent = Main
            
            Border.Name = "Border"
            Border.Parent = Main
            Border.ApplyStrokeMode = "Border"
            Border.Color = Color3.fromRGB(29,24,31)
            Border.LineJoinMode = "Round"
            Border.Thickness = 1

            Line.Name = "Line"
            Line.Parent = Main
            Line.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
            Line.BorderColor3 = Color3.fromRGB(38, 38, 38)
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(0, 0, 0.280000001, 0)
            Line.Size = UDim2.new(0, 0, 0, 1)
            
            close.Name = "close"
            close.Parent = Main
            close.BackgroundTransparency = 1.000
            close.Position = UDim2.new(0.914285719, 0, 0, 4)
            close.Size = UDim2.new(0, 15, 0, 15)
            close.ZIndex = 2
            close.Image = "rbxassetid://3926305904"
            close.ImageRectOffset = Vector2.new(284, 4)
            close.ImageRectSize = Vector2.new(24, 24)
            
            Title.Name = "Title"
            Title.Parent = Main
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.Position = UDim2.new(0.0299999993, 0, 0, 4)
            Title.Size = UDim2.new(0, 177, 0, 15)
            Title.Font = Enum.Font.Montserrat
            Title.Text = title
            Title.TextColor3 = Color3.fromRGB(180, 180, 180)
            Title.TextSize = 12.000
            Title.TextXAlignment = Enum.TextXAlignment.Left
            
            Description.Name = "Description"
            Description.Parent = Main
            Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Description.BackgroundTransparency = 1.000
            Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Description.BorderSizePixel = 0
            Description.Position = UDim2.new(0.0238095243, 0, 0.377100557, 0)
            Description.Size = UDim2.new(0, 200, 0, 38)
            Description.Font = Enum.Font.Montserrat
            Description.Text = description
            Description.TextColor3 = Color3.fromRGB(180, 180, 180)
            Description.TextSize = 16.000
            Description.TextWrapped = true

            local closed = false 

            local function closeNotifcation()
                if closed then return else closed = true end 

                Line:TweenSize(UDim2.new(0, 0, 0, 77), "Out", "Quad", 0.5, true)
                Main:TweenSize(UDim2.new(0, 0, 0, 77), "Out", "Quad", 0.5, true)

                wait(0.2)
                Title.Visible = false 
                Description.Visible = false 

                wait(0.3)
                ScreenGui:Destroy()
            end

            Line:TweenSize(UDim2.new(0, 210, 0, 1), "Out", "Quad", 0.5, true)
            Main:TweenSize(UDim2.new(0, 210, 0, 77), "In", "Quad", 0.3, true)

            spawn(function()
                wait(duration)
                closeNotifcation()
            end)

            close.MouseButton1Click:Connect(function()
                closeNotifcation()
            end)
        end

		-- functions
		local function ChangeWindow(name)
			if name == GUI.Current then return end 
			if not GUI.Components:FindFirstChild(GUI.Current) then return error("Window Not Found") end 
			if not GUI.Components:FindFirstChild(name) then return error("Window Not Found (2)") end 
			if not GUI.Components.Sidebar.Container:FindFirstChild(GUI.Current) then return error ("Window Not Found (3)") end
			if not GUI.Components.Sidebar.Container:FindFirstChild(name) then return error ("Window Not Found (4)") end 

			GUI.Components[GUI.Current][GUI.Current].Visible = false 
			GUI.Components[GUI.Current].ZIndex = 1
			GUI.Components.Sidebar.Container[GUI.Current]:FindFirstChild("Text").TextColor3 = Color3.fromRGB(62, 61, 63)
			
			GUI.Components[name][name].Visible = true 
			GUI.Components[name].ZIndex = 2
			GUI.Components.Sidebar.Container[name]:FindFirstChild("Text").TextColor3 = Color3.fromRGB(147, 140, 150)

			GUI.Current = name
		end

		function GUI:Window(name, icon)
			-- loading
			if not icon then icon = 'rbxassetid://10734909375' else if string.match(icon, "rbxassetid://") then icon = icon else icon = 'rbxassetid://' .. icon end end
			
			local Frame = Instance.new("ScrollingFrame")
			local Window = Instance.new("Frame")
			
			do 
				local GridLayout = Instance.new("UIListLayout")
				
				Frame.Name = name
				Frame.Parent = GUI.Components
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.BackgroundTransparency = 1.000
				Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 151, 0, 0)
				Frame.Size = UDim2.new(1.07121217, -200, 1.11852372, -50)
				Frame.ScrollingEnabled = true
				Frame.CanvasSize = UDim2.new(0, 0, 500, 0)
				Frame.ScrollBarImageTransparency = 1
				Frame.ZIndex = 1
				Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
				
				Window.Name = name
				Window.Parent = Frame
				Window.BackgroundTransparency = 1.000
				Window.BorderSizePixel = 0
				Window.Position = UDim2.new(0, 25, 0, 25)
				Window.Size = UDim2.new(1.3, -200, 1.06, -50)
				Window.Visible = false
				
				GridLayout.Padding = UDim.new(0.03,0)  
				GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
				GridLayout.Parent = Window

				local SideBar = Instance.new('TextButton')
				local Layout = Instance.new("UIListLayout")
				local Text = Instance.new('TextLabel')
				local Icon = Instance.new('ImageLabel')
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

				SideBar.Name = name
				SideBar.Parent = GUI.Container
				SideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SideBar.BackgroundTransparency = 1.000
				SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				SideBar.BorderSizePixel = 0
				SideBar.Size = UDim2.new(1, 0, 0, 12)
				SideBar.Font = Enum.Font.SourceSans
				SideBar.Text = ""
				SideBar.TextColor3 = Color3.fromRGB(0, 0, 0)
				SideBar.TextSize = 14.000

				Layout.Name = "Layout"
				Layout.Parent = SideBar
				Layout.FillDirection = Enum.FillDirection.Horizontal
				Layout.SortOrder = Enum.SortOrder.LayoutOrder
				Layout.Padding = UDim.new(0, 6)

				Text.Name = "Text"
				Text.Parent = SideBar
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.LayoutOrder = 1
				Text.Size = UDim2.new(1, -18, 0, 12)
				Text.Font = Enum.Font.Montserrat
				Text.Text = name
				Text.TextColor3 = Color3.fromRGB(62, 61, 63)
				Text.TextScaled = true
				Text.TextSize = 14.000
				Text.TextWrapped = true
				Text.TextXAlignment = Enum.TextXAlignment.Left

				if #GUI.Components:GetChildren() == 2 then
					Window.Visible = true 
					Frame.ZIndex = 2
					Text.TextColor3 = Color3.fromRGB(147, 140, 150)
					GUI.Current = name
				end

				Icon.Name = "Icon"
				Icon.Parent = SideBar
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Size = UDim2.new(0, 12, 0, 12)
				Icon.Image = icon
				Icon.ImageColor3 = Color3.fromRGB(147, 140, 150)

				UIAspectRatioConstraint.Parent = Icon

				Layout.Name = "Layout"
				Layout.Parent = SideBar
				Layout.FillDirection = Enum.FillDirection.Horizontal
				Layout.SortOrder = Enum.SortOrder.LayoutOrder
				Layout.Padding = UDim.new(0, 6)

				-- control
				table.insert(signals, SideBar.MouseEnter:Connect(function()
					if name == GUI.Current then return end 
					Text.TextColor3 = Color3.fromRGB(82, 81, 83)
				end))
				
				table.insert(signals, SideBar.MouseLeave:Connect(function()
					if name == GUI.Current then return end 
					Text.TextColor3 = Color3.fromRGB(62, 61, 63)
				end))
				
				table.insert(signals, SideBar.MouseButton1Click:Connect(function()
					ChangeWindow(name)
				end))
			end

			-- functions
			local tab = {}

			function tab:Button(settings)
				settings = settings or {}
				local button = {}

				local text = settings.text or "Button"
				local description = settings.description or "Description"
				local callback = settings.Callback or function() end 

				local TextButton = CopyButton()

				TextButton.Parent = Window
				TextButton.Heading.Text = text 
				TextButton.Description.Text = description

				-- hover
				table.insert(signals, TextButton.MouseEnter:Connect(function()
					TextButton.Border.Color = Color3.fromRGB(116, 118, 118)
				end))

				table.insert(signals, TextButton.MouseLeave:Connect(function()
					TextButton.Border.Color = Color3.fromRGB(29,24,31)
				end))

				-- callback
				table.insert(signals, TextButton.MouseButton1Click:Connect(function()
					callback()
				end))

				-- custom functions
				function button:SetText(text)
					TextButton.Heading.Text = text
				end

				function button:SetDescription(text)
					TextButton.Description.Text = text
				end
			end

			function tab:Toggle(settings)
				settings = settings or {}
				local toggle = {}
				local toggled = settings.default or false 

				local text = settings.text or "Toggle"
				local flag = settings.flag or text 
				local description = settings.description or "Description"
				local callback = settings.Callback or function() end

				local ToggleMain = CopyToggle()

				ToggleMain.Parent = Window
				ToggleMain.Heading.Text = text 
				ToggleMain.Description.Text = description
				
				library.Toggles[flag] = {
					Value = toggled, 
				}
				-- tween 
				local function setTween(bool)
					library.Toggles[flag].Value = bool
					if bool then 
						toggled = true 
						ToggleMain.Toggle.BackgroundColor3 = Color3.fromRGB(106, 106, 119)
						ToggleMain.Toggle.Vector.ImageTransparency = 0
					else 
						toggled = false 
						ToggleMain.Toggle.BackgroundColor3 = Color3.fromRGB(156, 158, 158)
						ToggleMain.Toggle.Vector.ImageTransparency = 1 
					end
				end

				setTween(toggled)

				-- callback
				table.insert(signals, ToggleMain.Toggle.Vector.MouseButton1Click:Connect(function()
					setTween(not toggled)
					callback(toggled)
				end))

				-- custom functions
				function toggle:SetText(text)
					ToggleMain.Heading.Text = text
				end

				function toggle:SetDescription(text)
					ToggleMain.Description.Text = text
				end

				function toggle:SetValue(bool)
					setTween(bool)
                    callback(bool)
				end
				
				library.Toggles[flag].main = toggle 
				
				return toggle
			end

			function tab:Bind(settings)
				settings = settings or {}
				local toggle = {}
				local toggled = settings.default or '...'

				local text = settings.text or "TitleS"
				local flag = settings.flag or text
				local description = settings.description or "Description"
				local callback = settings.Callback  or function() end
				local BindMain = CopyBind()

				BindMain.Parent = Window
				BindMain.Heading.Text = text 
				BindMain.Description.Text = description
				
				library.Options[flag] = {
					Value = toggled, 
					Type = "Bind"
				}
				
				local function SetValue(value)
					library.Options[flag].Value = value
					toggled = value
					BindMain.Text.Text = '<b>' .. value .. '</b>'
					BindMain.Text.Size = UDim2.new(0, BindMain.Text.TextBounds.X + 8, 0, 15) 
					BindMain.Toggle.Size = UDim2.new(0, BindMain.Text.TextBounds.X + 8, 0, 15) 
				end

				SetValue(toggled)
				-- listener 
				local isEditing = false
				local value = toggled 

				table.insert(signals, BindMain.Toggle.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						toggled = nil 
						BindMain.Text.Text = '...'
						BindMain.Text.Size = UDim2.new(0, BindMain.Text.TextBounds.X + 8, 0, 15) 
						BindMain.Toggle.Size = UDim2.new(0, BindMain.Text.TextBounds.X + 8, 0, 15) 
						isEditing = true 
					end
				end))

				table.insert(signals, UserInputService.InputBegan:Connect(function(input, event)
					if not event then 
						if input.UserInputType == Enum.UserInputType.Keyboard then
							if input.KeyCode.Name == toggled or input.KeyCode == toggled then 
								callback()
							end

							if isEditing then
								SetValue(input.KeyCode.Name)
								isEditing = false
							end
						end
					end 
				end))

				-- functions
				function toggle:SetValue(value)
					SetValue(value)
				end

				function toggle:setTitle(title)
					BindMain.Heading.Text = title 
				end

				function toggle:setDescription(description)
					BindMain.Description.Text = description
				end
				
				library.Options[flag].main = toggle

				return toggle
			end

			function tab:Input(settings)
				settings = settings or {}
				local toggle = {}
				local toggled = settings.default or "Enter Text"
				local callback = settings.Callback or function() end 

				local text = settings.text or "Input"
				local flag = settings.flag or text 
				local description = settings.description or "Description"
				local InputMain = CopyInput()

				InputMain.Parent = Window
				InputMain.Content.Heading.Text = text 
				InputMain.Content.Description.Text = description
				
				library.Options[flag] = {
					Value = toggled, 
					Type = "Input"
				}
				
				local function SetValue(value)
					library.Options[flag].Value = value
					InputMain.Textbox.Text.Text = value
				end
				
				SetValue(toggled)
				-- hover 
				table.insert(signals, InputMain.Textbox.MouseEnter:Connect(function()
					InputMain.Textbox.UIStroke.Color = Color3.fromRGB(116, 118, 118)
				end))

				table.insert(signals, InputMain.Textbox.MouseLeave:Connect(function()
					InputMain.Textbox.UIStroke.Color = Color3.fromRGB(28,24,31)
				end))

				-- callback
				table.insert(signals, InputMain.Textbox.Text:GetPropertyChangedSignal("Text"):Connect(function()
					SetValue(InputMain.Textbox.Text.Text)
					callback(InputMain.Textbox.Text.Text)
				end))

				-- functions
				function toggle:SetValue(value)
					return SetValue(value)
				end

				function toggle:setTitle(title)
					InputMain.Content.Heading.Text = title
				end

				function toggle:setDescription(description)
					InputMain.Content.Description.Text = description
				end
				
				library.Options[flag].main = toggle
				return toggle
			end

			function tab:Dropdown(settings)
				settings = settings or {}
				local dropdown = {}
				
				local toggled = settings.value or {}
				local current = {}
				local default = settings.default or nil 
				
				local text = settings.text or "Dropdown"
				local flag = settings.flag or text
				local description = settings.description or "Description"
				local callback = settings.Callback  or function() end
				local changed = function() end 
				local DropdownMain = CopyDropdown()
				local multi = settings.multi or false 
				local allownull = settings.allownull or false 
				
				library.Options[flag] = {
					Value = default, 
					Type = "Dropdown"
				}
				
				DropdownMain.Parent = Window
				DropdownMain.Register.Content.Title.Heading.Text = text 
				DropdownMain.Register.Content.Title.Description.Text = description
	
				local function ClearOptions()
					for i,v in pairs(DropdownMain.Register.Content.Title['Pop-up'].Options:GetChildren()) do 
						v:Remove()
					end
				end

				local function AddOption(title, x)
					local Option1 = Instance.new("TextLabel")
					local Icon = Instance.new("ImageLabel")

					Option1.Name = "Option"
					Option1.Parent = DropdownMain.Register.Content.Title['Pop-up'].Options
					Option1.BackgroundTransparency = 1.000
					Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Option1.BorderSizePixel = 0
					Option1.Position = UDim2.new(0, 12, 0, 12 + (x - 1) * 19)
					Option1.Size = UDim2.new(1, 0, 0, 12)
					Option1.Font = Enum.Font.Montserrat
					Option1.Text = title
					Option1.TextColor3 = Color3.fromRGB(217, 213, 219)
					Option1.TextSize = 10.000
					Option1.TextXAlignment = Enum.TextXAlignment.Left

					Icon.Name = "Icon"
					Icon.Parent = Option1
					Icon.BackgroundTransparency = 1.000
					Icon.Position = UDim2.new(0.62, 0,-0.12, 0)
					Icon.Visible = false
					Icon.Size = UDim2.new(0, 15, 0, 15)
					Icon.ZIndex = 2
					Icon.Image = "rbxassetid://3926305904"
					Icon.ImageColor3 = Color3.fromRGB(125, 125, 125)
					Icon.ImageRectOffset = Vector2.new(312, 4)
					Icon.ImageRectSize = Vector2.new(24, 24)

					return Option1, Icon
				end

				local function AddOptions(table)
					current = table
					ClearOptions()

					if #table == 0 then return AddOption("No current option", 1) end 

					for x = 1, #table do 
						local Option1, Icon = AddOption(table[x], x)
						
						if table[x] == default then 
							current[default] = true
							Icon.Visible = true 
						else 
							current[table[x]] = false 
						end

						Option1.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if multi then
									current[table[x]] = not current[table[x]]

									Icon.Visible = current[table[x]]
									library.Options[flag].Value = current
									changed()
									callback(current)
								else 
									if current[table[x]] == true then 
										if not allownull then return end
									end

									for i,v in pairs(DropdownMain.Register.Content.Title['Pop-up'].Options:GetChildren()) do
										if v == Option1 then continue end 
										current[v.Text] = false 
										v.Icon.Visible = false 
									end

									current[table[x]] = not current[table[x]]
									Icon.Visible = current[table[x]] 

									library.Options[flag].Value = current[table[x]] and string.gsub(Option1.Text, " ", "_") or nil 
									changed()
									callback(string.gsub(Option1.Text, " ", "_"))
								end
							end
						end)
					end
				end

				local function ToggleDropdown()
					local Rotation = DropdownMain.Register.Content.Title.expand_less.Rotation
					Tween(DropdownMain.Register.Content.Title.expand_less, { Rotation = Rotation == 180 and 0 or 180 })

					if DropdownMain.Register.Content.Title.expand_less.Rotation == 0 then -- open the menu
						DropdownMain.Register.Content.Title['Pop-up'].Visible = true 
						DropdownMain.Register.Content.Title['Pop-up'].Size = UDim2.new(0, 100, 0, ((#DropdownMain.Register.Content.Title['Pop-up'].Options:GetChildren() * 19)) + 15)
						Tween(DropdownMain, {Size = UDim2.new(0, 460, 0, 60 + DropdownMain.Register.Content.Title['Pop-up'].Size.Y.Offset) })
					else -- close the menu
						Tween(DropdownMain, { Size = UDim2.new(0,460,0,57)})
						Tween(DropdownMain.Register.Content.Title['Pop-up'], { Size = UDim2.new(0, 0, 0, 0) })
						DropdownMain.Register.Content.Title['Pop-up'].Visible = false 
					end
				end

				ToggleDropdown()
				AddOptions(toggled)

				-- event
				table.insert(signals, DropdownMain.Register.Content.Title.expand_less.MouseButton1Click:Connect(function()
					ToggleDropdown()
				end))

				-- functions
				function dropdown:Changed(callback)
					changed = callback 
				end

				function dropdown:SetOptions(table)
					AddOptions(table)
				end
				
				function dropdown:SetValue(values)
					if typeof(values) == 'table' and typeof(current) == 'table' then 
						for i,v in pairs(DropdownMain.Register.Content.Title['Pop-up'].Options:GetChildren()) do
							if table.find(values, v.Name) then 
								v.Icon.Visible = true 
								current[v.Text] = true  
								library.Options[flag].Value = current
								callback(current)
							else 
								v.Icon.Visible = true 
								current[v.Text] = true  
							end
						end
					elseif typeof(values) == 'string' and typeof(current) == 'table' then 
						for i,v in pairs(DropdownMain.Register.Content.Title['Pop-up'].Options:GetChildren()) do
							if v.Text == values then  
								current[v.Text] = true 
								v.Icon.Visible = true 
								library.Options[flag].Value = values
								callback(values)
							else 
								current[v.Text] = false 
								v.Icon.Visible = false 
							end 
						end
					end
				end
				
				library.Options[flag].main = dropdown
				
				return dropdown
			end

			function tab:Divider()
				local divider = CopyDivider()

				divider.Parent = Window
			end
			
			function tab:Text(text, f)
				local functions = {}
				local texts = CopyText(text)
				local flag = f or text 

				texts.Parent = Window 

				function functions:SetText(text)
					texts.Text.Text = tostring(text)
				end

				library.Labels[flag] = {
					Func = functions
				}

				return functions
			end
			
			function tab:Label(text)
				local Label = CopyLabel(text)

				local Functions = {}
				
				Label.Parent = Window

				function Functions:SetText(text)
					Label.TextLabel.Text = text
				end

				return Functions
			end
			
			function tab:Colorpicker(settings)
				settings = settings or {}
				local toggle = {}
				local toggled = settings.default or false 

				local text = settings.text or "Color Picker"
				local flag = settings.flag or text
				local description = settings.description or "Description"
				local callback = settings.Callback or function() end

				local ColorPicker = CopyColor()

				ColorPicker.Parent = Window
				ColorPicker.Content.Title.Heading.Text = text 
				ColorPicker.Content.Title.Description.Text = description

				library.Toggles[text] = {
					Value = toggled, 
				}
				
				return ColorPicker
			end
			
			function tab:Slider(settings) 
				settings = settings or {}

				local text = settings.text or "Slider"
				local flag = settings.flag or text
				local description = settings.description or "Description"
				local callback = settings.Callback or function() end

				local Min = settings.min or 1 
				local Max = settings.max or 100
				local Default = settings.default or 1

				local Value = 1 
				
				local functions = {} 
				local slider = CopySlider() 
				
				slider.Parent = Window 
				
				if Min > Max then 
					Min = Max 
				end
				
				if Default > Max then 
					Default = Max 
				end
				
				if Default < Min then 
					Default = Min
				end
				
				slider.Content.Title.Heading.Text = text 
				slider.Content.Title.Description.Text = description 
				
				library.Options[flag] = {
					Value = Default, 
					Type = "Slider"
				}
				
				slider.Content.Title.Maximum.Text = tostring(Max)
				slider.Content.Title.Current.Text = tostring(math.round(Value))
				
				local function valueToPercent(value)
					return math.round((value / Max) * 100)
				end
				
				local function setValue(percent)
					slider.Content.Title.Current.Text = tostring(math.round((percent / 100) * Max))
					slider['Frame 1']['Frame 2'].Size = UDim2.new((percent / 100), 0, 0, 8)
					library.Options[flag].Value = math.round((percent / 100) * Max)
					callback(math.round((percent / 100) * Max))
				end
				
				slider['Frame 1'].InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						while wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local sliderPos = slider['Frame 1']['Frame 2'].AbsolutePosition.X

							local leftBoundary = slider['Frame 1'].AbsolutePosition.X - (slider['Frame 1'].AbsoluteSize.X)
							local rightBoundary = slider['Frame 1'].AbsolutePosition.X + (slider['Frame 1'].AbsoluteSize.X)

							local maxPos = math.clamp((Mouse.X - sliderPos) / (rightBoundary - sliderPos), 0, Min)

							local val = (((Max - Min) * maxPos) / ((Max - Min) / (99))) + Min

							Value = val 
							setValue(val)
						end
					end
				end)
				
				setValue(valueToPercent(Default))
				
				function functions:SetValue(value)
					setValue(valueToPercent(value))
				end
				
				function functions:SetText(text)
					slider.Content.Title.Heading.Text = text
				end
				
				function functions:SetDescription(text)
					slider.Content.Title.Description.Text = text
				end
				
				library.Options[flag].main = functions
				return functions
			end
			
			return tab
		end

        function GUI:Notification(settings) 
            settings = settings or {} 

            local title = tostring(settings.title) or "Notification" 
            local description = tostring(settings.description) or "Description"
            local duration = settings.duration or 5 

            local notification = NewNotification(title,description,duration)
        end

		function GUI:ToggleMenu()
			if GUI.ScreenGui.Application.ClipsDescendants == false then
				GUI.ScreenGui.Application.ClipsDescendants = true 
				for i,v in pairs(GUI.ScreenGui:GetDescendants()) do 
					if v:IsA("TextLabel") or v:IsA("TextBox") then 
						if v.TextTransparency == 1 then continue end 
						Tween(v, { TextTransparency = 0.99 })
					end

					if v:IsA("ImageLabel") or v:IsA("ImageButton") then 
						if v.ImageTransparency == 1 then continue end 
						Tween(v, { ImageTransparency = 0.99 })
					end
					
					if v:IsA("GuiObject") or v:IsA('UIStroke') or v:IsA("TextButton") then 
						if v.Transparency == 1 then continue end 
						Tween(v, { Transparency = 0.99 })
					end 
				end
			else
				GUI.ScreenGui.Application.ClipsDescendants = false 
				for i,v in pairs(GUI.ScreenGui:GetDescendants()) do 
					if v:IsA("TextLabel") or v:IsA("TextBox") then 
						if v.TextTransparency == 1 then continue end 
						Tween(v, { TextTransparency = 0 })
					end

					if v:IsA("ImageLabel") or v:IsA("ImageButton") then 
						if v.ImageTransparency == 1 then continue end 
						Tween(v, { ImageTransparency = 0 })
					end

					if v:IsA("GuiObject") or v:IsA('UIStroke') or v:IsA("TextButton") then 
						if v.Transparency == 1 then continue end 
						Tween(v, { Transparency = 0 })
					end 
				end
			end
		end
		
		function GUI:Unload()
			for i,v in pairs(signals) do 
				v:Disconnect()
			end
			GUI.Moonlight:Remove()
		end
		
		function GUI:SetupSettings()
			if not isfolder('Moonlight') then 
				makefolder('Moonlight')
			end

			if not isfolder('Moonlight/Configs') then 
				makefolder('Moonlight/Configs')
			end

			local function getConfig()
				local config = { Toggles = {}, Options = {} }
				
				for i,v in pairs(library.Toggles) do 
					table.insert(config.Toggles, { index = i, value = v.Value })
				end
				
				for i,v in pairs(library.Options) do 
					table.insert(config.Options, { index = i, value = v.Value })
				end
				
				return HttpService:JSONEncode(config)
			end

			local function loadSettings(table)
				table = HttpService:JSONDecode(table)

				for _, value in pairs(table.Toggles) do 
					if library.Toggles[value.index] then -- might update
						library.Toggles[value.index].main:SetValue(value.value)
					end
				end
				
				for _, value in pairs(table.Options) do 
					if library.Options[value.index] then -- might update
						library.Options[value.index].main:SetValue(value.value)
					end
				end
			end

			local function getConfigs()
				local configs = {}

				for i,v in pairs(listfiles("Moonlight/Configs")) do 
                    if string.match(v, "AutoLoad") then continue end 
					if string.sub(v,#v-4,#v) == ".json" then 
						local lastPart = string.split(v, [[\]])[#string.split(v,[[\]])]
						table.insert(configs, lastPart)
					end 
				end    

				return configs
			end
			
            if isfile('Moonlight/Configs/AutoLoad.json') then 
                local fileName = readfile('Moonlight/Configs/AutoLoad.json')
                if isfile('Moonlight/Configs/' .. fileName) then 
                    GUI:Notification({title = "Moonlight Hub", description = "Successfully auto loaded config " .. fileName, duration = 5})
                    loadSettings(readfile('Moonlight/Configs/' .. fileName))
                end
            end

			local settingsTab = GUI:Window("Settings", 'rbxassetid://11641098293')

            settingsTab:Label("Misc Settings")

            local seconds = 0 
            local lab = settingsTab:Text("Elapsed Time: nil")

            local function formatTime(Seconds)
                local Minutes = (Seconds - Seconds % 60) / 60
                Seconds = Seconds - Minutes * 60
                local Hours = (Minutes - Minutes % 60) / 60
                Minutes = Minutes - Hours * 60
                return Hours, Minutes, Seconds
            end

            task.spawn(function()
                while task.wait(1) do 
                    seconds += 1 
                    local h,ms = formatTime(seconds)
                    lab:SetText("Elapsed Time: " .. h .. "h " .. ms .. "m " .. seconds .. "s")
                end
            end)

			settingsTab:Bind({ text = "Toggle Menu", flag = "Menu Bind", description = "Hides and re-enables the gui", default = "Insert", Callback = function() GUI:ToggleMenu() end })
			settingsTab:Button({ text = "Unload Menu", description = "Fully unload moonlight", Callback = function() GUI:Unload() end})
			
			
			settingsTab:Label("Config Loader")

			local configSelector = settingsTab:Dropdown({ text = "Config Selector", flag = "Config Selector", description = "Select the config you want to load", multi = false })
			
			settingsTab:Button({ text = "Load Config", description = "Load the selected config", Callback = function() 
				if not isfile('Moonlight/Configs/' .. library.Options['Config Selector'].Value) then
                    return GUI:Notification({title = "Moonlight Hub", description = library.Options['Config Selector'].Value or "Config" .. "Not Found!", duration = 5})
				end

				local config = readfile('Moonlight/Configs/' .. library.Options['Config Selector'].Value)
				loadSettings(config)
                return GUI:Notification({title = "Moonlight Hub", description = "Successfully loaded config " .. library.Options['Config Selector'].Value, duration = 5})
			end})

            settingsTab:Button({ text = "Auto Load Config", description = "Auto loads selected config upon execution", Callback = function() 
                
                if isfile('Moonlight/Configs/AutoLoad.json', library.Options['Config Selector'].Value) then 
                    local content = readfile('Moonlight/Configs/AutoLoad.json')

                    if content == library.Options['Config Selector'].Value then 
                        GUI:Notification({title = "Moonlight Hub", description = "Successfully disabled auto load for config " .. library.Options['Config Selector'].Value, duration = 5})
                        delfile('Moonlight/Configs/AutoLoad.json')
                    else 
                        GUI:Notification({title = "Moonlight Hub", description = "Successfully enabled auto load for config " .. library.Options['Config Selector'].Value, duration = 5})
                        writefile('Moonlight/Configs/AutoLoad.json', library.Options['Config Selector'].Value)
                    end
                else 
                    GUI:Notification({title = "Moonlight Hub", description = "Successfully enabled auto load for config " .. library.Options['Config Selector'].Value, duration = 5})
                    writefile('Moonlight/Configs/AutoLoad.json', library.Options['Config Selector'].Value)
                end
			end})


			local refreshConfigList = function()
				local configs = getConfigs() 
				configSelector:SetOptions(configs)
			end
			refreshConfigList()

			settingsTab:Button({ text = "Overide Config", description = "Update the config to be your current settings", Callback = function()
				if not isfile('Moonlight/Configs/' .. library.Options['Config Selector'].Value) then
					return GUI:Notification({title = "Moonlight Hub", description = library.Options['Config Selector'].Value or "Config" .. "Not Found!", duration = 5})
				end

                GUI:Notification({title = "Moonlight Hub", description = "Successfully overided config " .. library.Options['Config Selector'].Value, duration = 5})
				writefile('Moonlight/Configs/' .. library.Options['Config Selector'].Value, getConfig())
				refreshConfigList()
			end})

			settingsTab:Button({ text = "Delete Config", description = "Deletes the selected config", Callback = function() 
				if not isfile('Moonlight/Configs/' .. library.Options['Config Selector'].Value) then
					return GUI:Notification({title = "Moonlight Hub", description = library.Options['Config Selector'].Value or "Config".. "Not Found!", duration = 5})
				end

                GUI:Notification({title = "Moonlight Hub", description = "Successfully deleted config " .. library.Options['Config Selector'].Value, duration = 5})
				delfile('Moonlight/Configs/' .. library.Options['Config Selector'].Value)
				refreshConfigList()
			end})

            settingsTab:Button({ text = "Refresh List", description = "Refreshes the list of configs", Callback = refreshConfigList })

			settingsTab:Label("Config Creator")

			settingsTab:Input({ text = "Config Name", flag = "Config Name", description = "New config manager"})
			settingsTab:Button({ text = "Create Config", Callback = function()
				if isfile('Moonlight/Configs/' .. library.Options['Config Name'].Value .. '.json') then
					return GUI:Notification({title = "Moonlight Hub", description = library.Options['Config Name'].Value .. '.json already exists', duration = 5})
				end

                GUI:Notification({title = "Moonlight Hub", description = "Successfully created config " .. library.Options['Config Name'].Value, duration = 5})
				writefile('Moonlight/Configs/' .. library.Options['Config Name'].Value .. '.json', getConfig())
				refreshConfigList()
			end})
		end
		
        function GUI:PlayerArray()
            local plrs = {}
            for i,v in pairs(Players:GetPlayers()) do table.insert(plrs, v.Name) end
            return plrs
        end

        function GUI:ConnectDropdownToPlayer(dropdown)
            Players.PlayerAdded:Connect(function() dropdown:SetOptions(PlayerArray()) end)
            Players.PlayerRemoving:Connect(function() dropdown:SetOptions(PlayerArray()) end)
        end

		return GUI
	end

	return library
