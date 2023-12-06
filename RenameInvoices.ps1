$pdfDirectory = 'C:\Users\robin.weston\Downloads\test'  #Original Folder


Add-Type -path "C:\ps\itextsharp.dll"

Get-ChildItem "$pdfDirectory" -Filter "*.pdf" | foreach {  
    $pdf = New-Object iTextSharp.text.pdf.pdfreader -ArgumentList $_.FullName
    
        $textLines=[char[]]$pdf.GetPageContent(1) -join "" -split "`n"
        foreach ($textLine in $textLines){
            if ($textLine -match ".*PSI-(?<No>\d\d\d\d\d\d).*"){
                $InvoiceNo = "PSI-" + $Matches.No
            } 
        }
        $newName = "InnoMax - " + $InvoiceNo + ".pdf"
        Rename-Item -Path $_.FullName -NewName $NewName  
}
