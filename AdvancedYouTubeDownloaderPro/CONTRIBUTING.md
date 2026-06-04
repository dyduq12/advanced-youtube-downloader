# Contributing to Advanced YouTube Downloader

First off, thank you for considering contributing to this project! It's people like you that make the open-source community such an amazing place to learn, inspire, and create.

## How Can I Contribute?

### Reporting Bugs
* Check the Issues tab to see if the bug has already been reported.
* If not, open a new Issue, describe the problem clearly, and provide the steps to reproduce it.
* Include your system language (Locale culture) since the app uses an i18n engine.

### Suggesting Enhancements
* Open an Issue explaining the feature you would like to see added.
* Explain why this feature would be useful to other users.

### Pull Requests (Code changes)
1. Fork the repository.
2. Create a stable architecture branch for your feature (`git checkout -b feature/AmazingFeature`).
3. Commit your changes with clear messages (`git commit -m 'Add some AmazingFeature'`).
4. Ensure your code accounts for internationalization by using the `$LocaleTable` dictionary.
5. Push to the branch (`git push origin feature/AmazingFeature`).
6. Open a Pull Request against the `main` branch.

## Code Style Guidelines
* **Do not hardcode strings:** All UI text must be mapped into the `$LocaleTable` inside `Baixador_Grafico.ps1` and localized in `Instalar.bat`.
* **Argument Binding:** Always pass parameters to execution binaries using index arrays (`@()`) to avoid parameter splitting or token injection bugs.