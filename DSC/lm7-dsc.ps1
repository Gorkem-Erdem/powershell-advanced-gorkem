Configuration GorkemBaseline
{
    Node localhost
    {
        WindowsFeature TelnetClient
        {
            Name   = "Telnet-Client"
            Ensure = "Absent"
        }
    }
}