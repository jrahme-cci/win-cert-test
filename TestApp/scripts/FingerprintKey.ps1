param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $CertificatePath

    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $CertificatePassword
)


try {
  if (!(Test-Path $CertificatePath)) {
    return $null;
  }

  if ($CertificatePassword) {
    $sSecStrPassword = ConvertTo-SecureString -String $CertificatePassword -Force –AsPlainText
  }

  $certificateObject = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
    $certificateObject.Import($CertificatePath, $sSecStrPassword);

  return $certificateObject.Thumbprint
} catch [Exception] {
#
# Catch accounts already added.
  throw $_;
}
