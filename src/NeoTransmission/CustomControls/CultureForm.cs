using System.Windows.Forms;

namespace NeoTransmission.CustomControls
{
    public class CultureForm : Form
    {
        public CultureForm()
        {
            Program.CultureChanger.AddForm(this);
        }
    }
}
