# check connectivity to a server
Test-Connection -ComputerName localhost -Quiet

#Get specific user/group from AD
Import-Module activedirectory
Get-ADUser -Identity alfie -Properties Department,EmailAddress 
#ejemplos de filtro
Get-ADUser -Filter {Department -eq "IT"} 
Get-ADUser -Filter * -SearchBase "OU=SALES,DC=ADATUM,DC=COM" 
Get-ADUser -filter * -Properties * | select {Department -eq "IT"}???? 
Get-ADGroup -Identity "ITUsers" 
Get-ADGroupMember -Identity "ITUsers"  

#Get data from a file
Get-Content -Path E:\ProyectosGitHub\a.txt
$l1=Get-Content -Path E:\ProyectosGitHub\a.txt

foreach ($l in $l1) {
    
    Write-Host "Esta es la línea $l"
}

#mejor el foreach
for ($i=0;$i -le 2;$i++) { 
    Write-Output "Esta es la línea nro $i con el dato $l1[$i]"
}

$l1.GetType()


#ejemplo de filtrado
Get-Service | Where-Object -FilterScript {$_.Status -eq 'Running'}
#igual a 
Get-Service | Where-Object Status -eq running
Get-Process | ?{$_.CPU -gt 10}
#igual a 
Get-Process | ?{$PSItem.CPU -gt 10}
Get-EventLog -LogName Application | Where-Object EventID -EQ 4624 | Select-Object TimeWritten,EventID,Message -Last 10 |fl 
#Listar las carpetas de un directorio (recursivo)
Get-ChildItem -Directory  C:\Users\ -Recurse

#Obtener el nombre de las carpetas dentro de una carpeta
$dir2=Get-ChildItem -Directory C:\Users | Sort-Object Name
$dir2.GetValue(3)
foreach ($d2 in $dir2) {
   $d2.Name
 }


#Obtiene los permisos de las carpetas dentro de una carpeta dada
$path= Get-ChildItem -Directory E:\Soft
foreach ($folder in $path){
    $perm=Get-Acl $folder.FullName
      Write-Host
        Write-Host
          Write-Host
    Write-Host "Nombre de la carpeta= $folder"
    Write-Host
  
        foreach ($p in $perm.Access){     
             
            Write-Host "AccessControType" $p.AccessControlType
            Write-Host "Filesystemright" $p.FileSystemRights
            Write-Host "IdentityReference" $p.IdentityReference
             
        }
   
        
}

#Lo mismo que antes pero lo manda a un archivo
$path= Get-ChildItem -Directory E:\Soft
foreach ($folder in $path){
    $perm=Get-Acl $folder.FullName    
    "Nombre de la carpeta=$folder" | Out-File -FilePath E:\Soft\permisos.txt -Append      
       foreach ($p in $perm.Access){                
            "AccessControType=" + $p.AccessControlType | Out-File -FilePath E:\Soft\permisos.txt -Append
            "Filesystemright=" + $p.FileSystemRights |Out-File -FilePath E:\Soft\permisos.txt -Append
            "IdentityReference=" + $p.IdentityReference |Out-File -FilePath E:\Soft\permisos.txt -Append
       }
   
        
}

#obtener datos de un archivo y mostrar lo que hay después del =
$Contenido= Get-Content -Path E:\Soft\permisos.txt
$Contenido.Length
$Contenido.Trim(2)
$d.Name.Trim(2)
foreach ($C in $Contenido){    
    #$c.ToUpper()    
    #$c.Trim() solo remueve los espacios
    $c
    $Inicio= $c.IndexOf("=")
    $fin= $c.Length
    $c.Substring(($Inicio+1))
 
    
}

 
  #Para saber si in hotfix está instalado
 #Si no se pone el KB trae todos
 help Get-HotFix
 Get-HotFix -id KB4517389
 Get-HotFix | Out-File -FilePath E:\Soft\KB.txt -Append
 Get-HotFix | Out-File -FilePath E:\Soft\KB.csv -Append

 Get-Content  E:\Soft\KB.txt

 #Buscar un texto en un archivo
 Select-String -Path E:\Soft\KB.txt -Pattern "KB4521863"
 #o
 if (Select-String -Path E:\Soft\KB.txt -Pattern "KB4521863")
 {Write-Host "Existe"}
 else
 {Write-Host "No existe"}

