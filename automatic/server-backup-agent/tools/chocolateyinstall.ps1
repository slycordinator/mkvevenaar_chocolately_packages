﻿$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url32          = 'http://repo.r1soft.com/trials/ServerBackup-Windows-Agent-x86.msi'
$checksum32     = 'D60904F27CE597E685687CB3B86559FAFD70D340D9BD11D47E48E459779A094F'
$checksumType32 = 'sha256'
$url64          = 'http://repo.r1soft.com/trials/ServerBackup-Windows-Agent-x64.msi'
$checksum64     = 'efad795ad7ebe37ea2bfbdc3ea06d94d698596ad32efd0b24c5a935b04578d5e'
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url32
  checksum       = $checksum32
  checksumType   = $checksumType32
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= $checksumType64
  softwareName   = 'Server Backup Agent*'
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$env:ChocolateyPackageName.$env:ChocolateyPackageVersion.log`""
  validExitCodes= @(0,1641,3010)
}

Install-ChocolateyPackage @packageArgs
