using System.Windows.Forms;

namespace NeoTransmission.Comparers
{
    interface IListViewItemSorter
    {
        int SortColumn { get; set; }
        SortOrder Order { get; set; }
    }
}
