param($ip) 

if (!$ip) { 
    echo "PORTSCAN" 
    echo ".\portscan.ps1 192.168.0.1"
} else {
    $topports = 21, 22, 3306, 80, 443 
    try {
        foreach ($porta in $topports) { 
            if (Test-NetConnection -ComputerName $ip -Port $porta -WarningAction SilentlyContinue -InformationLevel Quiet) { 
                echo "Porta $porta aberta"
            } else { 
                echo "Porta $porta fechada" 
            }
        }
    } catch {
        echo "Ocorreu um erro ao verificar as portas."
    }
}