###################
# forgottenspiral #
###################

# Before running this script, ensure that your workspace is properly configured, and 7z/git are accessible in your system/user path.

# Define workspace folders.
$workspace_folder = "$env:USERPROFILE\Documents\STALKER-TWEAKED\COP-TWEAKED"
$project_folder = "$workspace_folder\COP-VANILLA-MINI-REPACK"
$release_folder = "$workspace_folder\COP_RELEASE_MINI_REPACK"

# List of PRP configuration or debugging files to delete by specific extension and name.
$prp_files_1 = @(
	".aim_sway"
	".anabiotic_fix"
	".anabiotic_svarog_fix"
	# ".anm"
	".bak"
	".bullet_piercing"
	".cfg"
	# ".dds"
	".disable_grass"
	".exe"
	".flame_on"
	".helmets"
	".high"
	".improved_svarog_display"
	".keep_intro"
	".less_bob"
	".low"
	# ".ltx"
	".medium"
	".no_bob"
	".no_sway"
	".normal"
	".normal_bob"
	".normal_speed"
	# ".ogg"
	".orig_bkup"
	".original"
	".prp"
	".quiet"
	".random_treasure"
	".real_gun_names"
	".removable_quest_items"
	".remove_intro"
	# ".script"
	".skip_intro"
	".slower_speed"
	# ".spawn"
	".stopping_power"
	".superarmor"
	".supershot"
	".txt"
	# ".vs"
	".warfighter"
	".wounding"
	# ".xml"
	# ".xr"	
)
$prp_files_2 = @(
)

# Navigate to the release folder.
Set-Location $release_folder

# Set the full release version.
$release_version = "v0.1"

# Begin release process.
Write-Host "====================" -ForegroundColor Green
Write-Host "Starting..." -ForegroundColor Green
Write-Host "====================" -ForegroundColor Green

# Create a folder for the final release files if it doesn't exist already.
$final_folder = "Mini-Repack_STALKER-COP-Edition_$release_version"
If (Test-Path -Path "$final_folder") {
	Write-host "$final_folder already exists." -ForegroundColor Green
}
Else {
	New-Item "$final_folder" -ItemType Directory -Force
	Write-host "$final_folder created successfully." -ForegroundColor Green
}
Write-Host "====================" -ForegroundColor Green

# Check if releasing is enabled or disabled.
$enable_release = "yes"

If ($enable_release -eq "yes") {
	Write-Host "Releasing is enabled." -ForegroundColor Green
	Write-Host "====================" -ForegroundColor Green

	# Clone the project folder to a temporary directory.
	git clone $project_folder "$final_folder-temporal"
	Write-Host "====================" -ForegroundColor Green

	# Remove unnecessary files from the temporal folder.
	Remove-Item -Path "$final_folder-temporal\.git" -Recurse -Force
	Remove-Item -Path "$final_folder-temporal\.gitattributes" -Recurse -Force
	Remove-Item -Path "$final_folder-temporal\.gitignore" -Recurse -Force
	Remove-Item -Path "$final_folder-temporal\CHANGELOG.md" -Recurse -Force
	Remove-Item -Path "$final_folder-temporal\README.md" -Recurse -Force
	Remove-Item -Path "$final_folder-temporal\Release.ps1" -Recurse -Force

	# Copy files from the temporal folder to the final release folder.
	Copy-Item -Path "$final_folder-temporal\*" -Destination $final_folder -Recurse -Force

	# Remove the temporal folder.
	Remove-Item -Path "$final_folder-temporal" -Recurse -Force

	# Delete PRP configuration or debugging files based on extension and name.
	Get-ChildItem "$final_folder\gamedata" -Recurse | ForEach-Object {
		If ($prp_files_1 -Contains $_.Extension) {
			Remove-Item $_
		}
		Elseif ($prp_files_2 -Contains $_.Name) {
			Remove-Item $_
		}
	}
	
	# Manually delete PRP configuration or debugging files.
	Remove-Item -Path "$final_folder\gamedata\configs\weapons\upgrades\optional" -Recurse -Force
	Remove-Item -Path "$final_folder\gamedata\configs\misc\outfit_upgrades\optional" -Recurse -Force
	Remove-Item -Path "$final_folder\gamedata\configs\environment\weathers\optional" -Recurse -Force
	
	# Delete empty folders.
	$tdc = "$final_folder\gamedata"
	Do {
		$dirs = Get-ChildItem $tdc -directory -recurse | Where-Object { (Get-ChildItem $_.fullName).count -eq 0 } | Select-Object -expandproperty FullName
		$dirs | Foreach-Object { Remove-Item $_ }
	} While ($dirs.count -gt 0)

	# Copy the Instructions and Additional Notes file.
	Copy-Item "$release_folder\Instructions_and_Additional_Notes.txt" -Destination "$final_folder\Instructions_and_Additional_Notes_$release_version.txt" -Force
	Write-Host "====================" -ForegroundColor Green

	# Copy the Readme and Changelog file.
	Copy-Item "$release_folder\Readme_and_Changelog.txt" -Destination "$final_folder\Readme_and_Changelog_$release_version.txt" -Force
	Write-Host "====================" -ForegroundColor Green
}
Else {
	Write-Host "Releasing is disabled." -ForegroundColor Yellow
	Write-Host "====================" -ForegroundColor Yellow
}

# Prompt to ask the user whether to compress the final folder with 7z.
$option = Read-Host -Prompt "Would you like to compress the final folder with 7z? Please type 'y' for yes or any key for no."

# Compress the final folder with 7z if it doesn't exist already.
If (!(Test-Path -Path "$final_folder.7z") -and $option -eq "y") {
	7z.exe a "$final_folder.7z" "$final_folder\"
	Write-Host "Compressed the final folder successfully." -ForegroundColor Green
	Write-Host "====================" -ForegroundColor Green
}
Else {
	Write-Host "Compressed file is uncreated." -ForegroundColor Yellow
	Write-Host "====================" -ForegroundColor Yellow
}

Write-Host "Complete." -ForegroundColor Green
Write-Host "====================" -ForegroundColor Green

Pause
Exit
