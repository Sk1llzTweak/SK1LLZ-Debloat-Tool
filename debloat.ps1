# SK1LLZ Tweak Debloat Tool v1.0
# Inspirado en Chris Titus Tech

function Show-Menu {
    Clear-Host
    Write-Host "===== SK1LLZ Windows Debloat Tool =====" -ForegroundColor Cyan
    Write-Host "1) Borrar Bloatware"
    Write-Host "2) Desactivar Telemetría"
    Write-Host "3) Limpiar Temporales"
    Write-Host "4) Deshabilitar OneDrive"
    Write-Host "5) Optimizar Servicios"
    Write-Host "6) Salir"
    Write-Host "======================================"
}

function BorrarBloatware {
    Write-Host "Quitando apps basura..." -ForegroundColor Green
    Get-AppxPackage *3dbuilder* | Remove-AppxPackage
    Get-AppxPackage *xbox* | Remove-AppxPackage
    Get-AppxPackage *zune* | Remove-AppxPackage
    # Agregá todas las que quieras
}

function DesactivarTelemetria {
    Write-Host "Desactivando telemetría..." -ForegroundColor Green
    Set-Service DiagTrack -StartupType Disabled
    Stop-Service DiagTrack
}

function LimpiarTemporales {
    Write-Host "Limpiando temporales..." -ForegroundColor Green
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force
}

function DeshabilitarOneDrive {
    Write-Host "Desinstalando OneDrive..." -ForegroundColor Green
    taskkill /f /im OneDrive.exe
    Start-Process "C:\Windows\System32\OneDriveSetup.exe" "/uninstall"
}

function OptimizarServicios {
    Write-Host "Desactivando servicios innecesarios..." -ForegroundColor Green
    Set-Service 'DiagTrack' -StartupType Disabled
    Set-Service 'WSearch' -StartupType Disabled
    Set-Service 'SysMain' -StartupType Disabled
}

do {
    Show-Menu
    $opcion = Read-Host "Seleccioná una opción"
    switch ($opcion) {
        1 { BorrarBloatware }
        2 { DesactivarTelemetria }
        3 { LimpiarTemporales }
        4 { DeshabilitarOneDrive }
        5 { OptimizarServicios }
        6 { Write-Host "Saliendo de SK1LLZ Debloat Tool..." -ForegroundColor Cyan }
        default { Write-Host "Opción inválida." }
    }
    Pause
} while ($opcion -ne 6)

Write-Host "Gracias por usar SK1LLZ Debloat Tool!" -ForegroundColor Yellow