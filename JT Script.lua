--========================================================
--                    JT SCRIPTS
--                 RED / BLACK EDITION
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

--========================================================
-- CONFIG
--========================================================

local Config = {
	Name = "JT",
	SubName = "scripts",

	-- Logo
	Logo = "rbxassetid://83942134863098",

	AccentColor = Color3.fromRGB(255, 25, 35),
	AccentLight = Color3.fromRGB(255, 70, 80),

	BackgroundColor = Color3.fromRGB(8, 8, 12),
	SecondaryColor = Color3.fromRGB(18, 18, 25),
	CardColor = Color3.fromRGB(22, 22, 31),

	TextColor = Color3.fromRGB(255, 255, 255),
	SubTextColor = Color3.fromRGB(160, 160, 175),

	ButtonColor = Color3.fromRGB(225, 20, 32),
	ButtonHover = Color3.fromRGB(255, 40, 50),

	CloseColor = Color3.fromRGB(220, 35, 45),
	MinimizeColor = Color3.fromRGB(255, 145, 20),

	CornerRadius = UDim.new(0, 8)
}

--========================================================
-- LIMPIAR VERSIONES ANTERIORES
--========================================================

pcall(function()
	local old = CoreGui:FindFirstChild("JT_SCRIPTS")
	if old then
		old:Destroy()
	end

	local oldSplash = CoreGui:FindFirstChild("JT_SPLASH")
	if oldSplash then
		oldSplash:Destroy()
	end
end)

--========================================================
-- BLUR
--========================================================

local Blur = Instance.new("BlurEffect")
Blur.Name = "JT_Blur"
Blur.Size = 0
Blur.Parent = Lighting

TweenService:Create(
	Blur,
	TweenInfo.new(0.4),
	{Size = 12}
):Play()

--========================================================
-- SPLASH SCREEN
--========================================================

local SplashGui = Instance.new("ScreenGui")
SplashGui.Name = "JT_SPLASH"
SplashGui.IgnoreGuiInset = true
SplashGui.ResetOnSpawn = false
SplashGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SplashGui.Parent = CoreGui

local SplashBackground = Instance.new("Frame")
SplashBackground.Size = UDim2.fromScale(1, 1)
SplashBackground.BackgroundColor3 = Config.BackgroundColor
SplashBackground.BorderSizePixel = 0
SplashBackground.Parent = SplashGui

--========================================================
-- FONDO ROJO
--========================================================

local RedGlow = Instance.new("Frame")
RedGlow.Size = UDim2.new(0, 500, 0, 500)
RedGlow.Position = UDim2.new(0.5, -250, 0.5, -250)
RedGlow.BackgroundColor3 = Config.AccentColor
RedGlow.BackgroundTransparency = 0.92
RedGlow.BorderSizePixel = 0
RedGlow.Parent = SplashBackground

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(1, 0)
GlowCorner.Parent = RedGlow

--========================================================
-- LINEA SUPERIOR
--========================================================

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 3)
TopLine.BackgroundColor3 = Config.AccentColor
TopLine.BorderSizePixel = 0
TopLine.Parent = SplashBackground

--========================================================
-- LOGO
--========================================================

local SplashLogo = Instance.new("ImageLabel")
SplashLogo.Size = UDim2.new(0, 180, 0, 180)
SplashLogo.Position = UDim2.new(0.5, -90, 0.5, -125)
SplashLogo.BackgroundTransparency = 1
SplashLogo.Image = Config.Logo
SplashLogo.ScaleType = Enum.ScaleType.Fit
SplashLogo.Parent = SplashBackground

local LogoAspect = Instance.new("UIAspectRatioConstraint")
LogoAspect.AspectRatio = 1
LogoAspect.Parent = SplashLogo

--========================================================
-- ANIMACION DEL LOGO
--========================================================

task.spawn(function()
	while SplashLogo.Parent do

		TweenService:Create(
			SplashLogo,
			TweenInfo.new(
				1.1,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				Size = UDim2.new(0, 195, 0, 195),
				Position = UDim2.new(0.5, -97.5, 0.5, -132.5)
			}
		):Play()

		task.wait(1.1)

		TweenService:Create(
			SplashLogo,
			TweenInfo.new(
				1.1,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut
			),
			{
				Size = UDim2.new(0, 180, 0, 180),
				Position = UDim2.new(0.5, -90, 0.5, -125)
			}
		):Play()

		task.wait(1.1)
	end
end)

--========================================================
-- SUBTITULO
--========================================================

local SplashSub = Instance.new("TextLabel")
SplashSub.Size = UDim2.new(0, 300, 0, 30)
SplashSub.Position = UDim2.new(0.5, -150, 0.5, 55)
SplashSub.BackgroundTransparency = 1
SplashSub.Text = Config.SubName
SplashSub.TextColor3 = Config.SubTextColor
SplashSub.TextSize = 15
SplashSub.Font = Enum.Font.GothamMedium
SplashSub.TextTransparency = 0.1
SplashSub.Parent = SplashBackground

--========================================================
-- LOADING TEXT
--========================================================

local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(0, 300, 0, 25)
LoadingText.Position = UDim2.new(0.5, -150, 0.5, 90)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Cargando..."
LoadingText.TextColor3 = Config.SubTextColor
LoadingText.TextSize = 12
LoadingText.Font = Enum.Font.Gotham
LoadingText.Parent = SplashBackground

--========================================================
-- LOADING BAR BACKGROUND
--========================================================

local BarBack = Instance.new("Frame")
BarBack.Size = UDim2.new(0, 300, 0, 7)
BarBack.Position = UDim2.new(0.5, -150, 0.5, 125)
BarBack.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
BarBack.BorderSizePixel = 0
BarBack.ClipsDescendants = true
BarBack.Parent = SplashBackground

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = BarBack

--========================================================
-- LOADING BAR
--========================================================

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 1, 0)
Bar.BackgroundColor3 = Config.AccentColor
Bar.BorderSizePixel = 0
Bar.Parent = BarBack

local BarCorner2 = Instance.new("UICorner")
BarCorner2.CornerRadius = UDim.new(1, 0)
BarCorner2.Parent = Bar

--========================================================
-- SHIMMER
--========================================================

local Shimmer = Instance.new("Frame")
Shimmer.Size = UDim2.new(0, 80, 1, 0)
Shimmer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shimmer.BackgroundTransparency = 0.7
Shimmer.BorderSizePixel = 0
Shimmer.Parent = Bar

task.spawn(function()
	while Bar.Parent do
		Shimmer.Position = UDim2.new(0, -80, 0, 0)

		TweenService:Create(
			Shimmer,
			TweenInfo.new(
				0.8,
				Enum.EasingStyle.Linear
			),
			{
				Position = UDim2.new(1, 0, 0, 0)
			}
		):Play()

		task.wait(1)
	end
end)

--========================================================
-- PORCENTAJE
--========================================================

local Percentage = Instance.new("TextLabel")
Percentage.Size = UDim2.new(0, 100, 0, 25)
Percentage.Position = UDim2.new(0.5, -50, 0.5, 142)
Percentage.BackgroundTransparency = 1
Percentage.Text = "0%"
Percentage.TextColor3 = Config.TextColor
Percentage.TextSize = 12
Percentage.Font = Enum.Font.GothamBold
Percentage.Parent = SplashBackground

--========================================================
-- SKIP
--========================================================

local SkipBtn = Instance.new("TextButton")
SkipBtn.Size = UDim2.new(0, 80, 0, 30)
SkipBtn.Position = UDim2.new(1, -100, 1, -50)
SkipBtn.BackgroundTransparency = 1
SkipBtn.Text = "SKIP"
SkipBtn.TextColor3 = Config.SubTextColor
SkipBtn.TextSize = 11
SkipBtn.Font = Enum.Font.GothamBold
SkipBtn.AutoButtonColor = false
SkipBtn.Parent = SplashBackground

SkipBtn.MouseEnter:Connect(function()
	TweenService:Create(
		SkipBtn,
		TweenInfo.new(0.15),
		{TextColor3 = Config.AccentLight}
	):Play()
end)

SkipBtn.MouseLeave:Connect(function()
	TweenService:Create(
		SkipBtn,
		TweenInfo.new(0.15),
		{TextColor3 = Config.SubTextColor}
	):Play()
end)

--========================================================
-- MAIN GUI
--========================================================

local GZSSFMenu = Instance.new("ScreenGui")
GZSSFMenu.Name = "JT_SCRIPTS"
GZSSFMenu.IgnoreGuiInset = true
GZSSFMenu.ResetOnSpawn = false
GZSSFMenu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GZSSFMenu.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 330)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -165)
MainFrame.BackgroundColor3 = Config.BackgroundColor
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = GZSSFMenu

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = Config.CornerRadius
MainCorner.Parent = MainFrame

--========================================================
-- TOP BAR
--========================================================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Config.SecondaryColor
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopLine2 = Instance.new("Frame")
TopLine2.Size = UDim2.new(1, 0, 0, 2)
TopLine2.BackgroundColor3 = Config.AccentColor
TopLine2.BorderSizePixel = 0
TopLine2.Parent = TopBar

--========================================================
-- TOP LOGO
--========================================================

local TopLogo = Instance.new("ImageLabel")
TopLogo.Size = UDim2.new(0, 38, 0, 38)
TopLogo.Position = UDim2.new(0, 10, 0, 6)
TopLogo.BackgroundTransparency = 1
TopLogo.Image = Config.Logo
TopLogo.ScaleType = Enum.ScaleType.Fit
TopLogo.Parent = TopBar

local TopLogoAspect = Instance.new("UIAspectRatioConstraint")
TopLogoAspect.AspectRatio = 1
TopLogoAspect.Parent = TopLogo

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0, 100, 0, 25)
TitleText.Position = UDim2.new(0, 55, 0, 7)
TitleText.BackgroundTransparency = 1
TitleText.Text = Config.Name
TitleText.TextColor3 = Config.TextColor
TitleText.TextSize = 16
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TopBar

local SubTitleText = Instance.new("TextLabel")
SubTitleText.Size = UDim2.new(0, 100, 0, 18)
SubTitleText.Position = UDim2.new(0, 55, 0, 27)
SubTitleText.BackgroundTransparency = 1
SubTitleText.Text = Config.SubName
SubTitleText.TextColor3 = Config.SubTextColor
SubTitleText.TextSize = 10
SubTitleText.Font = Enum.Font.Gotham
SubTitleText.TextXAlignment = Enum.TextXAlignment.Left
SubTitleText.Parent = TopBar

--========================================================
-- MINIMIZE
--========================================================

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 34, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 10)
MinimizeBtn.BackgroundColor3 = Config.MinimizeColor
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

--========================================================
-- CLOSE
--========================================================

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 34, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0, 10)
CloseBtn.BackgroundColor3 = Config.CloseColor
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

--========================================================
-- CONTENT
--========================================================

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -65)
ContentFrame.Position = UDim2.new(0, 10, 0, 58)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

--========================================================
-- SIDEBAR
--========================================================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 110, 1, 0)
Sidebar.BackgroundColor3 = Config.SecondaryColor
Sidebar.BorderSizePixel = 0
Sidebar.Parent = ContentFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 7)
SidebarCorner.Parent = Sidebar

--========================================================
-- TAB CONTENT
--========================================================

local TabContent = Instance.new("Frame")
TabContent.Size = UDim2.new(1, -120, 1, 0)
TabContent.Position = UDim2.new(0, 120, 0, 0)
TabContent.BackgroundTransparency = 1
TabContent.Parent = ContentFrame

--========================================================
-- SIDEBAR BUTTON
--========================================================

local function CreateSidebarButton(text, position)

	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, -10, 0, 40)
	Button.Position = position
	Button.BackgroundColor3 = Config.SecondaryColor
	Button.Text = text
	Button.TextColor3 = Config.SubTextColor
	Button.TextSize = 12
	Button.Font = Enum.Font.GothamBold
	Button.AutoButtonColor = false
	Button.Parent = Sidebar

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
	Corner.Parent = Button

	return Button
end

local ScriptBtn = CreateSidebarButton(
	"Scripts",
	UDim2.new(0, 5, 0, 10)
)

--========================================================
-- TAB
--========================================================

local function CreateTab()

	local Tab = Instance.new("ScrollingFrame")
	Tab.Size = UDim2.fromScale(1, 1)
	Tab.BackgroundTransparency = 1
	Tab.BorderSizePixel = 0
	Tab.ScrollBarThickness = 3
	Tab.ScrollBarImageColor3 = Config.AccentColor
	Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
	Tab.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Tab.Visible = false
	Tab.Parent = TabContent

	local Padding = Instance.new("UIPadding")
	Padding.PaddingTop = UDim.new(0, 5)
	Padding.PaddingBottom = UDim.new(0, 5)
	Padding.PaddingLeft = UDim.new(0, 5)
	Padding.PaddingRight = UDim.new(0, 5)
	Padding.Parent = Tab

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0, 8)
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.Parent = Tab

	return Tab
end

local ScriptTab = CreateTab()

local function SwitchTab(tabName)

	ScriptTab.Visible = false

	if tabName == "Scripts" then
		ScriptTab.Visible = true

		ScriptBtn.BackgroundColor3 = Config.ButtonColor
		ScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end

--========================================================
-- ACTION BUTTON
--========================================================

local function CreateActionButton(parent, text, description, callback)

	local Container = Instance.new("Frame")
	Container.Size = UDim2.new(1, -5, 0, 65)
	Container.BackgroundColor3 = Config.CardColor
	Container.BorderSizePixel = 0
	Container.Parent = parent

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 7)
	Corner.Parent = Container

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -120, 0, 25)
	Title.Position = UDim2.new(0, 15, 0, 8)
	Title.BackgroundTransparency = 1
	Title.Text = text
	Title.TextColor3 = Config.TextColor
	Title.TextSize = 15
	Title.Font = Enum.Font.GothamBold
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Container

	local Desc = Instance.new("TextLabel")
	Desc.Size = UDim2.new(1, -120, 0, 28)
	Desc.Position = UDim2.new(0, 15, 0, 34)
	Desc.BackgroundTransparency = 1
	Desc.Text = description
	Desc.TextColor3 = Config.SubTextColor
	Desc.TextSize = 11
	Desc.Font = Enum.Font.Gotham
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextWrapped = true
	Desc.Parent = Container

	local ActionBtn = Instance.new("TextButton")
	ActionBtn.Size = UDim2.new(0, 90, 0, 34)
	ActionBtn.Position = UDim2.new(1, -105, 0.5, -17)
	ActionBtn.BackgroundColor3 = Config.ButtonColor
	ActionBtn.Text = "Ejecutar"
	ActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ActionBtn.TextSize = 13
	ActionBtn.Font = Enum.Font.GothamBold
	ActionBtn.AutoButtonColor = false
	ActionBtn.Parent = Container

	local ActionCorner = Instance.new("UICorner")
	ActionCorner.CornerRadius = UDim.new(0, 6)
	ActionCorner.Parent = ActionBtn

	ActionBtn.MouseEnter:Connect(function()
		TweenService:Create(
			ActionBtn,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = Config.ButtonHover
			}
		):Play()
	end)

	ActionBtn.MouseLeave:Connect(function()
		TweenService:Create(
			ActionBtn,
			TweenInfo.new(0.15),
			{
				BackgroundColor3 = Config.ButtonColor
			}
		):Play()
	end)

	ActionBtn.Activated:Connect(function()
		pcall(callback)
	end)

	return Container
end

--========================================================
-- TU SCRIPT
--========================================================
-- Cambia solamente el nombre, descripción y contenido
-- de la función para añadir tus propios scripts.
--========================================================

CreateActionButton(
	ScriptTab,

	-- NOMBRE
	"Mi Script",

	-- DESCRIPCION
	"Descripción de mi script aquí.",

	function()

		--================================================
		-- PON AQUÍ EL CÓDIGO DE TU PROPIO SCRIPT
		--================================================

		print("Mi Script fue ejecutado correctamente.")

	end
)

--========================================================
-- EVENTO TAB
--========================================================

ScriptBtn.Activated:Connect(function()
	SwitchTab("Scripts")
end)

SwitchTab("Scripts")

--========================================================
-- CERRAR
--========================================================

local Closed = false

CloseBtn.Activated:Connect(function()

	if Closed then
		return
	end

	Closed = true

	local tween = TweenService:Create(
		MainFrame,
		TweenInfo.new(
			0.3,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.In
		),
		{
			Size = UDim2.new(0, 0, 0, 0)
		}
	)

	tween:Play()

	tween.Completed:Connect(function()

		if GZSSFMenu.Parent then
			GZSSFMenu:Destroy()
		end

		if SplashGui.Parent then
			SplashGui:Destroy()
		end

		if Blur.Parent then
			TweenService:Create(
				Blur,
				TweenInfo.new(0.2),
				{
					Size = 0
				}
			):Play()

			task.delay(0.25, function()
				if Blur then
					Blur:Destroy()
				end
			end)
		end

	end)

end)

--========================================================
-- CIRCULO FLOTANTE
--========================================================

local FloatingButton = Instance.new("ImageButton")
FloatingButton.Name = "JT_Floating"
FloatingButton.Size = UDim2.new(0, 65, 0, 65)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -32)
FloatingButton.BackgroundColor3 = Config.BackgroundColor
FloatingButton.BorderSizePixel = 0
FloatingButton.Image = Config.Logo
FloatingButton.ScaleType = Enum.ScaleType.Fit
FloatingButton.Visible = false
FloatingButton.Parent = GZSSFMenu

local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(1, 0)
FloatingCorner.Parent = FloatingButton

local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Color = Config.AccentColor
FloatingStroke.Thickness = 2
FloatingStroke.Parent = FloatingButton

local FloatingAspect = Instance.new("UIAspectRatioConstraint")
FloatingAspect.AspectRatio = 1
FloatingAspect.Parent = FloatingButton

--========================================================
-- MINIMIZAR
--========================================================

local Minimized = false
local NormalSize = MainFrame.Size
local NormalPosition = MainFrame.Position

MinimizeBtn.Activated:Connect(function()

	if Closed then
		return
	end

	if not Minimized then

		NormalPosition = MainFrame.Position

		TweenService:Create(
			MainFrame,
			TweenInfo.new(
				0.3,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.new(0, 0, 0, 0)
			}
		):Play()

		task.delay(0.3, function()

			if Closed then
				return
			end

			MainFrame.Visible = false
			FloatingButton.Visible = true

			FloatingButton.Position = UDim2.new(
				NormalPosition.X.Scale,
				NormalPosition.X.Offset,
				NormalPosition.Y.Scale,
				NormalPosition.Y.Offset
			)

			FloatingButton.Size = UDim2.new(0, 0, 0, 0)

			TweenService:Create(
				FloatingButton,
				TweenInfo.new(
					0.3,
					Enum.EasingStyle.Back,
					Enum.EasingDirection.Out
				),
				{
					Size = UDim2.new(0, 65, 0, 65)
				}
			):Play()

		end)

	else

		FloatingButton.Visible = false
		MainFrame.Visible = true

		MainFrame.Size = UDim2.new(0, 0, 0, 0)
		MainFrame.Position = NormalPosition

		TweenService:Create(
			MainFrame,
			TweenInfo.new(
				0.4,
				Enum.EasingStyle.Back,
				Enum.EasingDirection.Out
			),
			{
				Size = NormalSize
			}
		):Play()

	end

	Minimized = not Minimized

end)

--========================================================
-- DRAG MAIN GUI
--========================================================

local Dragging = false
local DragStart
local StartPos

TopBar.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = input.Position
		StartPos = MainFrame.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end

		end)

	end

end)

UserInputService.InputChanged:Connect(function(input)

	if not Dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - DragStart

		MainFrame.Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + delta.Y
		)

	end

end)

--========================================================
-- DRAG CIRCULO FLOTANTE
--========================================================

local FloatingDragging = false
local FloatingDragStart
local FloatingStartPos
local FloatingMoved = false

FloatingButton.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		FloatingDragging = true
		FloatingMoved = false
		FloatingDragStart = input.Position
		FloatingStartPos = FloatingButton.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				FloatingDragging = false
			end

		end)

	end

end)

UserInputService.InputChanged:Connect(function(input)

	if not FloatingDragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - FloatingDragStart

		if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
			FloatingMoved = true
		end

		FloatingButton.Position = UDim2.new(
			FloatingStartPos.X.Scale,
			FloatingStartPos.X.Offset + delta.X,
			FloatingStartPos.Y.Scale,
			FloatingStartPos.Y.Offset + delta.Y
		)

	end

end)

--========================================================
-- ABRIR DESDE EL CIRCULO
--========================================================

FloatingButton.Activated:Connect(function()

	if FloatingMoved then
		FloatingMoved = false
		return
	end

	if Closed then
		return
	end

	Minimized = false
	FloatingButton.Visible = false

	MainFrame.Visible = true
	MainFrame.Position = UDim2.new(
		0.5,
		-250,
		0.5,
		-165
	)

	MainFrame.Size = UDim2.new(0, 0, 0, 0)

	TweenService:Create(
		MainFrame,
		TweenInfo.new(
			0.4,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			Size = NormalSize
		}
	):Play()

end)

--========================================================
-- ANIMACION DE ENTRADA
--========================================================

local FinalSize = MainFrame.Size
local FinalPosition = MainFrame.Position

MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(
	MainFrame,
	TweenInfo.new(
		0.5,
		Enum.EasingStyle.Back,
		Enum.EasingDirection.Out
	),
	{
		Size = FinalSize,
		Position = FinalPosition
	}
):Play()

--========================================================
-- CARGA
--========================================================

local LoadingFinished = false

local function CloseSplash()

	if LoadingFinished then
		return
	end

	LoadingFinished = true

	TweenService:Create(
		SplashBackground,
		TweenInfo.new(0.35),
		{
			BackgroundTransparency = 1
		}
	):Play()

	for _, object in ipairs(SplashBackground:GetDescendants()) do

		if object:IsA("TextLabel")
			or object:IsA("TextButton") then

			TweenService:Create(
				object,
				TweenInfo.new(0.25),
				{
					TextTransparency = 1
				}
			):Play()

		elseif object:IsA("ImageLabel") then

			TweenService:Create(
				object,
				TweenInfo.new(0.25),
				{
					ImageTransparency = 1
				}
			):Play()

		end

	end

	task.wait(0.4)

	if SplashGui.Parent then
		SplashGui:Destroy()
	end

	TweenService:Create(
		Blur,
		TweenInfo.new(0.4),
		{
			Size = 0
		}
	):Play()

	task.delay(0.45, function()

		if Blur and Blur.Parent then
			Blur:Destroy()
		end

	end)

end

--========================================================
-- SKIP
--========================================================

SkipBtn.Activated:Connect(function()
	CloseSplash()
end)

--========================================================
-- PROGRESO
--========================================================

task.spawn(function()

	for i = 0, 100 do

		if LoadingFinished then
			break
		end

		Percentage.Text = tostring(i) .. "%"

		TweenService:Create(
			Bar,
			TweenInfo.new(0.04),
			{
				Size = UDim2.new(i / 100, 0, 1, 0)
			}
		):Play()

		if i < 30 then
			LoadingText.Text = "Iniciando JT..."
		elseif i < 60 then
			LoadingText.Text = "Cargando interfaz..."
		elseif i < 85 then
			LoadingText.Text = "Preparando scripts..."
		else
			LoadingText.Text = "Listo!"
		end

		task.wait(0.035)

	end

	task.wait(0.3)

	CloseSplash()

end)

print("JT Scripts cargado correctamente.")
