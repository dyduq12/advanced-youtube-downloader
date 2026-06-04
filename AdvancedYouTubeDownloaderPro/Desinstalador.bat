@echo off
chcp 65001 >nul
title Advanced Video Downloader - Uninstaller

:: =====================================================================
:: DETECCAO AUTOMATICA DE IDIOMA (7 IDIOMAS)
:: =====================================================================
set "LANG=en-US"
for /f "tokens=1 delims=," %%i in ('powershell -NoProfile -Command "[System.Globalization.CultureInfo]::CurrentUICulture.Name"') do set "LANG=%%i"

if "%LANG%"=="pt-BR" goto pt
if "%LANG%"=="es-ES" goto es
if "%LANG%"=="zh-CN" goto zh
if "%LANG%"=="ru-RU" goto ru
if "%LANG%"=="de-DE" goto de
if "%LANG%"=="hi-IN" goto hi
goto en

:pt
set "MSG_ADMIN=[AVISO] Este instalador precisa ser executado como Administrador."
set "MSG_ELEV=Tentando reabrir com privilegios elevados..."
set "MSG_TITLE=DESINSTALADOR DO BAIXADOR AVANCADO"
set "MSG_WARN=ATENCAO: Este script ira remover completamente o programa, os plugins e esta pasta."
set "MSG_CONFIRM=Pressione qualquer tecla para continuar ou feche a janela para cancelar..."
set "MSG_YTDLP=[1/5] Desinstalando yt-dlp via winget..."
set "MSG_FFMPEG=[2/5] Desinstalando FFmpeg via winget..."
set "MSG_FOLDER=[3/5] Removendo pasta de configuracoes em AppData..."
set "MSG_SHORTCUT=[4/5] Removendo atalho da Area de Trabalho..."
set "MSG_WIPE=[5/5] Removendo os arquivos de instalacao originais..."
set "MSG_DONE=DESINSTALACAO CONCLUIDA! Esta janela fechara automaticamente."
set "MSG_NOT_FOUND=Nao encontrado, pulando..."
set "ATALHO_NOME=Baixador de Videos Pro"
goto start_uninstall

:es
set "MSG_ADMIN=[AVISO] Este instalador debe ejecutarse como Administrador."
set "MSG_ELEV=Intentando reabrir con privilegios elevados..."
set "MSG_TITLE=DESINSTALADOR DEL DESCARGADOR AVANZADO"
set "MSG_WARN=ATENCION: Este script eliminara completamente el programa, los plugins y esta carpeta."
set "MSG_CONFIRM=Presione cualquier tecla para continuar o cierre la ventana para cancelar..."
set "MSG_YTDLP=[1/5] Desinstalando yt-dlp via winget..."
set "MSG_FFMPEG=[2/5] Desinstalando FFmpeg via winget..."
set "MSG_FOLDER=[3/5] Eliminando configuraciones en AppData..."
set "MSG_SHORTCUT=[4/5] Eliminando acceso directo del Escritorio..."
set "MSG_WIPE=[5/5] Eliminando archivos de instalacion originales..."
set "MSG_DONE=DESINSTALACION COMPLETADA! Esta ventana se cerrara."
set "MSG_NOT_FOUND=No encontrado, omitiendo..."
set "ATALHO_NOME=Descargador de Videos Pro"
goto start_uninstall

:zh
set "MSG_ADMIN=[警告] 此程序需要作为管理员运行。"
set "MSG_ELEV=正在尝试提升权限..."
set "MSG_TITLE=UNINSTALLER"
set "MSG_WARN=WARNING: Complete removal."
set "MSG_CONFIRM=Press any key to continue..."
set "MSG_YTDLP=[1/5] Uninstalling yt-dlp..."
set "MSG_FFMPEG=[2/5] Uninstalling FFmpeg..."
set "MSG_FOLDER=[3/5] Removing AppData..."
set "MSG_SHORTCUT=[4/5] Removing shortcut..."
set "MSG_WIPE=[5/5] Wiping original files..."
set "MSG_DONE=UNINSTALL COMPLETE!"
set "MSG_NOT_FOUND=Not found, skipping..."
set "ATALHO_NOME=高级视频下载器"
goto start_uninstall

:ru
set "MSG_ADMIN=[ВНИМАНИЕ] Запустите от имени администратора."
set "MSG_ELEV=Попытка повторного открытия с повышенными привилегиями..."
set "MSG_TITLE=UNINSTALLER"
set "MSG_WARN=WARNING: Complete removal."
set "MSG_CONFIRM=Press any key to continue..."
set "MSG_YTDLP=[1/5] Uninstalling yt-dlp..."
set "MSG_FFMPEG=[2/5] Uninstalling FFmpeg..."
set "MSG_FOLDER=[3/5] Removing AppData..."
set "MSG_SHORTCUT=[4/5] Removing shortcut..."
set "MSG_WIPE=[5/5] Wiping original files..."
set "MSG_DONE=UNINSTALL COMPLETE!"
set "MSG_NOT_FOUND=Not found, skipping..."
set "ATALHO_NOME=Продвинутый загрузчик видео"
goto start_uninstall

:de
set "MSG_ADMIN=[WARNUNG] Als Administrator ausfuhren."
set "MSG_ELEV=Versuch, mit erweiterten Rechten erneut zu offnen..."
set "MSG_TITLE=UNINSTALLER"
set "MSG_WARN=WARNING: Complete removal."
set "MSG_CONFIRM=Press any key to continue..."
set "MSG_YTDLP=[1/5] Uninstalling yt-dlp..."
set "MSG_FFMPEG=[2/5] Uninstalling FFmpeg..."
set "MSG_FOLDER=[3/5] Removing AppData..."
set "MSG_SHORTCUT=[4/5] Removing shortcut..."
set "MSG_WIPE=[5/5] Wiping original files..."
set "MSG_DONE=UNINSTALL COMPLETE!"
set "MSG_NOT_FOUND=Not found, skipping..."
set "ATALHO_NOME=Erweiterter Video-Downloader"
goto start_uninstall

:hi
set "MSG_ADMIN=[चेतावनी] व्यवस्थापक के रूप में चलाएं।"
set "MSG_ELEV=उच्च विशेषाधिकारों के साथ फिर से खोलने का प्रयास किया जा रहा है..."
set "MSG_TITLE=UNINSTALLER"
set "MSG_WARN=WARNING: Complete removal."
set "MSG_CONFIRM=Press any key to continue..."
set "MSG_YTDLP=[1/5] Uninstalling yt-dlp..."
set "MSG_FFMPEG=[2/5] Uninstalling FFmpeg..."
set "MSG_FOLDER=[3/5] Removing AppData..."
set "MSG_SHORTCUT=[4/5] Removing shortcut..."
set "MSG_WIPE=[5/5] Wiping original files..."
set "MSG_DONE=UNINSTALL COMPLETE!"
set "MSG_NOT_FOUND=Not found, skipping..."
set "ATALHO_NOME=उन्नत वीडियो डाउनलोडर"
goto start_uninstall

:en
set "MSG_ADMIN=[WARNING] This installer needs to be run as Administrator."
set "MSG_ELEV=Attempting to reopen with elevated privileges..."
set "MSG_TITLE=ADVANCED DOWNLOADER UNINSTALLER"
set "MSG_WARN=WARNING: This script will completely remove the program, plugins, and this folder."
set "MSG_CONFIRM=Press any key to continue or close this window to cancel..."
set "MSG_YTDLP=[1/5] Uninstalling yt-dlp via winget..."
set "MSG_FFMPEG=[2/5] Uninstalling FFmpeg via winget..."
set "MSG_FOLDER=[3/5] Removing application folder from AppData..."
set "MSG_SHORTCUT=[4/5] Removing Desktop shortcut..."
set "MSG_WIPE=[5/5] Wiping original installer files..."
set "MSG_DONE=UNINSTALL COMPLETE! This window will close automatically."
set "MSG_NOT_FOUND=Not found, skipping..."
set "ATALHO_NOME=Advanced Video Downloader"
goto start_uninstall

:start_uninstall

:: --- VERIFICAÇÃO DE ADMINISTRADOR COM AUTO-ELEVAÇÃO ---
fsutil dirty query %systemdrive% >nul 2>&1
if %errorLevel% neq 0 (
    echo %MSG_ADMIN%
    echo %MSG_ELEV%
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

cls
echo ==================================================
echo   %MSG_TITLE%
echo ==================================================
echo.
echo %MSG_WARN%
echo.
echo %MSG_CONFIRM%
pause >nul

:: --- PASSO 1: DESINSTALAR YT-DLP ---
echo.
echo %MSG_YTDLP%
winget uninstall --id yt-dlp.yt-dlp --silent --accept-source-agreements
if %errorLevel% neq 0 (
    echo   ^> yt-dlp: %MSG_NOT_FOUND%
)

:: --- PASSO 2: DESINSTALAR FFMPEG ---
echo.
echo %MSG_FFMPEG%
winget uninstall --id Gyan.FFmpeg --silent --accept-source-agreements
if %errorLevel% neq 0 (
    echo   ^> FFmpeg: %MSG_NOT_FOUND%
)

:: --- PASSO 3: DELETAR PASTA DO APPDATA ---
echo.
echo %MSG_FOLDER%
set "APP_FOLDER=%APPDATA%\BaixadorYTDLP"
if exist "%APP_FOLDER%" (
    rmdir /S /Q "%APP_FOLDER%"
    echo   ^> %APP_FOLDER% [OK]
) else (
    echo   ^> %APP_FOLDER%: %MSG_NOT_FOUND%
)

:: --- PASSO 4: DELETAR ATALHO DA AREA DE TRABALHO ---
echo.
echo %MSG_SHORTCUT%
for /f "usebackq tokens=3,4" %%a in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "DESKTOP_DIR=%%a %%b"
if "%DESKTOP_DIR%"=="" for /f "usebackq tokens=3" %%a in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "DESKTOP_DIR=%%a"
call set "DESKTOP_PATH=%DESKTOP_DIR%"

if exist "%DESKTOP_PATH%\%ATALHO_NOME%.lnk" (
    del /F /Q "%DESKTOP_PATH%\%ATALHO_NOME%.lnk"
    echo   ^> %ATALHO_NOME%.lnk [OK]
) else (
    set "FOUND_SHORTCUT=0"
    for %%N in ("Baixador de Videos Pro" "Descargador de Videos Pro" "Advanced Video Downloader" "Erweiterter Video-Downloader") do (
        if exist "%DESKTOP_PATH%\%%~N.lnk" (
            del /F /Q "%DESKTOP_PATH%\%%~N.lnk"
            echo   ^> %%~N.lnk [OK]
            set "FOUND_SHORTCUT=1"
        )
    )
    if "!FOUND_SHORTCUT!"=="0" echo   ^> %MSG_NOT_FOUND%
)

:: --- PASSO 5: AUTO-DESTRUIÇÃO (Limpar os arquivos fonte) ---
echo.
echo %MSG_WIPE%
if exist "data" rmdir /S /Q data
del /F /Q Instalar.bat 2>nul

echo.
echo ==================================================
echo   %MSG_DONE%
echo ==================================================
echo.
timeout /t 5 >nul

:: Se apaga e sai do script
(goto) 2>nul & del "%~f0"