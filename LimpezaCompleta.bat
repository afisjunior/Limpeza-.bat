@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 04
    echo ERRO: Este script precisa ser executado como Administrador!
    echo Clique com botao direito e selecione "Executar como administrador"
    echo.
    pause
    exit /b 1
)

color 03
Title Aviso sobre a limpeza.

echo AVISO!
echo.
echo.
echo Resumo da limpeza:
echo - Logs do Windows removidos, Logs de performance removidos
echo - Cache DNS limpo, Cache de miniaturas limpo
echo - Arquivos temporarios do sistema removidos, Arquivos temporarios do .NET removidos
echo - Cache de aplicativos limpo, Cookies de Sites e etc
echo - Historico de execucao limpo, Arquivos temporarios de navegadores
echo - Arquivos de crash removidos, Limpar a lixeira
echo - Arquivos do Bloxstrap limpos, Arquivos de Jogos em geral
echo - Cache de Shaders de jogos, Cache de DirectX
echo - Arquivos temporarios de atualizacoes do Windows
echo - Cache de fontes do sistema
echo - Arquivos temporarios de instaladores
echo - Cache de apps do Windows Store
echo - Arquivo de hibernacao e pagina de memoria
echo.
echo.
echo Deseja continuar com a limpeza? (S/N)
choice /c SN /n /m "Sua escolha: "
if errorlevel 2 (
    echo Operacao cancelada pelo usuario.
    pause
    exit /b 0
)

set "logfile=%userprofile%\Desktop\limpeza_log_%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
echo Log de Limpeza - Executado em %date% %time% por %username% > "%logfile%"
echo. >> "%logfile%"

Title Limpando seu pc...

set "windows=%windir%"
set "systemdrive=%systemdrive%"
set "userprofile=%userprofile%"
set "temp=%temp%"
set "history=%userprofile%\Local Settings\History"
set "cookies=%userprofile%\Cookies"
set "recent=%userprofile%\Recent"
set "tempinet=%userprofile%\AppData\Local\Microsoft\Windows\INetCache"
set "appdata=%userprofile%\AppData"
set "localappdata=%userprofile%\AppData\Local"
set "systemtemp=C:\Windows\Temp"
set "cacheedge=%localappdata%\Microsoft\Edge\User Data\Default\Cache"
set "cachechrome=%localappdata%\Google\Chrome\User Data\Default\Cache"
set "cachefirefox=%appdata%\Mozilla\Firefox\Profiles"
set "cacheopera=%localappdata%\Opera Software\Opera GX Stable\Cache"
set "lixeira=%systemdrive%\$Recycle.bin"
set "windir=%windir%"
set "programdata=%programdata%"
set "systemroot=%systemdrive%\Windows"

echo Verificando existencia dos diretorios principais... >> "%logfile%"
for %%D in ("%localappdata%" "%appdata%" "%temp%" "%windows%") do (
    if not exist "%%~D" (
        echo AVISO: Diretorio %%~D nao encontrado >> "%logfile%"
    )
)

echo Iniciando processo de limpeza... >> "%logfile%"

powercfg -h off
del /s /f /q "%systemdrive%\hiberfil.sys" 2>nul
del /s /f /q "%systemdrive%\pagefile.sys" 2>nul
powercfg -h on

del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache_*.db" 2>nul
del /s /f /q "%localappdata%\Packages\Microsoft.WindowsStore_8wekyb3d8bbwe\LocalCache\*.*" 2>nul
del /s /f /q "%localappdata%\Packages\*\LocalCache\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Fonts\Cache\*.*" 2>nul
del /s /f /q "%windir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" 2>nul
del /s /f /q "%localappdata%\D3DSCache\*.*" 2>nul
del /s /f /q "%windir%\DirectX Shader Cache\*.*" 2>nul
del /s /f /q "%localappdata%\Steam\htmlcache\*.*" 2>nul
del /s /f /q "%programdata%\Epic\EpicGamesLauncher\Data\Manifests\*.*" 2>nul
del /s /f /q "%localappdata%\Riot Games\Metadata\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\VisualStudio\*.log" 2>nul
del /s /f /q "%appdata%\Microsoft\VisualStudio\*.suo" 2>nul
del /s /f /q "%localappdata%\Microsoft\Media Player\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.*" 2>nul
net stop wuauserv 2>nul
net stop bits 2>nul
del /s /f /q "%windir%\SoftwareDistribution\Download\*.*" 2>nul
net start wuauserv 2>nul
net start bits 2>nul
del /s /f /q "%windir%\Microsoft.NET\Framework\v*\Temporary ASP.NET Files\*.*" 2>nul
del /s /f /q "%windir%\Microsoft.NET\Framework64\v*\Temporary ASP.NET Files\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Teams\Cache\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Teams\blob_storage\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Teams\databases\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Teams\GPUCache\*.*" 2>nul
del /s /f /q "%appdata%\Slack\Cache\*.*" 2>nul
del /s /f /q "%appdata%\Discord\Cache\*.*" 2>nul
del /s /f /q "%appdata%\Discord\Code Cache\*.*" 2>nul
del /s /f /q "%appdata%\Adobe\Common\Media Cache Files\*.*" 2>nul
del /s /f /q "%appdata%\Adobe\Common\Media Cache\*.*" 2>nul
del /s /f /q "%appdata%\Adobe\Common\Team Projects Cache\*.*" 2>nul
del /s /f /q "%programdata%\Microsoft\Windows Defender\Scans\History\Results\Quick\*.*" 2>nul
del /s /f /q "%programdata%\Microsoft\Windows Defender\Scans\History\Results\Resource\*.*" 2>nul
del /s /f /q "%windows%\temp\*.*" 2>nul
del /s /f /q "%windows%\Prefetch\*.exe" 2>nul
del /s /f /q "%windows%\Prefetch\*.dll" 2>nul
del /s /f /q "%windows%\Prefetch\*.pf" 2>nul
del /s /f /q "%windows%\system32\dllcache\*.*" 2>nul
del /s /f /q "%systemdrive%\Temp\*.*" 2>nul
del /s /f /q "%temp%\*.*" 2>nul
del /s /f /q "%history%\*.*" 2>nul
del /s /f /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 2>nul
del /s /f /q "%userprofile%\Local Settings\Temp\*.*" 2>nul
del /s /f /q "%recent%\*.*" 2>nul
del /s /f /q "%cookies%\*.*" 2>nul
del /s /f /q "%tempinet%\*.*" 2>nul
del /s /f /q "%systemtemp%\*.*" 2>nul
del /s /f /q "%localappdata%\Temp\*.*" 2>nul
del /s /f /q "%cacheedge%\*.*" 2>nul
del /s /f /q "%cachechrome%\*.*" 2>nul
for /d %%d in ("%cachefirefox%\*") do del /s /f /q "%%d\cache2\entries\*.*" 2>nul
del /s /f /q "%systemdrive%\Windows\SoftwareDistribution\Download\*.*" 2>nul
del /s /f /q "%programdata%\TEMP\*.*" 2>nul
del /s /f /q "%cacheopera%\*.*" 2>nul
del /s /f /q "%lixeira%\*.*" 2>nul
del /s /f /q "%windir%\Logs\*.*" 2>nul
for /f "tokens=*" %%G in ('wevtutil el') do (wevtutil cl "%%G" 2>nul)
del /s /f /q "%windir%\System32\winevt\Logs\*.*" 2>nul
del /s /f /q "%windir%\System32\LogFiles\*.*" 2>nul
del /s /f /q "%windir%\ServiceProfiles\*.*" 2>nul
del /s /f /q "%windir%\SoftwareDistribution\*.*" 2>nul
del /s /f /q "%windir%\Debug\*.*" 2>nul
del /s /f /q "%windir%\INF\*.log" 2>nul
del /s /f /q "%windir%\Security\Logs\*.*" 2>nul
del /s /f /q "%windir%\SQLServerCompact\*.*" 2>nul
del /s /f /q "%windir%\LastGood\*.*" 2>nul
del /s /f /q "%windir%\Minidump\*.*" 2>nul
del /s /f /q "%windir%\Memory.dmp" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\IconCacheToDelete\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Team\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Terminal Server Client\Cache\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Office\*.*" 2>nul
del /s /f /q "%appdata%\Zoom\Logs\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Teams\Cache\*.*" 2>nul
del /s /f /q "%systemdrive%\Config.Msi\*.*" 2>nul
del /s /f /q "%windir%\Downloaded Program Files\*.*" 2>nul
del /s /f /q "%programdata%\Microsoft\Windows\WER\*.*" 2>nul
del /s /f /q "%programdata%\Microsoft\Windows Defender\Scans\History\*.*" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
del /s /f /q "%localappdata%\Microsoft\Windows\Fonts\*.*" 2>nul
del /s /f /q "%windir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.*" 2>nul
del /s /f /q "%localappdata%\CrashDumps\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Windows\Recent\AutomaticDestinations\*.*" 2>nul
del /s /f /q "%appdata%\Microsoft\Windows\Recent\CustomDestinations\*.*" 2>nul
del /s /f /q "%programdata%\Microsoft\Windows\Power Efficiency Diagnostics\*.*" 2>nul
del /s /f /q "%windir%\Performance\WinSAT\*.*" 2>nul
del /s /f /q "%windir%\Microsoft.NET\Framework\*\Temporary ASP.NET Files\*.*" 2>nul
del /s /f /q "%windir%\Microsoft.NET\Framework64\*\Temporary ASP.NET Files\*.*" 2>nul
del /s /f /q "%userprofile%\AppData\Local\Packages\*\SystemAppData\*.*" 2>nul
del /s /f /q "%localappdata%\Bloxstrap\Downloads\*.*" 2>nul
del /s /f /q "%localappdata%\Bloxstrap\Logs\*.*" 2>nul

ipconfig /flushdns >nul 2>&1
ie4uinit.exe -show >nul 2>&1
fc /s >nul 2>&1
wsreset.exe >nul 2>&1

echo ================================= >> "%logfile%"
echo Resumo da Limpeza: >> "%logfile%"
echo. >> "%logfile%"
echo Data e Hora: %date% %time% >> "%logfile%"
echo. >> "%logfile%"
echo Usuario: %username% >> "%logfile%"
echo. >> "%logfile%"
echo Limpeza concluida com sucesso! >> "%logfile%"
echo ================================= >> "%logfile%"

Title Limpeza completa!

cls

echo.
echo =================================================
echo    LIMPEZA CONCLUIDA COM SUCESSO!
echo    Log salvo em: %logfile%
echo =================================================
echo.
echo.
echo Pressione qualquer tecla para sair da Tela de otimizacao.
pause >nul
