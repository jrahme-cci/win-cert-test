param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $KeyPath,

    [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$false)]
    [System.String]
    $KeyPass
)
$Cert = Import-PfxCertificate -FilePath $KeyPath -Password (ConvertTo-SecureString -String "$KeyPass" -AsPlainText -Force) -CertStoreLocation Cert:\LocalMachine\My
Export-Certificate -Cert $Cert -File c:\Cert.sst -Type SST
Import-Certificate -File c:\cert.sst  -CertStoreLocation Cert:\LocalMachine\Root 
Import-Certificate -File c:\cert.sst -CertStoreLocation Cert:\CurrentUser\My
