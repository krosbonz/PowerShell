Configuration mytechiis

{

  Node 'localhost'

  {

    #Install IIS - Enabled via Windows feature

    WindowsFeature IIS

    {

      Ensure = "Present"

      Name = "Web-Server"

    }

    #Install ASP.NET 4.5

    WindowsFeature ASP

    {

      Ensure = "Present"

      Name = "Web-Asp-Net45"

    }

  }

}