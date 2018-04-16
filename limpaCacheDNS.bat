@echo off
cls
:menu
cls
color 80

date /t

echo Computador: %computername%        Usuario: %username%
                   
echo            MENU TAREFAS
echo  ==================================
echo * 1. Esvaziar cache Windows 7      * 
echo * 2. Esvaziar cache windows xp     *
echo * 3. Sair                          * 
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% GEQ 4 goto opcao4

:opcao1
cls
IPCONFIG /RELEASE
echo ==================================
echo *    Comando release Executado   *
echo ==================================
IPCONFIG /FLUSHDNS
echo ==================================
echo *    Comando flush Executado     *
echo ==================================
NET STOP DNSCACHE
echo ==================================
echo *  Parada de cache DNS Executada *
echo ==================================
NET STOP DHCP
echo ==================================
echo *    Parada de DHCP Executada    *
echo ==================================
NET START DNSCACHE
echo ==================================
echo *       DNS reinicializado       *
echo ==================================
NET START DHCP
echo ==================================
echo *      DHCP reinicializado       *
echo ==================================
IPCONFIG /REGISTERDNS
echo ==================================
echo *         DNS registrado         *
echo ==================================
IPCONFIG /RENEW
echo ==================================
echo *           IP renovado          *
echo ==================================
echo ==================================
echo *   Verificando dispositivos     *
echo ==================================
arp -a -d
netsh interface ip delete arpcache
echo ==================================
echo *       Tabela ARP limpa         *
echo ==================================
netsh interface ip delete destinationcache
echo ==================================
echo *       Limpando interface       *
echo ==================================
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset catalog

pause
goto menu

:opcao2
cls
IPCONFIG /RELEASE
echo ==================================
echo *    Comando release Executado   *
echo ==================================
IPCONFIG /FLUSHDNS
echo ==================================
echo *    Comando flush Executado     *
echo ==================================
NET STOP DNSCACHE
echo ==================================
echo *  Parada de cache DNS Executada *
echo ==================================
NET STOP DHCP
echo ==================================
echo *    Parada de DHCP Executada    *
echo ==================================
NET START DNSCACHE
echo ==================================
echo *       DNS reinicializado       *
echo ==================================
NET START DHCP
echo ==================================
echo *      DHCP reinicializado       *
echo ==================================
IPCONFIG /REGISTERDNS
echo ==================================
echo *         DNS registrado         *
echo ==================================
IPCONFIG /RENEW
echo ==================================
echo *           IP renovado          *
echo ==================================
echo ==================================
echo *   Verificando dispositivos     *
echo ==================================
arp -a -d
netsh interface ip delete arpcache
echo ==================================
echo *       Tabela ARP limpa         *
echo ==================================
netsh interface ip delete destinationcache
echo ==================================
echo *       Limpando interface       *
echo ==================================
nbtstat -R
nbtstat -RR
netsh int reset all
netsh routing reset all
netsh routing dump
pause
goto menu

:opcao3
cls
exit

:opcao4
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu