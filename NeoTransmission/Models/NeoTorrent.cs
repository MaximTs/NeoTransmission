namespace NeoTransmission.Models
{
    public class NeoTorrent
    {
        /// <summary>
        /// ImageIndex for ObjectListView
        /// </summary>
        public int ImageIndex { get; set; }
        public int Order { get; set; }
        public string Name { get; set; }
        public long Size { get; set; }
        public int Progress { get; set; }
        public int State { get; set; }
        public int Seeds { get; set; }
        public int Peers { get; set; }
    }
}