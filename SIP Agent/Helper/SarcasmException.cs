using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIP_Agent
{
    [Serializable()]
    public class SarcasmException : System.Exception
    {
        public SarcasmException() : base() { }
        public SarcasmException(string message) : base(message) { }
        public SarcasmException(string message, System.Exception inner) : base(message, inner) { }

        protected SarcasmException(System.Runtime.Serialization.SerializationInfo info,
            System.Runtime.Serialization.StreamingContext context) { }
    }

}
