using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using NeoTransmission.Models;
using Transmission.API.RPC;
using Transmission.API.RPC.Entity;

namespace NeoTransmission
{
    public partial class MainForm : Form
    {
        #region Fields

        private Client _client;

        #endregion

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            ConnectTransmission();
            ViewTorrents();
        }

        private void ConnectTransmission()
        {
            // TODO: Read from settings.
            string host = "http://192.168.1.143:9091/transmission/rpc";
            string sessionId = string.Empty;
            string login = "Maxim.Ts";
            string password = "k23r12i19v89a";

            _client = new Client(host, sessionId, login, password);
        }

        private void ViewTorrents()
        {
            var torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);
            var torrents = torrentsInfo.Torrents;

            var neoTorrents = new List<NeoTorrent>(torrents.Length);
            foreach (TorrentInfo torrent in torrents)
            {
                var neoTorrent = new NeoTorrent
                {
                    ImageIndex = 0,
                    Order = torrent.ID,
                    Name = torrent.Name,
                    Size = torrent.TotalSize,
                    Progress = (int) ((decimal) torrent.PieceSize / torrent.TotalSize * 100m),
                    State = torrent.Status,
                    Peers = torrent.Peers.Length,
                    Seeds = torrent.SeedIdleLimit
                };
                neoTorrents.Add(neoTorrent);
            }

            olvMain.DataSource = neoTorrents;
        }
    }
}