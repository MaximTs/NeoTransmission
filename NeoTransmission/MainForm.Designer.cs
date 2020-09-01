namespace NeoTransmission
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.olvMain = new BrightIdeasSoftware.DataListView();
            this.olvclOrder = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcName = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcSize = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcProgress = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcState = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcSeeds = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.olvcPeers = ((BrightIdeasSoftware.OLVColumn)(new BrightIdeasSoftware.OLVColumn()));
            this.lblTest = new System.Windows.Forms.Label();
            this.imglStates = new System.Windows.Forms.ImageList(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.olvMain)).BeginInit();
            this.SuspendLayout();
            // 
            // olvMain
            // 
            this.olvMain.AllColumns.Add(this.olvclOrder);
            this.olvMain.AllColumns.Add(this.olvcName);
            this.olvMain.AllColumns.Add(this.olvcSize);
            this.olvMain.AllColumns.Add(this.olvcProgress);
            this.olvMain.AllColumns.Add(this.olvcState);
            this.olvMain.AllColumns.Add(this.olvcSeeds);
            this.olvMain.AllColumns.Add(this.olvcPeers);
            resources.ApplyResources(this.olvMain, "olvMain");
            this.olvMain.AutoGenerateColumns = false;
            this.olvMain.CellEditUseWholeCell = false;
            this.olvMain.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.olvclOrder,
            this.olvcName,
            this.olvcSize,
            this.olvcProgress,
            this.olvcState,
            this.olvcSeeds,
            this.olvcPeers});
            this.olvMain.Cursor = System.Windows.Forms.Cursors.Default;
            this.olvMain.DataSource = null;
            this.olvMain.FullRowSelect = true;
            this.olvMain.HideSelection = false;
            this.olvMain.Name = "olvMain";
            this.olvMain.ShowGroups = false;
            this.olvMain.SmallImageList = this.imglStates;
            this.olvMain.UseCompatibleStateImageBehavior = false;
            this.olvMain.View = System.Windows.Forms.View.Details;
            // 
            // olvclOrder
            // 
            this.olvclOrder.AspectName = "Order";
            this.olvclOrder.ImageAspectName = "";
            resources.ApplyResources(this.olvclOrder, "olvclOrder");
            // 
            // olvcName
            // 
            this.olvcName.AspectName = "Name";
            this.olvcName.ImageAspectName = "ImageIndex";
            resources.ApplyResources(this.olvcName, "olvcName");
            // 
            // olvcSize
            // 
            this.olvcSize.AspectName = "Size";
            resources.ApplyResources(this.olvcSize, "olvcSize");
            // 
            // olvcProgress
            // 
            this.olvcProgress.AspectName = "Progress";
            resources.ApplyResources(this.olvcProgress, "olvcProgress");
            // 
            // olvcState
            // 
            this.olvcState.AspectName = "State";
            resources.ApplyResources(this.olvcState, "olvcState");
            // 
            // olvcSeeds
            // 
            this.olvcSeeds.AspectName = "Seeds";
            resources.ApplyResources(this.olvcSeeds, "olvcSeeds");
            // 
            // olvcPeers
            // 
            this.olvcPeers.AspectName = "Peers";
            resources.ApplyResources(this.olvcPeers, "olvcPeers");
            // 
            // lblTest
            // 
            resources.ApplyResources(this.lblTest, "lblTest");
            this.lblTest.Name = "lblTest";
            // 
            // imglStates
            // 
            this.imglStates.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imglStates.ImageStream")));
            this.imglStates.TransparentColor = System.Drawing.Color.Transparent;
            this.imglStates.Images.SetKeyName(0, "state_all.png");
            this.imglStates.Images.SetKeyName(1, "state_apply.png");
            this.imglStates.Images.SetKeyName(2, "state_download.png");
            this.imglStates.Images.SetKeyName(3, "state_incomplete.png");
            this.imglStates.Images.SetKeyName(4, "state_pause.png");
            this.imglStates.Images.SetKeyName(5, "state_queue.png");
            this.imglStates.Images.SetKeyName(6, "state_reload.png");
            this.imglStates.Images.SetKeyName(7, "state_upload.png");
            this.imglStates.Images.SetKeyName(8, "state_warning.png");
            // 
            // MainForm
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lblTest);
            this.Controls.Add(this.olvMain);
            this.Name = "MainForm";
            this.Load += new System.EventHandler(this.MainForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.olvMain)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblTest;
        private BrightIdeasSoftware.OLVColumn olvclOrder;
        private BrightIdeasSoftware.OLVColumn olvcName;
        private BrightIdeasSoftware.OLVColumn olvcSize;
        private BrightIdeasSoftware.OLVColumn olvcProgress;
        private BrightIdeasSoftware.OLVColumn olvcState;
        private BrightIdeasSoftware.OLVColumn olvcSeeds;
        private BrightIdeasSoftware.OLVColumn olvcPeers;
        private BrightIdeasSoftware.DataListView olvMain;
        private System.Windows.Forms.ImageList imglStates;
    }
}

