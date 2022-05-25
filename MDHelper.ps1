param([switch] $help)
$end = $true
$text = ""

#region ---WriteonFile---
function writeOnFile {
    param (
        [string] $text
    )
    Add-Content -Path "$workingDirectory\$FileName" -Value $text
    Write-Host "File aggiornato..." -ForegroundColor Green
}
#endregion

#region ---PrintHelp---
function printHelp {
    Write-Host("
    NOME: MDHelper
    SINTASSI: .\MDHelper.ps1 [[-help] <switch>] `n
    COMANDI:
    - [[help]] <switch>: stampa funzione di help  `n
    - [[table]] <string>: inserire dimensioni  [[colonne]] <int> [[righe]] <int> `n `t USAGE: `n `t table`n `t> [colonne] `n `t> [righe]  `n
    - [[heading]] <string>: formatta il testo in heading, specificare le dimensioni(max 6) <int> `n `t USAGE: `n `t> heading`n `t> [grandezza]  `n
    - [[norm]] <string>: non formatta il testo (testo normale)  `n
    - [[strike]] <string>: formatta il testo in barrato  `n
    - [[italic]] <string>: formatta il testo in italico  `n
    - [[bold]] <string>: formatta il testo in grassetto  `n
    - [[bolditalic]] <string>: formatta il testo in italico grassetto  `n
    - [[codeline]] <string>: formatta il testo come linea codice  `n
    - [[codeblock]] <string>: formatta il testo come blocco di codice   `n
    - [[link]] <string>: formatta il testo in link, inserire testo <string> e percorso ipertestuale <string> `n `t USAGE: `n `t> link`n `t> [testo] `n `t> [link]  `n
    - [[quoted]] <string>: formatta il testo in quotato, inserire livello quota <int> (max 10) `n `t USAGE: `n `t> quoted [grandezzaQuota]  `n
    - [[orderedlist]] <string>: formatta il testo in lista ordinata, inserire numero righe `n `t USAGE: `n `t> orderedlist`n `t> [numeroRighe]  `n
    - [[unorderedlist]] <string>: formatta il testo in lista puntata, inserire numero righe `n `t USAGE: `n `t> unorderedlist`n `t> [numeroRighe]  `n
    - [[print]] <string>: stampa lo stato corrente del testo in MD
    - [[end]] <string>: comando per finire la modifica e salvare sul file  `n
    ") -ForegroundColor Blue
}
#endregion

#region ---PrintProgress---
function printProgress {
    param (
        [string] $text
    )
    Write-Host "Current progress:"
    Write-Host $text
}
#endregion

#region ---Help---
if ($help) {
    printHelp
    exit 0
}
#endregion

#region ---Get folder
$workingDirectory = read-host "Inserire cartella di destinazione"
if ($workingDirectory -ne "") {
        
}
else {
    $workingDirectory = ".\"
    write-host "La cartella di lavoro sara' la seguente: $workingDirectory" -ForegroundColor Blue
}
#endregion
#region ---Get fileName
$fileName = read-host "Inserire nome del file (<fileName>.MD)"
if ($fileName -ne "") {
    if ($filename -like "*.MD") {

    }
    else {
        $fileName = "file.MD"
    }
}
else {
    $fileName = "file.MD"
    write-host "Il nome del file sara' il seguente: $fileName" -ForegroundColor Blue
}
if (Test-Path "$workingDirectory\$fileName") {
    Remove-Item "$workingDirectory\$fileName"
}
#endregion
#region ---Create file
New-Item -Path "$workingDirectory" -Name "$fileName" | Out-Null
#endregion
#region ---Insert into file
while ($end) {
    [string] $in = Read-Host "Inserire comando da eseguire"
    [string[]] $arg = $in.Split(" ")
    switch ($arg[0]) {
        #comando -> table
        "table" {
            $text += "`n"
            $x = Read-Host "Colonne"
            $y = Read-Host "Righe"
            $separationRow = "|"
            for ($sep = 0; $sep -lt $x; $sep++ ) {
                $separationRow += ":---:|"
            }
            for ($i = 0; $i -lt $y; $i++) {
                if ($i -eq 1) {
                    $text += $separationRow + "`n"
                }
                for ($j = 0; $j -lt $x; $j++) {
                    $text += "| "
                    $text += Read-Host "Riga $i, Colonna $j"
                    $text += " |"
                }
                $text += "`n"
            }
            break
        }
        #comando -> normal text
        "norm" {
            $text += "`n"
            $text += Read-Host "Testo normale"
            $text += "`n"
        }
        #comando -> striketrough
        "strike" {
            $text += "`n"
            $text += "~~"
            $text += Read-Host "Testo barrato"
            $text += "~~"
            $text += "`n"
        }
        #comando -> italic
        "italic" {
            $text += "`n"
            $text += "_"
            $text += Read-Host "Testo italico"
            $text += "_"
            $text += "`n"
        }
        #comando -> bold
        "bold" {
            $text += "`n"
            $text += "**"
            $text += Read-Host "Testo in grassetto"
            $text += "**"
            $text += "`n"
        }
        #comando -> codeline
        "codeline" {
            $text += "`n"
            $text += "``````"
            $text += Read-Host "Linea di codice"
            $text += "``````"
            $text += "`n"
        }
        #comando -> codeblock
        "codeblock" {
            $text += "`n"
            $text += "```````n"
            $text += Read-Host "Blocco di codice"
            $text += "`n``````"
            $text += "`n"
        }
        #comando -> link
        "link" {
            $text += "`n"
            $text += "["
            $text += Read-Host "Testo del Link"
            $text += "]("
            $text += Read-Host "Percorso ipertestuale"
            $text += ")"
            $text += "`n"
        }
        #comando -> quoted
        "quoted" {
            $text += "`n"
            if ($arg[1].length -ne 0) {
                $tot = $arg[1]
                if ($tot -lt 10) {
                    for ($i = 0; $i -lt $tot; $i++) {
                        $text += ">"
                    }
                    $text += " "
                    $text += Read-Host "Testo quotato $tot volte"
                    $text += "`n"
                }
                else {
                    Write-Host "Errore nell'esecuzione del comando, testo troppo quotato!" -ForegroundColor Red
                }
            }
            else {
                $text += "> "
                $text += Read-Host "Testo quotato"
                $text += "`n"
            }
            break
        }
        #comando -> bold & italic
        "bolditalic" {
            $text += "`n"
            $text += "***"
            $text += Read-Host "Testo italico in grassetto"
            $text += "***"
            $text += "`n"
        }
        #comando -> unordered list
        "unorderedlist" {
            $text += "`n"
            $posList = 1
            $totlines = Read-Host "Numero righe della lista"
            for ($line = 0; $line -lt $totlines; $line++) {
                $text += "- "
                $text += Read-Host "Inserire testo della lista, Riga $posList"
                $text += "`n"
                $posList++
            }     
        }
        #comando -> unordered list
        "orderedlist" {
            $text += "`n"
            $posList = 1
            $totlines = Read-Host "Numero righe della lista"
            for ($line = 1; $line -le $totlines; $line++) {
                $text += "$line. "
                $text += Read-Host "Inserire testo della lista, Riga $posList"
                $text += "`n"
                $posList++
            }
        }
        #comando -> heading
        "heading" {
            $text += "`n"
            $tot = Read-Host "Grandezza heading"
            if ($tot -lt 7) {
                for ($i = 0; $i -lt $tot; $i++) {
                    $text += "#"
                }
                $text += " "
                $text += Read-Host "Inserire testo"                    
                $text += "`n"
                    
            }
            else {
                Write-Host "Errore nell'esecuzione del comando, heading troppo piccolo!" -ForegroundColor Red
            }                    
            break
        }
        "end" {
            $confirm = Read-Host "Sei sicuro di voler salvare nel file? Si[S] No[N]" -ForegroundColor Yellow
            if ($confirm -eq "S" -or $confirm -eq "s") {
                $end = $false
                writeOnFile $text
                #clear-host
            }
            elseif ($confirm -ne "S" -or $confirm -ne "s" -or $confirm -ne "N" -or $confirm -ne "n") {
                Write-Host "Risposta non contemplata..." -ForegroundColor Red
            }
            break
        }
        "help"{
            printHelp
        }
        "print"{
            printProgress $text
        }
        "" {
            Write-Host "Inseire un comando!" -ForegroundColor Red
            break
        }
        default{
            Write-Host "Inseire un comando valido!" -ForegroundColor Red
            break
        }
    }
}
#endregion