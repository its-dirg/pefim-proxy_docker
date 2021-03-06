Write-Host "Start build"
$repository = "itsdirg/pefim_proxy"

$ssh_path = "c:\Program Files (x86)\Git\bin"
IF (!($Env:Path | Select-String -SimpleMatch $ssh_path)){
	$Env:Path = "${Env:Path};$ssh_path"
}

IF ($(Boot2Docker status) -ne "running"){
	$(Boot2Docker start)
}

IF ($Env:DOCKER_HOST.length -eq 0){
	boot2docker shellinit | Invoke-Expression
}

#Remove windows CR 

$files = gci ../ *.* -File -rec | where {! $_.ps1} | %{$_.FullName}
foreach ($file in $files){
	sed -i 's/\r//' ${file}
}

docker rmi -f "${repository}" 2>&1> $null;
docker build -t="${repository}" .

Write-Host "End build"