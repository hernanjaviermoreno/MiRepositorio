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


