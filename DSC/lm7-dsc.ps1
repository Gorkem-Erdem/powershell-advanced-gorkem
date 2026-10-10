Configuration GorkemBaseline
{
    Node localhost
    {
        WindowsFeature TelnetClient
        {
            Name   = "Telnet-Client"
            Ensure = "Absent"
        }
        File BaselineFolder
        {
        DestinationPath = "C:\GorkemBaseline"
        Type            = "Directory"
        Ensure          = "Present"
        }
    }
}