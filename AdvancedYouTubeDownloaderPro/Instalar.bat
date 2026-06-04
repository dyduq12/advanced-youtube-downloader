@echo off
chcp 65001 >nul
title Installer - Pro

:: --- DETECÇÃO AUTOMÁTICA DE IDIOMA ---
set "LANG=en-US"
for /f "tokens=1 delims=," %%i in ('powershell -NoProfile -Command "[System.Globalization.CultureInfo]::CurrentUICulture.Name"') do set "LANG=%%i"

if "%LANG%"=="pt-BR" (
    set "MSG_ADMIN=[AVISO] Este instalador precisa ser executado como Administrador."
    set "MSG_ELEV=Tentando reabrir com privilégios elevados..."
    set "MSG_WELCOME=BEM-VINDO AO INSTALADOR DO BAIXADOR AVANÇADO"
    set "MSG_TERMS=Ao prosseguir, você concorda com os termos do Winget, yt-dlp e FFmpeg."
    set "MSG_DIR=[1/3] Criando diretório seguro em AppData..."
    set "MSG_COPY=[2/3] Copiando arquivos do aplicativo..."
    set "MSG_ERR_FIND=[ERRO] Os arquivos na pasta 'data' nao foram encontrados!"
    set "MSG_LINK=[3/3] Criando atalho na Área de Trabalho..."
    set "MSG_SUCCESS=INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
    set "MSG_THANKS=O atalho foi gerado no seu Desktop de forma limpa."
    set "ATALHO_NOME=Baixador de Videos Pro"
) else if "%LANG%"=="es-ES" (
    set "MSG_ADMIN=[AVISO] Este instalador debe ejecutarse como Administrador."
    set "MSG_ELEV=Intentando reabrir con privilegios elevados..."
    set "MSG_WELCOME=BIENVENIDO AL INSTALADOR DEL DESCARGADOR AVANZADO"
    set "MSG_TERMS=Al continuar, acepta los términos de Winget, yt-dlp y FFmpeg."
    set "MSG_DIR=[1/3] Creando directorio seguro en AppData..."
    set "MSG_COPY=[2/3] Copiando archivos de la aplicación..."
    set "MSG_ERR_FIND=[ERROR] ¡No se encontraron los archivos en la carpeta 'data'!"
    set "MSG_LINK=[3/3] Creando acceso directo en el Escritorio..."
    set "MSG_SUCCESS=¡INSTALACIÓN COMPLETADA CON ÉXITO!"
    set "MSG_THANKS=El acceso directo se ha generado limpiamente en su Escritorio."
    set "ATALHO_NOME=Descargador de Videos Pro"
) else if "%LANG%"=="zh-CN" (
    set "MSG_ADMIN=[警告] 此安装程序需要作为管理员运行。"
    set "MSG_ELEV=正在尝试以提升的权限重新打开..."
    set "MSG_WELCOME=欢迎使用高级下载器安装程序"
    set "MSG_TERMS=继续即表示您同意 Winget、yt-dlp 和 FFmpeg 的条款。"
    set "MSG_DIR=[1/3] 正在 AppData 中创建安全目录..."
    set "MSG_COPY=[2/3] 正在复制应用程序文件..."
    set "MSG_ERR_FIND=[错误] 未找到 'data' 文件夹中的文件！"
    set "MSG_LINK=[3/3] 正在桌面上创建快捷方式..."
    set "MSG_SUCCESS=安装成功完成！"
    set "MSG_THANKS=快捷方式已在您的桌面上干净地生成。"
    set "ATALHO_NOME=高级视频下载器"
) else if "%LANG%"=="ru-RU" (
    set "MSG_ADMIN=[ВНИМАНИЕ] Этот установщик необходимо запустить от имени администратора."
    set "MSG_ELEV=Попытка повторного открытия с повышенными привилегиями..."
    set "MSG_WELCOME=ДОБРО ПОЖАЛОВАТЬ В ПРОГРАММУ УСТАНОВКИ"
    set "MSG_TERMS=Продолжая, вы соглашаетесь с условиями Winget, yt-dlp и FFmpeg."
    set "MSG_DIR=[1/3] Создание безопасного каталога в AppData..."
    set "MSG_COPY=[2/3] Копирование файлов приложения..."
    set "MSG_ERR_FIND=[ОШИБКА] Файлы в папке 'data' не найдены!"
    set "MSG_LINK=[3/3] Создание ярлыка на рабочем столе..."
    set "MSG_SUCCESS=УСТАНОВКА УСПЕШНО ЗАВЕРШЕНА!"
    set "MSG_THANKS=Ярлык был успешно создан на вашем рабочем столе."
    set "ATALHO_NOME=Продвинутый загрузчик видео"
) else if "%LANG%"=="de-DE" (
    set "MSG_ADMIN=[WARNUNG] Dieses Installationsprogramm muss als Administrator ausgeführt werden."
    set "MSG_ELEV=Versuch, mit erweiterten Rechten erneut zu öffnen..."
    set "MSG_WELCOME=WILLKOMMEN BEIM ERWEITERTEN DOWNLOADER-INSTALLER"
    set "MSG_TERMS=Indem Sie fortfahren, stimmen Sie den Bedingungen von Winget, yt-dlp und FFmpeg zu."
    set "MSG_DIR=[1/3] Sicheres Verzeichnis in AppData erstellen..."
    set "MSG_COPY=[2/3] Anwendungsdateien kopieren..."
    set "MSG_ERR_FIND=[FEHLER] Dateien im Ordner 'data' nicht gefunden!"
    set "MSG_LINK=[3/3] Verknüpfung auf dem Desktop erstellen..."
    set "MSG_SUCCESS=INSTALLATION ERFOLGREICH ABGESCHLOSSEN!"
    set "MSG_THANKS=Die Verknüpfung wurde sauber auf Ihrem Desktop generiert."
    set "ATALHO_NOME=Erweiterter Video-Downloader"
) else if "%LANG%"=="hi-IN" (
    set "MSG_ADMIN=[चेतावनी] इस इंस्टॉलर को व्यवस्थापक के रूप में चलाया जाना चाहिए।"
    set "MSG_ELEV=उच्च विशेषाधिकारों के साथ फिर से खोलने का प्रयास किया जा रहा है..."
    set "MSG_WELCOME=उन्नत डाउनलोडर इंस्टॉलर में आपका स्वागत है"
    set "MSG_TERMS=जारी रखकर, आप Winget, yt-dlp और FFmpeg की शर्तों से सहमत हैं।"
    set "MSG_DIR=[1/3] AppData में सुरक्षित निर्देशिका बनाई जा रही है..."
    set "MSG_COPY=[2/3] एप्लिकेशन फ़ाइलों की प्रतिलिपि बनाई जा रही है..."
    set "MSG_ERR_FIND=[त्रुटि] 'data' फ़ोल्डर में फ़ाइलें नहीं मिलीं!"
    set "MSG_LINK=[3/3] डेस्कटॉप पर शॉर्टकट बनाया जा रहा है..."
    set "MSG_SUCCESS=स्थापना सफलतापूर्वक पूर्ण हुई!"
    set "MSG_THANKS=शॉर्टकट आपके डेस्कटॉप पर स्पष्ट रूप से उत्पन्न हो गया है।"
    set "ATALHO_NOME=उन्नत वीडियो डाउनलोडर"
) else (
    set "MSG_ADMIN=[WARNING] This installer needs to be run as Administrator."
    set "MSG_ELEV=Attempting to reopen with elevated privileges..."
    set "MSG_WELCOME=WELCOME TO THE ADVANCED DOWNLOADER INSTALLER"
    set "MSG_TERMS=By proceeding, you agree to the terms of Winget, yt-dlp, and FFmpeg."
    set "MSG_DIR=[1/3] Creating secure directory in AppData..."
    set "MSG_COPY=[2/3] Copying application files..."
    set "MSG_ERR_FIND=[ERROR] Files in 'data' folder were not found!"
    set "MSG_LINK=[3/3] Creating shortcut on Desktop..."
    set "MSG_SUCCESS=INSTALLATION COMPLETED SUCCESSFULLY!"
    set "MSG_THANKS=The shortcut has been cleanly generated on your Desktop."
    set "ATALHO_NOME=Advanced Video Downloader"
)

:: --- VERIFICAÇÃO DE ADMINISTRADOR COM AUTO-ELEVAÇÃO ---
fsutil dirty query %systemdrive% >nul 2>&1
if %errorLevel% neq 0 (
    echo %MSG_ADMIN%
    echo %MSG_ELEV%
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo ==================================================
echo   %MSG_WELCOME%
echo ==================================================
echo.
echo %MSG_TERMS%
echo.
pause

:: --- DEFINIÇÃO DOS DIRETÓRIOS ---
set "PASTA_DESTINO=%APPDATA%\BaixadorYTDLP"
set "ARQUIVO_SCRIPT=Baixador_Grafico.ps1"
set "SCRIPT_VB=%TEMP%\CriaAtalho.vbs"

echo.
echo %MSG_DIR%
if not exist "%PASTA_DESTINO%" mkdir "%PASTA_DESTINO%"

echo %MSG_COPY%
if exist "%~dp0data\%ARQUIVO_SCRIPT%" (
    copy /Y "%~dp0data\%ARQUIVO_SCRIPT%" "%PASTA_DESTINO%\%ARQUIVO_SCRIPT%" >nul
    if exist "%~dp0data\Icon.ico" copy /Y "%~dp0data\Icon.ico" "%PASTA_DESTINO%\Icon.ico" >nul
) else (
    echo %MSG_ERR_FIND%
    pause
    exit /b
)

echo %MSG_LINK%
:: Mapeia o caminho exato do Desktop do usuário ativo de forma dinâmica
for /f "usebackq tokens=3,4" %%a in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "DESKTOP_DIR=%%a %%b"
if "%DESKTOP_DIR%"=="" for /f "usebackq tokens=3" %%a in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "DESKTOP_DIR=%%a"
call set "DESKTOP_REAL=%DESKTOP_DIR%"

:: Constrói o criador de atalho via script VBS temporário com suporte a Icon.ico
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%SCRIPT_VB%"
echo sLinkFile = "%DESKTOP_REAL%\%ATALHO_NOME%.lnk" >> "%SCRIPT_VB%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%SCRIPT_VB%"
echo oLink.TargetPath = "powershell.exe" >> "%SCRIPT_VB%"
echo oLink.Arguments = "-ExecutionPolicy Bypass -WindowStyle Hidden -File ""%PASTA_DESTINO%\%ARQUIVO_SCRIPT%""" >> "%SCRIPT_VB%"
echo oLink.WorkingDirectory = "%PASTA_DESTINO%" >> "%SCRIPT_VB%"
echo oLink.IconLocation = "%PASTA_DESTINO%\Icon.ico" >> "%SCRIPT_VB%"
echo oLink.Save >> "%SCRIPT_VB%"

:: Executa e destrói o script temporário
cscript //nologo "%SCRIPT_VB%"
del "%SCRIPT_VB%" >nul

echo.
echo ==================================================
echo   %MSG_SUCCESS%
echo ==================================================
echo.
echo %MSG_THANKS%
echo.
pause