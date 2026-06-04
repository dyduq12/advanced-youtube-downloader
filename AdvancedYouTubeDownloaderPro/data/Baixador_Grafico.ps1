# =====================================================================
# CRASH GUARD: Log de erros fatais para arquivo (nunca mais fechar mudo)
# =====================================================================
trap {
    $logDir  = "$env:APPDATA\BaixadorYTDLP"
    $logFile = "$logDir\crash.log"
    if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $msg = "[$timestamp] FATAL: $($_.Exception.Message)`r`nLINE: $($_.InvocationInfo.ScriptLineNumber)`r`nSTACK: $($_.ScriptStackTrace)`r`n---`r`n"
    [System.IO.File]::AppendAllText($logFile, $msg, [System.Text.Encoding]::UTF8)
    [System.Windows.Forms.MessageBox]::Show(
        "A fatal error occurred. Details saved to:`r`n$logFile`r`n`r`n$($_.Exception.Message)",
        "Crash Report", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error
    )
    break
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# =====================================================================
# CONFIGURAÇÃO DE VERSÃO E AUTO-UPDATE (HOT-SWAP)
# =====================================================================
$CurrentVersion = "1.0"
$GitHubUser = "dyduq12"
$GitHubRepo = "advanced-youtube-downloader"

$UrlVersion = "https://raw.githubusercontent.com/$GitHubUser/$GitHubRepo/main/version.txt"
$UrlScript  = "https://raw.githubusercontent.com/$GitHubUser/$GitHubRepo/main/Baixador_Grafico.ps1"
$LocalScriptPath = "$env:APPDATA\BaixadorYTDLP\Baixador_Grafico.ps1"

try {
    $OnlineVersion = (Invoke-WebRequest -Uri $UrlVersion -UseBasicParsing -TimeoutSec 7).Content.Trim()
    if ($OnlineVersion -and $OnlineVersion -ne $CurrentVersion) {
        # CRÍTICO: Baixar como string UTF-8 e re-salvar COM BOM para não quebrar o parser
        $scriptContent = (Invoke-WebRequest -Uri $UrlScript -UseBasicParsing -TimeoutSec 15).Content
        $utf8Bom = New-Object System.Text.UTF8Encoding($true)
        [System.IO.File]::WriteAllText($LocalScriptPath, $scriptContent, $utf8Bom)
        Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$LocalScriptPath`""
        exit
    }
} catch {
    # Segue para a execução normal se estiver sem rede
}

# =====================================================================
# DICIONÁRIO INTERNACIONAL DE IDIOMAS (i18n) COMPLETAMENTE EXPANDIDO
# =====================================================================
$LocaleTable = @{
    'pt-BR' = @{
        'Title'       = "Advanced YouTube Downloader - Pro"
        'LblLink'     = "Cole o Link do Vídeo aqui:"
        'LblFormat'   = "Tipo de Conteúdo:"
        'LblRes'      = "Resolução Máxima desejada:"
        'ChkClip'     = "Habilitar Corte de Vídeo (Time Clipping)"
        'LblStart'    = "Início (HH:MM:SS):"
        'LblEnd'      = "Fim (HH:MM:SS):"
        'BtnDownload' = "🚀 Iniciar Download"
        'BtnFolder'   = "📁 Abrir Pasta de Downloads"
        'StatusWait'  = "Status: Aguardando comando... (v$CurrentVersion)"
        'StatusActive'= "Status: Executando download... Verifique a janela do terminal."
        'MsgError'    = "Por favor, insira um link válido do YouTube."
        'MsgTimeErr'  = "Preencha os campos de tempo corretamente no formato HH:MM:SS (Ex: 00:01:30)."
        'MsgSuccess'  = "Download finalizado com sucesso!"

        'MsgInstall'  = "As dependências necessárias (yt-dlp ou FFmpeg) não foram encontradas. Deseja instalar automaticamente via winget?"
        'CmbVideo'    = "Video (MP4/MKV)"
        'CmbMP3'      = "Audio Puro (MP3)"
        'CmbM4A'      = "Audio Puro (M4A)"
        'CmbBest'     = "Melhor Disponivel"
    }
    'en-US' = @{
        'Title'       = "Advanced YouTube Downloader - Pro"
        'LblLink'     = "Paste Video Link Here:"
        'LblFormat'   = "Content Type:"
        'LblRes'      = "Maximum Resolution:"
        'ChkClip'     = "Enable Video Clipping (Time Trim)"
        'LblStart'    = "Start (HH:MM:SS):"
        'LblEnd'      = "End (HH:MM:SS):"
        'BtnDownload' = "🚀 Start Download"
        'BtnFolder'   = "📁 Open Downloads Folder"
        'StatusWait'  = "Status: Awaiting command... (v$CurrentVersion)"
        'StatusActive'= "Status: Downloading... Check the terminal window for progress."
        'MsgError'    = "Please, insert a valid YouTube link."
        'MsgTimeErr'  = "Please fill the timestamps correctly using HH:MM:SS format (e.g., 00:01:30)."
        'MsgSuccess'  = "Download finished successfully!"

        'MsgInstall'  = "Required dependencies (yt-dlp or FFmpeg) are missing. Do you want to install them automatically via winget?"
        'CmbVideo'    = "Video (MP4/MKV)"
        'CmbMP3'      = "Pure Audio (MP3)"
        'CmbM4A'      = "Pure Audio (M4A)"
        'CmbBest'     = "Best Available"
    }
    'zh-CN' = @{
        'Title'       = "高级YouTube下载器 - Pro"
        'LblLink'     = "在此处粘贴视频链接:"
        'LblFormat'   = "内容类型:"
        'LblRes'      = "最大分辨率:"
        'ChkClip'     = "启用视频剪辑 (Time Trim)"
        'LblStart'    = "开始 (HH:MM:SS):"
        'LblEnd'      = "结束 (HH:MM:SS):"
        'BtnDownload' = "🚀 开始下载"
        'BtnFolder'   = "📁 打开下载文件夹"
        'StatusWait'  = "状态: 等待命令... (v$CurrentVersion)"
        'StatusActive'= "状态: 正在下载... 请检查终端窗口查看进度。"
        'MsgError'    = "请输入有效的 YouTube 链接。"
        'MsgTimeErr'  = "请使用 HH:MM:SS 格式正确填写时间戳（例如 00:01:30）。"
        'MsgSuccess'  = "下载成功完成！"
        'MsgInstall'  = "未找到所需的依赖项（yt-dlp 或 FFmpeg）。是否要通过 winget 自动安装？"
        'CmbVideo'    = "视频 (MP4/MKV)"
        'CmbMP3'      = "纯音频 (MP3)"
        'CmbM4A'      = "纯音频 (M4A)"
        'CmbBest'     = "最佳可用"
    }
    'es-ES' = @{
        'Title'       = "Descargador de YouTube Avanzado - Pro"
        'LblLink'     = "Pegue el enlace del video aquí:"
        'LblFormat'   = "Tipo de Contenido:"
        'LblRes'      = "Resolución Máxima:"
        'ChkClip'     = "Habilitar Recorte de Vídeo (Time Clipping)"
        'LblStart'    = "Inicio (HH:MM:SS):"
        'LblEnd'      = "Fin (HH:MM:SS):"
        'BtnDownload' = "🚀 Iniciar Descarga"
        'BtnFolder'   = "📁 Abrir Carpeta de Descargas"
        'StatusWait'  = "Estado: Esperando comando... (v$CurrentVersion)"
        'StatusActive'= "Estado: Descargando... Revise la ventana del terminal."
        'MsgError'    = "Por favor, inserte un enlace válido de YouTube."
        'MsgTimeErr'  = "Por favor, complete las marcas de tiempo correctamente en formato HH:MM:SS (Ej: 00:01:30)."
        'MsgSuccess'  = "¡Descarga finalizada con éxito!"
        'MsgInstall'  = "No se encontraron las dependencias necesarias (yt-dlp o FFmpeg). ¿Desea instalarlas automáticamente a través de winget?"
        'CmbVideo'    = "Video (MP4/MKV)"
        'CmbMP3'      = "Audio Puro (MP3)"
        'CmbM4A'      = "Audio Puro (M4A)"
        'CmbBest'     = "Mejor Disponible"
    }
    'ru-RU' = @{
        'Title'       = "Продвинутый загрузчик YouTube - Pro"
        'LblLink'     = "Вставьте ссылку на видео здесь:"
        'LblFormat'   = "Тип контента:"
        'LblRes'      = "Максимальное разрешение:"
        'ChkClip'     = "Включить обрезку видео (Time Clipping)"
        'LblStart'    = "Начало (HH:MM:SS):"
        'LblEnd'      = "Конец (HH:MM:SS):"
        'BtnDownload' = "🚀 Начать скачивание"
        'BtnFolder'   = "📁 Открыть папку загрузок"
        'StatusWait'  = "Статус: Ожидание команды... (v$CurrentVersion)"
        'StatusActive'= "Статус: Скачивание... Проверьте окно терминала."
        'MsgError'    = "Пожалуйста, введите корректную ссылку на YouTube."
        'MsgTimeErr'  = "Пожалуйста, заполните временные метки корректно в формате HH:MM:SS (Пример: 00:01:30)."
        'MsgSuccess'  = "Скачивание успешно завершено!"
        'MsgInstall'  = "Необходимые зависимости (yt-dlp или FFmpeg) не найдены. Хотите установить их автоматически через winget?"
        'CmbVideo'    = "Видео (MP4/MKV)"
        'CmbMP3'      = "Чистый звук (MP3)"
        'CmbM4A'      = "Чистый звук (M4A)"
        'CmbBest'     = "Лучшее доступное"
    }
    'de-DE' = @{
        'Title'       = "Erweiterter YouTube-Downloader - Pro"
        'LblLink'     = "Video-Link hier einfügen:"
        'LblFormat'   = "Inhaltstyp:"
        'LblRes'      = "Maximale Auflösung:"
        'ChkClip'     = "Video-Clipping aktivieren (Time Trim)"
        'LblStart'    = "Start (HH:MM:SS):"
        'LblEnd'      = "Ende (HH:MM:SS):"
        'BtnDownload' = "🚀 Download starten"
        'BtnFolder'   = "📁 Downloads-Ordner öffnen"
        'StatusWait'  = "Status: Warten auf Befehl... (v$CurrentVersion)"
        'StatusActive'= "Status: Herunterladen... Überprüfen Sie das Terminalfenster."
        'MsgError'    = "Bitte fügen Sie einen gültigen YouTube-Link ein."
        'MsgTimeErr'  = "Bitte füllen Sie die Zeitstempel im Format HH:MM:SS korrekt aus (z.B. 00:01:30)."
        'MsgSuccess'  = "Download erfolgreich abgeschlossen!"
        'MsgInstall'  = "Erforderliche Abhängigkeiten (yt-dlp oder FFmpeg) fehlen. Automatisch über winget installieren?"
        'CmbVideo'    = "Video (MP4/MKV)"
        'CmbMP3'      = "Reines Audio (MP3)"
        'CmbM4A'      = "Reines Audio (M4A)"
        'CmbBest'     = "Beste Verfuegbare"
    }
    'hi-IN' = @{
        'Title'       = "उन्नत YouTube डाउनलोडर - Pro"
        'LblLink'     = "यहाँ видео लिंक पेस्ट करें:"
        'LblFormat'   = "सामग्री का प्रकार:"
        'LblRes'      = "अधिकतम रिज़ॉल्यूशन:"
        'ChkClip'     = "वीडियो क्लिपिंग सक्षम करें (Time Trim)"
        'LblStart'    = "प्रारंभ (HH:MM:SS):"
        'LblEnd'      = "अंत (HH:MM:SS):"
        'BtnDownload' = "🚀 डाउनलोड शुरू करें"
        'BtnFolder'   = "📁 डाउनलोड फ़ोल्डर खोलें"
        'StatusWait'  = "स्थिति: कमांड की प्रतीक्षा है... (v$CurrentVersion)"
        'StatusActive'= "स्थिति: डाउनलोड हो रहा है... टर्मिनल विंडो की जांच करें।"
        'MsgError'    = "कृपया एक मान्य YouTube लिंक दर्ज करें।"
        'MsgTimeErr'  = "कृपया HH:MM:SS प्रारूप का उपयोग करके समय सीमा सही ढंग से भरें (जैसे 00:01:30)।"
        'MsgSuccess'  = "डाउनलोड सफलतापूर्वक पूरा हुआ!"
        'MsgInstall'  = "आवश्यक निर्भरताएँ (yt-dlp या FFmpeg) गायब हैं। क्या आप उन्हें स्वचालित रूप से winget के माध्यम से स्थापित करना चाहते हैं?"
        'CmbVideo'    = "वीडियो (MP4/MKV)"
        'CmbMP3'      = "शुद्ध ऑडियो (MP3)"
        'CmbM4A'      = "शुद्ध ऑडियो (M4A)"
        'CmbBest'     = "सर्वश्रेष्ठ उपलब्ध"
    }
}

# Detecção Automática de Linguagem do Sistema Host
$SystemLang = [System.Globalization.CultureInfo]::CurrentUICulture.Name
if (-not $LocaleTable.ContainsKey($SystemLang)) { 
    $SystemLang = 'en-US' 
}
$Txt = $LocaleTable[$SystemLang]

# Configuração Segura dos Direitórios de Saída (Pasta Downloads dentro de Vídeos)
$FolderDownloads = "$env:USERPROFILE\Videos\Downloads"
if (-not (Test-Path -Path $FolderDownloads)) {
    New-Item -ItemType Directory -Path $FolderDownloads -Force | Out-Null
}

# =====================================================================
# VALIDAÇÃO RIGOROSA DE VERIFICAÇÃO DE DEPENDÊNCIAS
# =====================================================================
function Test-CommandExists ($cmd) {
    return [bool](Get-Command $cmd -ErrorAction SilentlyContinue)
}

if (-not (Test-CommandExists "yt-dlp") -or -not (Test-CommandExists "ffmpeg")) {
    $ans = [System.Windows.Forms.MessageBox]::Show($Txt['MsgInstall'], "Setup Dependencies", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($ans -eq [System.Windows.Forms.DialogResult]::Yes) {
        if (-not (Test-CommandExists "yt-dlp")) { 
            Start-Process winget -ArgumentList "install --id yt-dlp.yt-dlp --accept-source-agreements --accept-package-agreements" -Wait -NoNewWindow 
        }
        if (-not (Test-CommandExists "ffmpeg")) { 
            Start-Process winget -ArgumentList "install --id Gyan.FFmpeg --accept-source-agreements --accept-package-agreements" -Wait -NoNewWindow 
        }
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
    } else { 
        exit 
    }
}

# =====================================================================
# CONSTRUÇÃO DA INTERFACE GRÁFICA (FORMULÁRIO DARK MODE EXPANDIDO)
# =====================================================================
$form = New-Object System.Windows.Forms.Form
$form.Text = $Txt['Title']
$form.Size = New-Object System.Drawing.Size(520, 480)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.BackColor = [System.Drawing.Color]::FromArgb(32, 32, 32)
$form.ForeColor = [System.Drawing.Color]::White
$form.MaximizeBox = $false

$defaultFont = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)
$boldFont = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)

# --- Label do Link ---
$lblLink = New-Object System.Windows.Forms.Label
$lblLink.Text = $Txt['LblLink']
$lblLink.Location = New-Object System.Drawing.Point(25, 15)
$lblLink.Size = New-Object System.Drawing.Size(450, 20)
$lblLink.Font = $defaultFont
$form.Controls.Add($lblLink)

# --- Campo de Texto do Link ---
$txtLink = New-Object System.Windows.Forms.TextBox
$txtLink.Location = New-Object System.Drawing.Point(25, 38)
$txtLink.Size = New-Object System.Drawing.Size(450, 25)
$txtLink.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$txtLink.ForeColor = [System.Drawing.Color]::White
$txtLink.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtLink.Font = $defaultFont
$form.Controls.Add($txtLink)

# --- Label do Formato ---
$lblFormat = New-Object System.Windows.Forms.Label
$lblFormat.Text = $Txt['LblFormat']
$lblFormat.Location = New-Object System.Drawing.Point(25, 80)
$lblFormat.Size = New-Object System.Drawing.Size(210, 20)
$lblFormat.Font = $defaultFont
$form.Controls.Add($lblFormat)

# --- Combobox do Formato ---
$cmbFormat = New-Object System.Windows.Forms.ComboBox
$cmbFormat.Location = New-Object System.Drawing.Point(25, 103)
$cmbFormat.Size = New-Object System.Drawing.Size(210, 25)
$cmbFormat.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$cmbFormat.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$cmbFormat.ForeColor = [System.Drawing.Color]::White
$cmbFormat.Font = $defaultFont
$null = $cmbFormat.Items.Add($Txt['CmbVideo'])
$null = $cmbFormat.Items.Add($Txt['CmbMP3'])
$null = $cmbFormat.Items.Add($Txt['CmbM4A'])
$cmbFormat.SelectedIndex = 0
$form.Controls.Add($cmbFormat)

# --- Label da Resolução ---
$lblRes = New-Object System.Windows.Forms.Label
$lblRes.Text = $Txt['LblRes']
$lblRes.Location = New-Object System.Drawing.Point(265, 80)
$lblRes.Size = New-Object System.Drawing.Size(210, 20)
$lblRes.Font = $defaultFont
$form.Controls.Add($lblRes)

# --- Combobox da Resolução ---
$cmbRes = New-Object System.Windows.Forms.ComboBox
$cmbRes.Location = New-Object System.Drawing.Point(265, 103)
$cmbRes.Size = New-Object System.Drawing.Size(210, 25)
$cmbRes.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$cmbRes.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$cmbRes.ForeColor = [System.Drawing.Color]::White
$cmbRes.Font = $defaultFont
$null = $cmbRes.Items.Add($Txt['CmbBest'])
$null = $cmbRes.Items.Add("1080p")
$null = $cmbRes.Items.Add("720p")
$null = $cmbRes.Items.Add("480p")
$cmbRes.SelectedIndex = 0
$form.Controls.Add($cmbRes)

# --- Checkbox do Clipping ---
$chkClip = New-Object System.Windows.Forms.CheckBox
$chkClip.Text = $Txt['ChkClip']
$chkClip.Location = New-Object System.Drawing.Point(25, 150)
$chkClip.Size = New-Object System.Drawing.Size(450, 25)
$chkClip.Font = $defaultFont
$form.Controls.Add($chkClip)

# --- Label do Tempo Inicial ---
$lblStart = New-Object System.Windows.Forms.Label
$lblStart.Text = $Txt['LblStart']
$lblStart.Location = New-Object System.Drawing.Point(25, 185)
$lblStart.Size = New-Object System.Drawing.Size(120, 20)
$lblStart.Enabled = $false
$lblStart.Font = $defaultFont
$form.Controls.Add($lblStart)

# --- TextBox do Tempo Inicial ---
$txtStart = New-Object System.Windows.Forms.TextBox
$txtStart.Location = New-Object System.Drawing.Point(150, 182)
$txtStart.Size = New-Object System.Drawing.Size(85, 25)
$txtStart.Text = "00:00:00"
$txtStart.Enabled = $false
$txtStart.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$txtStart.ForeColor = [System.Drawing.Color]::White
$txtStart.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtStart.Font = $defaultFont
$form.Controls.Add($txtStart)

# --- Label do Tempo Final ---
$lblEnd = New-Object System.Windows.Forms.Label
$lblEnd.Text = $Txt['LblEnd']
$lblEnd.Location = New-Object System.Drawing.Point(265, 185)
$lblEnd.Size = New-Object System.Drawing.Size(110, 20)
$lblEnd.Enabled = $false
$lblEnd.Font = $defaultFont
$form.Controls.Add($lblEnd)

# --- TextBox do Tempo Final ---
$txtEnd = New-Object System.Windows.Forms.TextBox
$txtEnd.Location = New-Object System.Drawing.Point(390, 182)
$txtEnd.Size = New-Object System.Drawing.Size(85, 25)
$txtEnd.Text = "00:01:00"
$txtEnd.Enabled = $false
$txtEnd.BackColor = [System.Drawing.Color]::FromArgb(45, 45, 45)
$txtEnd.ForeColor = [System.Drawing.Color]::White
$txtEnd.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$txtEnd.Font = $defaultFont
$form.Controls.Add($txtEnd)

# --- Botão de Download ---
$btnDownload = New-Object System.Windows.Forms.Button
$btnDownload.Text = $Txt['BtnDownload']
$btnDownload.Location = New-Object System.Drawing.Point(25, 235)
$btnDownload.Size = New-Object System.Drawing.Size(450, 45)
$btnDownload.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$btnDownload.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnDownload.FlatAppearance.BorderSize = 0
$btnDownload.Font = $boldFont
$form.Controls.Add($btnDownload)

# --- Botão Abrir Pasta ---
$btnOpenFolder = New-Object System.Windows.Forms.Button
$btnOpenFolder.Text = $Txt['BtnFolder']
$btnOpenFolder.Location = New-Object System.Drawing.Point(25, 295)
$btnOpenFolder.Size = New-Object System.Drawing.Size(450, 35)
$btnOpenFolder.BackColor = [System.Drawing.Color]::FromArgb(50, 50, 50)
$btnOpenFolder.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnOpenFolder.FlatAppearance.BorderSize = 0
$btnOpenFolder.Font = $defaultFont
$form.Controls.Add($btnOpenFolder)

# --- Label de Status ---
$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Text = $Txt['StatusWait']
$lblStatus.Location = New-Object System.Drawing.Point(25, 355)
$lblStatus.Size = New-Object System.Drawing.Size(450, 40)
$lblStatus.Font = $defaultFont
$form.Controls.Add($lblStatus)

# =====================================================================
# CONTROLADORES DE EVENTO E COMPORTAMENTO DINÂMICO
# =====================================================================
$cmbFormat.Add_SelectedIndexChanged({
    if ($cmbFormat.SelectedIndex -eq 0) {
        $cmbRes.Enabled = $true
    } else {
        $cmbRes.Enabled = $false
    }
})

$chkClip.Add_CheckedChanged({
    $state = $chkClip.Checked
    $lblStart.Enabled = $state
    $txtStart.Enabled = $state
    $lblEnd.Enabled = $state
    $txtEnd.Enabled = $state
})

$btnOpenFolder.Add_Click({
    if (-not (Test-Path -Path $FolderDownloads)) {
        New-Item -ItemType Directory -Path $FolderDownloads -Force | Out-Null
    }
    Start-Process explorer.exe $FolderDownloads
})

# =====================================================================
# LÓGICA CORE DE SEGURANÇA E INJEÇÃO DE ARGUMENTOS EM ARRAY
# =====================================================================
$btnDownload.Add_Click({
    if ([string]::IsNullOrWhiteSpace($txtLink.Text)) {
        [System.Windows.Forms.MessageBox]::Show($Txt['MsgError'], "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }

    $url = $txtLink.Text.Trim()
    $lblStatus.Text = $Txt['StatusActive']
    $btnDownload.Enabled = $false
    [System.Windows.Forms.Application]::DoEvents()

    # Inicialização do Array Seguro de Argumentos (Impede quebra por tokens do YouTube como '&' ou '?')
    # CRÍTICO: --no-playlist impede que yt-dlp baixe playlists/canais inteiros
    $ytArgs = @("--no-playlist", "-P", $FolderDownloads)

    if ($cmbFormat.SelectedIndex -eq 0) {
        $res = "infinite"
        if ($cmbRes.SelectedIndex -eq 1) { $res = "1080" }
        if ($cmbRes.SelectedIndex -eq 2) { $res = "720" }
        if ($cmbRes.SelectedIndex -eq 3) { $res = "480" }

        if ($res -eq "infinite") {
            $ytArgs += @("-f", "bv+ba/b", "--merge-output-format", "mp4")
        } else {
            $formatString = "bv*[height<=$res]+ba/b[height<=$res]"
            $ytArgs += @("-f", $formatString, "--merge-output-format", "mp4")
        }
    } elseif ($cmbFormat.SelectedIndex -eq 1) {
        $ytArgs += @("-x", "--audio-format", "mp3", "--audio-quality", "0")
    } elseif ($cmbFormat.SelectedIndex -eq 2) {
        $ytArgs += @("-x", "--audio-format", "m4a")
    }

    # Tratamento e Validação por Expressão Regular do Time Clipping
    if ($chkClip.Checked) {
        $start = $txtStart.Text.Trim()
        $end = $txtEnd.Text.Trim()
        
        if (-not ($start -match "^\d{2}:\d{2}:\d{2}$") -or -not ($end -match "^\d{2}:\d{2}:\d{2}$")) {
            [System.Windows.Forms.MessageBox]::Show($Txt['MsgTimeErr'], "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            $lblStatus.Text = $Txt['StatusWait']
            $btnDownload.Enabled = $true
            return
        }
        
        $ytArgs += @("--download-sections", "*$start-$end", "--force-keyframes-at-cuts")
    }

    # Vinculação Final do Link Bruto como Literal de String
    $ytArgs += @($url)

    try {
        $process = Start-Process yt-dlp -ArgumentList $ytArgs -Wait -PassThru -NoNewWindow:$false

        if ($process.ExitCode -eq 0) {
            $lblStatus.Text = $Txt['MsgSuccess']
            [System.Windows.Forms.MessageBox]::Show($Txt['MsgSuccess'], "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        } else {
            $lblStatus.Text = "Error"
            [System.Windows.Forms.MessageBox]::Show("yt-dlp encountered an execution error.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    } catch {
        $lblStatus.Text = "Error"
        [System.Windows.Forms.MessageBox]::Show($_.Exception.Message, "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }

    $btnDownload.Enabled = $true
})

# Inicia a Janela da Aplicação
$form.ShowDialog()