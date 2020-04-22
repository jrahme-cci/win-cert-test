param (
    [parameter(Mandatory = $true)][string] $CertificatePath,
    [parameter(Mandatory = $false)][string] $CertificatePassword
)

if ($CertificatePassword) {
  $sSecStrPassword = ConvertTo-SecureString -String $CertificatePassword -Force –AsPlainText
}

$certificateObject = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$certificateObject.Import($CertificatePath, $sSecStrPassword);

Write-Host $certificateObject.Thumbprint
