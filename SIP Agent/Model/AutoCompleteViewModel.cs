using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.ObjectModel;

namespace SIP_Agent.Model
{
    class AutoCompleteViewModel
    {
        public ObservableCollection<AutoComplete> ACName { get; set; }

        public AutoCompleteViewModel()
        {
            ObservableCollection<AutoComplete> ACName = new ObservableCollection<AutoComplete>();

            // ACName.Add;
            //userBox.ItemsSource = ACName;

            //ACName.Add();

            //userBox.ItemsSource = ACName;
        }

        public void AddValues(string fName, string lName)
        {
            AutoComplete ACName = new AutoComplete();
            ACName.first_name = fName;
            ACName.last_name = lName;

            // this.ACName.Add(fName);
            //this.ACName.Add(lName);


            //this.ACName.Add(fName);
        }

    }

}
