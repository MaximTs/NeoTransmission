using System;

namespace NeoTransmission
{
    public class ResultEventArgs : EventArgs
    {
        public ICommand Result { get; set; }
    }
}
