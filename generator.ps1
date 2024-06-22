
$fCtr = ".\in\controller.java"
$fSrv = ".\in\service.java"
$fSrvImpl = ".\in\serviceImpl.java"
$fLgc = ".\in\logic.java"
$fLgcImpl = ".\in\logicImpl.java"
$tCtr = ".\out\ctrl\"
$tSrv = ".\out\srvc\";$tSrvImpl = ".\out\srvc\impl\"
$tLgc = ".\out\logic\";$tLgcImpl = ".\out\logic\impl\"
$eCtr = "Controller.java"
$eSrv = "Service.java";$eSrvImpl = "ServiceImpl.java"
$eLgc = "Logic.java";$eLgcImpl = "LogicImpl.java"
$buf = "Buf"

Remove-Item -Path ".\out\*" -Force -Recurse
New-Item -Path $tCtr -ItemType Directory
New-Item -Path $tSrv -ItemType Directory;New-Item -Path $tSrvImpl -ItemType Directory
New-Item -Path $tLgc -ItemType Directory;New-Item -Path $tLgcImpl -ItemType Directory

Get-Content .\list.txt | ForEach-Object {
    $item = $_
    $itemP = $item.Substring(0,1).ToUpper() + $item.Substring(1)
    $itemC = $item.Substring(0,1).ToLower() + $item.Substring(1)
    
    Copy-Item $fCtr -Destination "$tCtr$item$buf$eCtr"
    (Get-Content -Path "$tCtr$item$buf$eCtr") | ForEach-Object {
      if ($_ -cmatch "xxx") { $_ -replace "xxx", $itemC } else { $_ -replace "XXX", $itemP}
    } | Set-Content -Path "$tCtr$itemP$eCtr"
    Remove-Item -Path "$tCtr$item$buf$eCtr" -Force
    
    Copy-Item $fSrv -Destination "$tSrv$item$buf$eSrv"
    (Get-Content -Path "$tSrv$item$buf$eSrv") | ForEach-Object {
      if ($_ -cmatch "xxx") { $_ -replace "xxx", $itemC } else { $_ -replace "XXX", $itemP}
    } | Set-Content -Path "$tSrv$itemP$eSrv"
    Remove-Item -Path "$tSrv$item$buf$eSrv" -Force
    
    Copy-Item $fSrvImpl -Destination "$tSrvImpl$item$buf$eSrvImpl"
    (Get-Content -Path "$tSrvImpl$item$buf$eSrvImpl") | ForEach-Object {
      if ($_ -cmatch "xxx") { $_ -replace "xxx", $itemC } else { $_ -replace "XXX", $itemP}
    } | Set-Content -Path "$tSrvImpl$itemP$eSrvImpl"
    Remove-Item -Path "$tSrvImpl$item$buf$eSrvImpl" -Force
    
    Copy-Item $fLgc -Destination "$tLgc$item$buf$eLgc"
    (Get-Content -Path "$tLgc$item$buf$eLgc") | ForEach-Object {
      if ($_ -cmatch "xxx") { $_ -replace "xxx", $itemC } else { $_ -replace "XXX", $itemP}
    } | Set-Content -Path "$tLgc$itemP$eLgc"
    Remove-Item -Path "$tLgc$item$buf$eLgc" -Force
    
    Copy-Item $fLgcImpl -Destination "$tLgcImpl$item$buf$eLgcImpl"
    (Get-Content -Path "$tLgcImpl$item$buf$eLgcImpl") | ForEach-Object {
      if ($_ -cmatch "xxx") { $_ -replace "xxx", $itemC } else { $_ -replace "XXX", $itemP}
    } | Set-Content -Path "$tLgcImpl$itemP$eLgcImpl"
    Remove-Item -Path "$tLgcImpl$item$buf$eLgcImpl" -Force
}
Pause
