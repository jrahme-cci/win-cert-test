$cert = Import-PfxCertificate -FilePath C:\Users\circleci\project\TestApp\TestApp_TemporaryKey.pfx -Password (ConvertTo-SecureString -String "testpassword" -AsPlainText -Force) -CertStoreLocation Cert:\LocalMachine\My
Export-Certificate -Cert $cert -File c:\cert.sst -Type SST
Import-Certificate -File c:\cert.sst  -CertStoreLocation Cert:\LocalMachine\Root 
Import-Certificate -File c:\cert.sst -CertStoreLocation Cert:\CurrentUser\My 
