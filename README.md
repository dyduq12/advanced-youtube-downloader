# Advanced YouTube Downloader - Pro 🚀

*(For English, scroll down)*

## 🇧🇷 Português

O **Advanced YouTube Downloader - Pro** é uma interface gráfica (GUI) robusta e moderna, construída nativamente em PowerShell, projetada para facilitar o download de vídeos e áudios utilizando os poderosos motores `yt-dlp` e `FFmpeg`.

### ✨ Principais Recursos
* **Interface Gráfica Moderna:** Design em Dark Mode sem travamentos, otimizado para o Windows 11.
* **Múltiplos Formatos e Resoluções:** Suporte nativo para Vídeo (Melhor, 1080p, 720p, 480p) encapsulado em MP4/MKV e Áudio puro em MP3 ou M4A.
* **Corte de Vídeo Estrito (Time Clipping):** Baixe apenas as seções que você deseja do arquivo original, configurando o tempo de Início e Fim (HH:MM:SS) direto na interface.
* **Gestão de Dependências Blindada:** Instalação automática do `yt-dlp` e `FFmpeg` via gerenciador `winget` caso os binários não sejam detectados no sistema.
* **Suporte Global (i18n):** O programa lê a arquitetura do sistema operacional e se adapta automaticamente a 7 línguas: Português, Inglês, Chinês, Espanhol, Russo, Alemão e Hindi.
* **Nova Organização e Auto-Elevação:** Scripts separados em pastas (`data/`) para uma instalação limpa, e o instalador agora pede automaticamente permissões de Administrador caso você esqueça!
* **Downloads Nativos Seguros:** Todos os downloads são enviados nativamente para `Sua Pasta de Vídeos > Downloads` (`%USERPROFILE%\Videos\Downloads`).

### 📦 Como Instalar
1. Faça o download desta pasta completa.
2. Não mova os arquivos da pasta `data/`. Eles são o coração do aplicativo.
3. Dê dois cliques no arquivo `Instalar.bat` (ou clique com o botão direito e selecione **Executar como Administrador**).
4. O instalador copiará os componentes para o diretório local do sistema e criará um atalho funcional na sua Área de Trabalho com um ícone premium.

### 🗑️ Como Desinstalar
1. Para remover, basta dar dois cliques no `Desinstalador.bat`.
2. O sistema apagará as dependências, os atalhos, as pastas do sistema e, ao final, irá **se auto-destruir**, limpando a pasta original inteira para que não sobre nenhum rastro no seu PC.

### 🛠️ Por que isso funciona (Detalhes Técnicos)?
* **Isolamento de Argumentos (`Array Injection`):** O script PowerShell efetua a passagem de parâmetros para o motor de download via arrays estritos (`$ytArgs += @($url)`). Isso impede erros fatais de injeção quando a URL possui tokens comerciais (como `&` e `?`), blindando o terminal nativo.
* **Criação de Atalho Resiliente:** O instalador (`.bat`) burla os problemas comuns de aspas duplas e escape do prompt de comando ao criar um arquivo `VBScript` temporário, que aplica corretamente o ícone e parâmetros.
* **Prevenção de Parse UTF-8 no CMD:** Utilizamos a tecnologia de "Pulos" (`goto`) no CMD para evitar que o Motor Batch do Windows quebre ao ler alfabetos internacionais (como o Chinês e o Russo), tornando os scripts `.bat` 100% internacionais.

---

## 🇺🇸 English

**Advanced YouTube Downloader - Pro** is a robust, modern Graphical User Interface (GUI) built natively in PowerShell, designed to easily download videos and audio using the powerful `yt-dlp` and `FFmpeg` engines.

### ✨ Key Features
* **Modern UI:** Crash-free Dark Mode design, optimized for Windows 11.
* **Multiple Formats & Resolutions:** Native support for Video (Best, 1080p, 720p, 480p) in MP4/MKV and pure Audio in MP3 or M4A.
* **Strict Time Clipping:** Download only the specific sections of the video you want by setting the Start and End times (HH:MM:SS) directly in the UI.
* **Bulletproof Dependency Management:** Auto-installation of `yt-dlp` and `FFmpeg` via `winget` if the binaries are missing from your system.
* **Global Support (i18n):** The app reads your OS locale and auto-adapts to 7 languages: English, Portuguese, Chinese, Spanish, Russian, German, and Hindi.
* **New File Structure & Auto-Elevation:** Scripts safely stored in `data/`, and the installer now automatically requests Administrator permissions for you.
* **Native Downloads Folder:** Your downloaded media safely goes to your OS default `Videos > Downloads` folder (`%USERPROFILE%\Videos\Downloads`).

### 📦 How to Install
1. Download this entire folder.
2. Do not move or delete the files inside the `data/` folder.
3. Double click the `Instalar.bat` script (it will automatically ask for Administrator rights).
4. The installer will copy the core components to your AppData directory and create a sleek shortcut on your Desktop.

### 🗑️ How to Uninstall
1. Simply double-click `Desinstalador.bat`.
2. It will uninstall dependencies, delete system folders, remove the shortcut, and **self-destruct**, wiping the original files cleanly from your PC.

### 🛠️ Why it Works (Technical Details)
* **Argument Isolation (`Array Injection`):** The PowerShell script passes parameters to the engine using strict arrays (`$ytArgs += @($url)`). This prevents fatal injection errors when URLs contain commercial tokens (like `&` and `?`).
* **Resilient Shortcut Creation:** The `.bat` installer bypasses common double-quote and escape issues by generating a temporary `VBScript` to perfectly link the icon and paths.
* **CMD UTF-8 Parse Prevention:** We use `goto` jumps to prevent the Windows Batch engine from crashing when reading international alphabets (like Chinese and Russian), making the `.bat` scripts 100% international., ensuring seamless startup without hang-ups.