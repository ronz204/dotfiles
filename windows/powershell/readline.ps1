
function ConvertTo-AnsiColor([string]$Hex) {
    $h = $Hex.TrimStart('#')
    $r = [Convert]::ToInt32($h.Substring(0, 2), 16)
    $g = [Convert]::ToInt32($h.Substring(2, 2), 16)
    $b = [Convert]::ToInt32($h.Substring(4, 2), 16)
    "`e[38;2;${r};${g};${b}m"
}

Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -Colors @{
    Command            = ConvertTo-AnsiColor '#7AA2F7'
    Parameter          = ConvertTo-AnsiColor '#BB9AF7'
    String             = ConvertTo-AnsiColor '#9ECE6A'
    Operator           = ConvertTo-AnsiColor '#FF9E64'
    Keyword            = ConvertTo-AnsiColor '#FF9E64'
    Variable           = ConvertTo-AnsiColor '#7DCFFF'
    Type               = ConvertTo-AnsiColor '#7DCFFF'
    Number             = ConvertTo-AnsiColor '#E0AF68'
    Member             = ConvertTo-AnsiColor '#C0CAF5'
    Comment            = ConvertTo-AnsiColor '#565F89'
    Error              = ConvertTo-AnsiColor '#F7768E'
    Default            = ConvertTo-AnsiColor '#C0CAF5'
    InlinePrediction   = ConvertTo-AnsiColor '#414868'
}

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Remove-Item Function:\ConvertTo-AnsiColor
