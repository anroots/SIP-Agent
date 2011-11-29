using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Media;


namespace SIP_Agent
{
    class QueryCallID
    {

        private int test = 2;
        public static string getCallLink(int test)
        {

            XDocument cl = XDocument.Load("http://projects.sqroot.eu/sip-agent/api/v2/call/recording/" + test);

            try
            {

                var calls = (from call in cl.Descendants("call")
                             select call).Take(1);

                if ((calls.Count()) < 1)
                {
                    return null;
                }
                return calls.FirstOrDefault().Element("url").Value;



            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static void PlayBack(int callid)
        {

            System.Diagnostics.Process.Start(getCallLink(callid));


            /*System.Media.SoundPlayer player = new System.Media.SoundPlayer();

            player.SoundLocation = @"C:\Users\Projekt\Documents\Visual Studio 2010\Projects\kõneidjaplayback\Time to funk.mp3";
            player.Play();*/

        }
    }
}
