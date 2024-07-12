# df-mod3-sdm

# Hannah Simonelli

# Task 1 - Get all Windows events and redirect to logs.txt file
Get-WinEvent -ListLog * > C:/Users/hgsim/Documents/df-sdm/df-mod3-sdm/Task1/logs.txt

## Read contents of a text file
$content = Get-Content -Path "contentpages.txt"

## Search for specific text within the content
$searchResult = $content | Select-String -Pattern "more content"


## Display the search results
     if ($searchResult) {
         $searchResult
    } else {
         Write-Host "No matching content found" }
        
## redirecting commands into a text file

ni redirecttext.txt

Add-Content redirecttext.txt "This is an example of a redirect of a command to a file for digital forensics with content!"

## redirecting commands into a text file and encrypting that text file 
ni contentpages.txt
Add-Content content pages.txt "more content pages"
$secureString = "more content pages" | ConvertTo-SecureString -AsPlainText -Force

$secureString | Export-Clixml -Path "encrypted_content.xml"

# Task 2 Manage Permissions

## Specify the access rule (granting Full Control to Administrators)
icacls C:/Users/hgsim/Documents/df-sdm/df-mod3-sdm/Files.txt /grant Administrators:F

## Specify the access rule (granting Read Only for users) 
icacls redirecttext.txt /grant:r "Users:(R)"

# Task 3 PowerShell Scripting
## Create files and subfiles 
### Change the directory to the root project folder
cd C:/Users/hgsim/Documents/df-sdm/df-mod3-sdm

### Create a new folder named data_backup
mkdir data_backup

### Navigate into data_backup folder
cd data_backup

### Create some sample files
ni file1.txt
ni file2.txt

### Create a subfolder named subfolder
mkdir subfolder

### Change directory to be in the subfolder
cd subfolder

### Create a file inside subfolder
ni file3.txt

## Step 1: Copy contents of sourceFolder to destinationFolder
Copy-Item -Path $sourceFolder -Destination $destinationFolder -Recurse -Force

## Step 2: Set permissions to read-only for backup_folder and its contents

icacls $destinationFolder /grant:r "Users:(R)" /T

# Output success message
Write-Output "Folder and files copied to backup_folder and permissions set to read-only successfully."



