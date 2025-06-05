# **PROGRAMAS BASICOS XERIFE TECH**

# Fun��o para instalar programas usando winget
function Install-Program {
    param (
        [string]$ProgramId
    )
    Write-Host "Instalando $ProgramId..."
    winget install --id $ProgramId -e --silent
}

# Lista de programas b�sicos
$programs = @(
    @{Name="Google Chrome"; Id="Google.Chrome"},
    @{Name="Mozilla Firefox"; Id="Mozilla.Firefox"},
    @{Name="VLC Media Player"; Id="VideoLAN.VLC"},
    @{Name="Spotify"; Id="Spotify.Spotify"},
    @{Name="Audacity"; Id="Audacity.Audacity"},
    @{Name="7-Zip"; Id="7zip.7zip"},
    @{Name="LibreOffice"; Id="TheDocumentFoundation.LibreOffice"},
    @{Name="Notepad++"; Id="Notepad++.Notepad++"},
    @{Name="Visual Studio Code"; Id="Microsoft.VisualStudioCode"},
    @{Name="Git"; Id="Git.Git"},
    @{Name="Docker Desktop"; Id="Docker.DockerDesktop"},
    @{Name="GIMP"; Id="GIMP.GIMP"},
    @{Name="Blender"; Id="BlenderFoundation.Blender"},
    @{Name="Steam"; Id="Valve.Steam"},
    @{Name="Discord"; Id="Discord.Discord"},
    @{Name="CrystalDiskInfo"; Id="CrystalDewWorld.CrystalDiskInfo"},
    @{Name="TreeSize Free"; Id="JAMSoftware.TreeSizeFree"},
    @{Name="CCleaner"; Id="Piriform.CCleaner"},
    @{Name="Krita"; Id="Krita.Krita"},
    @{Name="qBittorrent"; Id="qbittorrent.qBittorrent"},
    @{Name="Epic Games Launcher"; Id="EpicGames.EpicGamesLauncher"},
    @{Name="Origin"; Id="ElectronicArts.Origin"},
    @{Name="GOG Galaxy"; Id="GOG.Galaxy"},
    @{Name="Battle.net"; Id="Blizzard.BattleNet"},
    @{Name="Python"; Id="Python.Python"},
    @{Name="Mozilla Thunderbird"; Id="Mozilla.Thunderbird"},
    @{Name="Inkscape"; Id="Inkscape.Inkscape"},
    @{Name="OpenOffice"; Id="OpenOffice.OpenOffice"},
    @{Name="Brave"; Id="BraveSoftware.BraveBrowser"},
    @{Name="Syncthing"; Id="syncthing.syncthing"},
    @{Name="Stremio"; Id="Stremio.Stremio"}
)

# Exibir menu para instala��o
Write-Host "Selecione os programas que deseja instalar:"
for ($i = 0; $i -lt $programs.Count; $i++) {
    Write-Host "$($i + 1). $($programs[$i].Name)"
}
Write-Host "0. Instalar todos"

# Ler sele��o do usu�rio
$selection = Read-Host "Digite o n�mero da sua escolha (separe m�ltiplas sele��es com v�rgulas)"

if ($selection -eq "0") {
    # Instalar todos os programas
    foreach ($program in $programs) {
        Install-Program -ProgramId $program.Id
    }
} else {
    # Instalar programas selecionados pelo usu�rio
    $selectedPrograms = $selection -split ","
    foreach ($index in $selectedPrograms) {
        $index = [int]$index - 1
        if ($index -ge 0 -and $index -lt $programs.Count) {
            Install-Program -ProgramId $programs[$index].Id
        }
    }
}

Write-Host "Instala��o conclu�da!"