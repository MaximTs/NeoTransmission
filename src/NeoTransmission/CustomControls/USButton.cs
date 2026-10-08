using System.Windows.Forms;

namespace NeoTransmission.CustomControls
{
    class USButton : Button
    {
        public USButton()
            : base()
        {
            this.SetStyle(ControlStyles.Selectable, false);
        }
    }
}
