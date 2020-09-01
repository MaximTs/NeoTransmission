using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Transmission.API.RPC;
using Transmission.API.RPC.Arguments;
using Transmission.API.RPC.Entity;

namespace NeoTransmissionTest
{
    public class TransmissionApiTest
    {
        [TestFixture]
        public class MethodsTest
        {
            private const string TorrentPath = "\\Data\\ubuntu-10.04.4-server-amd64.iso.torrent";
            private const string Host = "http://192.168.1.143:9091/transmission/rpc";
            private const string SessionId = "";

            private readonly Client _client = new Client(Host, SessionId, "Maxim.Ts", "k23r12i19v89a");
            private readonly string _filePath;

            public MethodsTest()
            {
                string appFullName = System.Reflection.Assembly.GetExecutingAssembly().Location;
                string appDirectory = Path.GetDirectoryName(appFullName);
                _filePath = appDirectory + TorrentPath;
            }

            #region Torrent Test
            [Test]
            public void AddTorrent_Test()
            {
                if (!File.Exists(_filePath))
                    throw new Exception("Torrent file not found");

                var fstream = File.OpenRead(_filePath);
                byte[] filebytes = new byte[fstream.Length];
                fstream.Read(filebytes, 0, Convert.ToInt32(fstream.Length));

                string encodedData = Convert.ToBase64String(filebytes);

                //The path relative to the server (priority than the metadata)
                //string filename = "/DataVolume/shares/Public/Transmission/torrents/ubuntu-10.04.4-server-amd64.iso.torrent";

                var torrent = new NewTorrent
                {
                    //Filename = filename,
                    Metainfo = encodedData,
                    Paused = true
                };

                var newTorrentInfo = _client.TorrentAdd(torrent);

                Assert.IsNotNull(newTorrentInfo);
                Assert.IsTrue(newTorrentInfo.ID != 0);
            }

            [Test]
            public void AddTorrent_Magnet_Test()
            {
                var torrent = new NewTorrent
                {
                    Filename = "magnet:?xt=urn:btih:9e241c218299b1d813275e066f94dbe05bc25e53&dn=Rick.and.Morty.S03E03.720p.HDTV.x264-BATV%5Bettv%5D&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Fzer0day.ch%3A1337&tr=udp%3A%2F%2Fopen.demonii.com%3A1337&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Fexodus.desync.com%3A6969",
                    Paused = false
                };

                var newTorrentInfo = _client.TorrentAdd(torrent);

                Assert.IsNotNull(newTorrentInfo);
                Assert.IsTrue(newTorrentInfo.ID != 0);
            }

            [Test]
            public void GetTorrentInfo_Test()
            {
                var torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);

                Assert.IsNotNull(torrentsInfo);
                Assert.IsNotNull(torrentsInfo.Torrents);
                Assert.IsTrue(torrentsInfo.Torrents.Any());
            }

            [Test]
            public void SetTorrentSettings_Test()
            {
                var torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);
                var torrentInfo = torrentsInfo.Torrents.FirstOrDefault(t => t.Name.Contains("ubuntu"));
                Assert.IsNotNull(torrentInfo, "Torrent not found");

                var trackerInfo = torrentInfo.Trackers.FirstOrDefault();
                Assert.IsNotNull(trackerInfo, "Tracker not found");
                var trackerCount = torrentInfo.Trackers.Length;
                TorrentSettings settings = new TorrentSettings()
                {
                    IDs = new object[] { torrentInfo.HashString },
                    TrackerRemove = new[] { trackerInfo.ID }
                };

                _client.TorrentSet(settings);

                torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS, torrentInfo.ID);
                torrentInfo = torrentsInfo.Torrents.FirstOrDefault();

                Assert.IsFalse(torrentInfo == null);
                Assert.IsFalse(trackerCount == torrentInfo.Trackers.Length);
            }

            [Test]
            public void RenamePathTorrent_Test()
            {
                var torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);
                var torrentInfo = torrentsInfo.Torrents.FirstOrDefault(t => t.Name.Contains("ubuntu"));
                Assert.IsNotNull(torrentInfo, "Torrent not found");

                var result = _client.TorrentRenamePath(torrentInfo.ID, torrentInfo.Files[0].Name, "test_" + torrentInfo.Files[0].Name);

                Assert.IsNotNull(result, "Torrent not found");
                Assert.IsTrue(result.ID != 0);
            }

            [Test]
            public void RemoveTorrent_Test()
            {
                var torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);
                var torrentInfo = torrentsInfo.Torrents.FirstOrDefault(t => t.Name.Contains("Rick.and.Morty"));
                Assert.IsNotNull(torrentInfo, "Torrent not found");

                _client.TorrentRemove(new[] { torrentInfo.ID });

                torrentsInfo = _client.TorrentGet(TorrentFields.ALL_FIELDS);

                Assert.IsFalse(torrentsInfo.Torrents.Any(t => t.ID == torrentInfo.ID));
            }

            #endregion

            #region Session Test

            [Test]
            public void SessionGetTest()
            {
                var info = _client.GetSessionInformation();
                Assert.IsNotNull(info);
                Assert.IsNotNull(info.Version);
            }

            [Test]
            public void ChangeSessionTest()
            {
                //Get current session information
                var sessionInformation = _client.GetSessionInformation();

                //Save old speed limit up
                var oldSpeedLimit = sessionInformation.SpeedLimitUp;

                //Set new session settings
                _client.SetSessionSettings(new SessionSettings() { SpeedLimitUp = 100 });

                //Get new session information
                var newSessionInformation = _client.GetSessionInformation();

                //Check new speed limit
                Assert.AreEqual(newSessionInformation.SpeedLimitUp, 100);

                //Restore speed limit
                newSessionInformation.SpeedLimitUp = oldSpeedLimit;

                //Set new session settinhs
                _client.SetSessionSettings(new SessionSettings() { SpeedLimitUp = oldSpeedLimit });
            }

            #endregion
        }
    }

}
